USE stuDB
GO
/*---检测是否存在：存储过程存放在系统表sysobjects中---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---创建存储过程----*/
CREATE PROCEDURE proc_stu 
  @writtenPass int,
  @labPass int
  AS
    print '笔试及格线：'+convert(varchar(5),@writtenPass)
    print '机试及格线：'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           参加本次考试没有通过的学员：'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
GO

/*---调用存储过程----*/
--假定本次考试机试偏难，机试的及格线定为55分，笔试及格线定为60分。
EXEC proc_stu 60,55  --或这样调用：EXEC proc_stu @labPass=55,@writtenPass=60

