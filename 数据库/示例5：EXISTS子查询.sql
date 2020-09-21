
SELECT * FROM stuInfo
SELECT * FROM stumarks

/*--采用EXISTS子查询，进行酌情加分--*/
IF EXISTS (SELECT * FROM stuMarks WHERE writtenExam>80)
  BEGIN
    print '本班有人笔试成绩高于80分，每人只加2分，加分后的成绩为：'
    UPDATE stuMarks SET writtenExam=writtenExam+2
    SELECT * FROM stuMarks
  END
ELSE
  BEGIN
    print '本班无人笔试成绩高于80分，每人可以加5分，加分后的成绩为：'
    UPDATE stuMarks SET writtenExam=writtenExam+5
    SELECT * FROM stuMarks
  END
GO

/*--采用NOT EXISTS子查询，根据试题难度加分--*/
IF NOT EXISTS (SELECT * FROM stuMarks WHERE writtenExam>60 AND labExam>60)
  BEGIN
    print '本班无人通过考试，试题偏难，每人加3分，加分后的成绩为：'
    UPDATE stuMarks SET writtenExam=writtenExam+3,labExam=labExam+3
    SELECT * FROM stuMarks
  END
ELSE
  BEGIN
    print '本班考试成绩一般，每人只加1分，加分后的成绩为：'
    UPDATE stuMarks SET writtenExam=writtenExam+1,labExam=labExam+1
    SELECT * FROM stuMarks
  END
GO