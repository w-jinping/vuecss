select * from stuinfo
select * from stumarks

/*--ʵ�ַ���һ�����ñ�����--*/
SELECT stuName FROM stuInfo INNER JOIN stuMarks 
   ON stuInfo.stuNo=stuMarks.stuNo WHERE writtenExam=60

/*--ʵ�ַ������������Ӳ�ѯ--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo=(SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO