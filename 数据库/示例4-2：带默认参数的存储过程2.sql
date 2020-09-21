USE stuDB
GO
/*---检测是否存在：存储过程存放在系统表sysobjects中---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---创建存储过程----*/
CREATE PROCEDURE proc_stu 
  @writtenPass int=60,
  @labPass int=60
  AS
    print '笔试及格线：'+convert(varchar(5),@writtenPass)
       + '   机试及格线：'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           参加本次考试没有通过的学员：'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
GO

/*---调用存储过程----*/
EXEC proc_stu   --都采用默认值：笔试和机试及格线都为60分

EXEC proc_stu 64  --机试采用默认值：笔试及格线64分，机试及格线60分。

EXEC proc_stu 60,55   --都不采用默认值：笔试及格线60分，机试及格线55分。

--错误的调用方式：EXEC proc_stu  ,55  --希望笔试采用默认值，机试及格线55分
--正确的调用方式：EXEC proc_stu @labPass=55   --笔试采用默认值，机试及格线55分

