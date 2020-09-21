USE stuDB
GO
/*---����Ƿ���ڣ��洢���̴����ϵͳ��sysobjects��---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---�����洢����----*/
CREATE PROCEDURE proc_stu 
  @notpassSum int OUTPUT, --OUTPUT�ؼ��֣�������Ϊ�������
  @writtenPass int=60,  --Ĭ�ϲ����ź�
  @labPass int=60       --Ĭ�ϲ����ź�
  AS
    print '���Լ����ߣ�'+convert(varchar(5),@writtenPass)
       + '   ���Լ����ߣ�'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           �μӱ��ο���û��ͨ����ѧԱ��'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
    /*--ͳ�Ʋ�����û��ͨ�����Ե�ѧԱ����--*/
    SELECT @notpassSum=COUNT(stuNo)FROM stuMarks
      WHERE writtenExam<@writtenPass OR labExam<@labPass 
    
GO

/*---���ô洢����----*/
DECLARE @sum int
EXEC proc_stu @sum OUTPUT ,64   --���Լ����߲���Ĭ��ֵ�����Լ�����64�֣����Լ�����60�֡�
print '--------------------------------------------------'
IF @sum>=3
  print 'δͨ��������'+convert(varchar(5),@sum)+ '��,����60%,��������߻�Ӧ�µ�'
ELSE
  print 'δͨ��������'+convert(varchar(5),@sum)+ '��,�ѿ�����60%���£��������������'
GO


