USE stuDB
GO
/*---检测是否存在：存储过程存放在系统表sysobjects中---*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_stu' )
  DROP PROCEDURE  proc_stu
GO
/*---创建存储过程----*/
CREATE PROCEDURE proc_stu 
  @notpassSum int OUTPUT, --OUTPUT关键字，否则视为输入参数
  @writtenPass int=60,  --默认参数放后
  @labPass int=60       --默认参数放后
  AS
    print '笔试及格线：'+convert(varchar(5),@writtenPass)
       + '   机试及格线：'+convert(varchar(5),@labPass)
    print '--------------------------------------------------'
    print '           参加本次考试没有通过的学员：'
    SELECT stuName,stuInfo.stuNo,writtenExam,labExam FROM  stuInfo
      INNER JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
         WHERE writtenExam<@writtenPass OR labExam<@labPass 
    /*--统计并返回没有通过考试的学员人数--*/
    SELECT @notpassSum=COUNT(stuNo)FROM stuMarks
      WHERE writtenExam<@writtenPass OR labExam<@labPass 
    
GO

/*---调用存储过程----*/
DECLARE @sum int
EXEC proc_stu @sum OUTPUT ,64   --机试及格线采用默认值：笔试及格线64分，机试及格线60分。
print '--------------------------------------------------'
IF @sum>=3
  print '未通过人数：'+convert(varchar(5),@sum)+ '人,超过60%,及格分数线还应下调'
ELSE
  print '未通过人数：'+convert(varchar(5),@sum)+ '人,已控制在60%以下，及格分数线适中'
GO


