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
    /*------------------------错误处理---------------------------*/
    IF  (NOT @writtenPass BETWEEN 0 AND 100) OR(NOT @labPass BETWEEN 0 AND 100)
       BEGIN
         RAISERROR ('及格线错误，请指定0－100之间的分数，统计中断退出',16,1)
         RETURN  --立即返回，退出存储过程
       END
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
DECLARE @sum int,@t int
EXEC proc_stu @sum OUTPUT ,888   --笔试及格线误输入604分
SET @t=@@ERROR --如果出现了错误，执行了RAISERROR语句，系统全局@@ERROR将不等于0，表示有错
print  '错误号：'+convert(varchar(5),@t)
IF @t<>0  
   RETURN  --退出批处理，后续语句不再执行
print '--------------------------------------------------'
IF @sum>=3
  print '未通过人数：'+convert(varchar(5),@sum)+ '人,超过60%,及格分数线还应下调'
ELSE
  print '未通过人数：'+convert(varchar(5),@sum)+ '人,已控制在60%以下，及格分数线适中'
GO


