USE stuDB
GO
/*---����Ƿ���ڣ��洢���̴����ϵͳ��sysobjects��---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---�����洢����----*/
CREATE PROCEDURE proc_stu 
  @writtenPass int=60,
  @labPass int=60
  AS
    print '���Լ����ߣ�'+convert(varchar(5),@writtenPass)
       + '   ���Լ����ߣ�'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           �μӱ��ο���û��ͨ����ѧԱ��'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
GO

/*---���ô洢����----*/
EXEC proc_stu   --������Ĭ��ֵ�����Ժͻ��Լ����߶�Ϊ60��

EXEC proc_stu 64  --���Բ���Ĭ��ֵ�����Լ�����64�֣����Լ�����60�֡�

EXEC proc_stu 60,55   --��������Ĭ��ֵ�����Լ�����60�֣����Լ�����55�֡�

--����ĵ��÷�ʽ��EXEC proc_stu  ,55  --ϣ�����Բ���Ĭ��ֵ�����Լ�����55��
--��ȷ�ĵ��÷�ʽ��EXEC proc_stu @labPass=55   --���Բ���Ĭ��ֵ�����Լ�����55��

