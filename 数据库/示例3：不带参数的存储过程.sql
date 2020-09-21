USE stuDB
GO
/*---����Ƿ���ڣ��洢���̴����ϵͳ��sysobjects��---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---�����洢����----*/
CREATE PROCEDURE proc_stu
  AS
    DECLARE @writtenAvg float,@labAvg float --���Ժͻ���ƽ���ֱ���
    SELECT @writtenAvg=AVG(writtenExam), @labAvg=AVG(labExam) FROM stuMarks
    print '����ƽ���֣�'+convert(varchar(5),@writtenAvg)  
    print '����ƽ���֣�'+convert(varchar(5),@labAvg)
    IF (@writtenAvg>70 AND @labAvg>70)
       print '���࿼�Գɼ�������'
    ELSE
       print '���࿼�Գɼ����ϲ�'
    print '--------------------------------------------------'
    print '           �μӱ��ο���û��ͨ����ѧԱ��'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<60 OR labExam<60 
GO

/*---���ô洢����----*/
EXEC proc_stu  --���ô洢���̵��﷨��EXEC ������ [����]
