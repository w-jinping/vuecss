SELECT * FROM stuInfo
/*--�����������--*/
INSERT INTO stuMarks VALUES('S271817','s25318',60,52)
SELECT * FROM stumarks

/*--���ֱ��������Ӳ�ѯ--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo = (SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO

/*--����IN�Ӳ�ѯ--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo IN (SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO

