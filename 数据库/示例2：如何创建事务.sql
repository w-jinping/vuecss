USE stuDB
GO
--恢复原来的数据
--UPDATE bank SET currentMoney=currentMoney-1000 WHERE customerName='李四' 
SET NOCOUNT ON --不显示受影响的行数信息
print '查看转帐事务前的余额'
SELECT * FROM bank  
GO

/*--开始事务（指定事务从此处开始，后续的T-SQL语句都是一个整体--*/
BEGIN TRANSACTION 
/*--定义变量，用于累计事务执行过程中的错误--*/
DECLARE @errorSum INT 
SET @errorSum=0  --初始化为0，即无错误

/*--转帐：张三的帐户少1000元，李四的帐户多1000元*/
UPDATE bank SET currentMoney=currentMoney-800 WHERE customerName='张三'
SET @errorSum=@errorSum+@@error  --累计是否有错误
UPDATE bank SET currentMoney=currentMoney+800 WHERE customerName='李四'
SET @errorSum=@errorSum+@@error  --累计是否有错误

print '查看转帐事务过程中的余额'
SELECT * FROM bank 

/*--根据是否有错误，确定事务是提交还是撤销---*/
IF @errorSum<>0  --如果有错误
  BEGIN
    print '交易失败，回滚事务'
    ROLLBACK TRANSACTION 
  END  
ELSE
  BEGIN
    print '交易成功，提交事务，写入硬盘，永久的保存'
    COMMIT TRANSACTION   
  END
GO

print '查看转帐事务后的余额'
SELECT * FROM bank  
GO