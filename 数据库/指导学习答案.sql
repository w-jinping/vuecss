--1.题
USE bbsDB
GO
SELECT * FROM bbsTopic WHERE TID NOT IN 
                   (SELECT RtID FROM bbsReply)

USE stuDB
GO
SELECT top 1 * FROM stuInfo 
  WHERE  stuNo NOT IN (SELECT top 1 stuNo FROM stuInfo)


--2.题：产生随机卡号的存储过程(一般用当前月份数\当前秒数\当前毫秒数乘以一定的系数作为随机种子)
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_randCardID' )
  DROP PROCEDURE  proc_randCardID
GO
CREATE PROCEDURE proc_randCardID
  @randCardID char(19) OUTPUT,
  @frontNo char(10)='1010 3576 '
  AS
    DECLARE @r numeric(15,8) 
    DECLARE @tempStr  char(10)
    SELECT  @r=RAND((DATEPART(mm, GETDATE()) * 100000 )+ (DATEPART(ss, GETDATE()) * 1000 )
                  + DATEPART(ms, GETDATE()) )
    set @tempStr=convert(char(10),@r) --产生0.xxxxxxxx的数字,我们需要小数点后的八位数字 
    set @randCardID=@frontNo+SUBSTRING(@tempStr,3,4)+' '+SUBSTRING(@tempStr,7,4)  --组合为规定格式的卡号
GO
--测试产生随机卡号
DECLARE @mycardID char(19) 
EXECUTE proc_randCardID @mycardID OUTPUT
print '产生的随机卡号为：'+@mycardID
GO

--3.题：

USE master
GO
/*$$$$$$$$$$$$$建库$$$$$$$$$$$$$$$$$$$$$$$$*/
--检验数据库是否存在，如果为真，删除此数据库--
IF exists(SELECT * FROM sysdatabases WHERE name='STU')
  DROP DATABASE STU
GO
CREATE DATABASE STU
GO

USE STU
GO
CREATE TABLE S  --学员信息表
(
  SID CHAR(8) NOT NULL,  --学号
  SN  CHAR(10) NOT NULL ,     --姓名
  SD  CHAR(10) NOT NULL,    --所属单位
  SA  CHAR(10) NOT NULL    --年龄
)
GO
CREATE TABLE C  --课程表
(
  CID  CHAR(10) NOT NULL,    --课程编号
  CN  CHAR(20) NOT NULL  --课程名称
)
GO
CREATE TABLE SC  --成绩表
(
  CID  CHAR(10) NOT NULL,    --课程编号
  SID  CHAR(10) NOT NULL,  --学号
  G  CHAR(10) NOT NULL   --成绩
)
GO

/*--插入数据--*/
INSERT INTO S(SID,SN,SD,SA)VALUES('1001','林林','中国汽车','28')
INSERT INTO S(SID,SN,SD,SA)VALUES('1002','白杨','北大青鸟','30')
INSERT INTO C(CID,CN)VALUES('s001','税收基础')
INSERT INTO C(CID,CN)VALUES('s002','初级韩语')
INSERT INTO C(CID,CN)VALUES('s003','雅思英语')
INSERT INTO SC(CID,SID,G)VALUES('s001','1001','85')
INSERT INTO SC(CID,SID,G)VALUES('s002','1001','76')
INSERT INTO SC(CID,SID,G)VALUES('s003','1002','90')


--4.题：
--查看结果
  SELECT SN,SD FROM S WHERE [SID] IN(SELECT [SID] FROM C,SC WHERE C.[CID]=SC.[CID] AND CN='税收基础')
GO

SELECT 姓名=(select SN from S where SID=SC.SID),所在单位=(select SD from S where SID=SC.SID),年龄=(select SA from S where SID=SC.SID),课程名称=(select CN from C where CID=SC.CID),成绩=G FROM SC
GO

SELECT COUNT(DISTINCT [SID]) as 学员人数 FROM SC
GO