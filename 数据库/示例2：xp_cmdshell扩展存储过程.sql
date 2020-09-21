Purpose: xp_cmdshell扩展存储过程的使用
USE master
GO
/*---创建数据库bankDB，保存在D:\bank---*/
EXEC xp_cmdshell 'mkdir d:\bank', NO_OUTPUT  --创建文件夹D:\bank 


--创建建库bankDB
IF exists(SELECT * FROM sysdatabases WHERE name='bankDB')
  DROP DATABASE bankDB
GO

CREATE DATABASE bankDB
 ON
 (
  NAME='bankDB_data',
  FILENAME='d:\bank\bankDB_data.mdf',
  SIZE=1mb,
  FILEGROWTH=15%
 )
 LOG ON
 (
  NAME= 'bankDB_log',
  FILENAME='d:\bank\bankDB_log.ldf',
  SIZE=1mb,
  FILEGROWTH=15%
 )
GO

EXEC xp_cmdshell 'dir D:\bank\' --查看文件




