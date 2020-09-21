USE stuDB
GO
/*---检测是否存在：存储过程存放在系统表sysobjects中---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---创建存储过程----*/
CREATE PROCEDURE proc_stu
  AS
    DECLARE @writtenAvg float,@labAvg float --笔试和机试平均分变量
    SELECT @writtenAvg=AVG(writtenExam), @labAvg=AVG(labExam) FROM stuMarks
    print '笔试平均分：'+convert(varchar(5),@writtenAvg)  
    print '机试平均分：'+convert(varchar(5),@labAvg)
    IF (@writtenAvg>70 AND @labAvg>70)
       print '本班考试成绩：优秀'
    ELSE
       print '本班考试成绩：较差'
    print '--------------------------------------------------'
    print '           参加本次考试没有通过的学员：'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<60 OR labExam<60 
GO

/*---调用存储过程----*/
EXEC proc_stu  --调用存储过程的语法：EXEC 过程名 [参数]
