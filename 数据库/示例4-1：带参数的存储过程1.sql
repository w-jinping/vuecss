USE stuDB
GO
/*---����Ƿ���ڣ��洢���̴����ϵͳ��sysobjects��---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---�����洢����----*/
CREATE PROCEDURE proc_stu 
  @writtenPass int,
  @labPass int
  AS
    print '���Լ����ߣ�'+convert(varchar(5),@writtenPass)
    print '���Լ����ߣ�'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           �μӱ��ο���û��ͨ����ѧԱ��'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
GO

/*---���ô洢����----*/
--�ٶ����ο��Ի���ƫ�ѣ����Եļ����߶�Ϊ55�֣����Լ����߶�Ϊ60�֡�
EXEC proc_stu 60,55  --���������ã�EXEC proc_stu @labPass=55,@writtenPass=60

