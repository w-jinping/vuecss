SELECT * FROM stuInfo
/*--插入测试数据--*/
INSERT INTO stuMarks VALUES('S271817','s25318',60,52)
SELECT * FROM stumarks

/*--出现编译错误的子查询--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo = (SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO

/*--采用IN子查询--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo IN (SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO

