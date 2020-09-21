
SELECT * FROM stuInfo
SELECT * FROM stumarks

/*--采用IN子查询，查看参加考试的学员名单--*/
SELECT stuName FROM stuInfo
  WHERE stuNo IN (SELECT stuNo FROM stuMarks)
GO

/*--采用NOT IN子查询，查看未参加考试的学员名单--*/
SELECT stuName FROM stuInfo
  WHERE stuNo NOT IN (SELECT stuNo FROM stuMarks)
GO
