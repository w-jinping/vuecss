/*--举例：为什么需要事务--*/
--同一银行，如都是农行的帐号，可以直接转账
/*－--------------建表-----------------*/
USE stuDB
GO

--创建农行帐户表bank
IF EXISTS(SELECT * FROM sysobjects WHERE name='bank')
   DROP TABLE bank
GO
 
CREATE TABLE bank
(
    customerName CHAR(10), --顾客姓名
    currentMoney MONEY     --当前余额
)
GO

/*---添加约束：根据银行规定，帐户余额不能少于1元，除非销户----*/
ALTER TABLE bank
  ADD CONSTRAINT CK_currentMoney CHECK(currentMoney>=1)
GO

/*--插入测试数据：张三开户，开户金额为800 ；李四开户，开户金额1 ---*/
INSERT INTO bank(customerName,currentMoney) VALUES('张三',1000)
INSERT INTO bank(customerName,currentMoney) VALUES('李四',1)
GO
--查看结果
SELECT * FROM bank

GO

/*--转帐测试：张三希望通过转账，直接汇钱给李四1000元--*/
--我们可能会这样这样写代码
--张三的帐户少1000元，李四的帐户多1000元
UPDATE bank SET currentMoney=currentMoney-1000 
     WHERE customerName='张三'
UPDATE bank SET currentMoney=currentMoney+1000 
     WHERE customerName='李四'
GO
--再次查看结果，结果发现了什么严重的错误?如何解决呢？
SELECT * FROM bank
GO
























