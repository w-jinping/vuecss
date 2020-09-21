USE master
GO
/*---检查是否已存在productDB数据库：查询master数据库中的系统表sysdatabases---*/
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'productDB')
	DROP DATABASE productDB
GO
EXEC xp_cmdshell 'mkdir D:\SQL'  --调用DOS命令创建文件夹，后续章节将讲解
/*-----建库--------*/
CREATE DATABASE productDB
 ON 
 (
  /*----数据文件的具体描述--*/
  NAME = 'proDB_data', --主数据文件的逻辑名
  FILENAME = 'D:\SQL\proDB_data.mdf' , --主数据文件的物理名
  SIZE = 10 MB,  --主数据文件初始大小
  FILEGROWTH = 20%   --主数据文件的增长率
 ) 
 LOG ON 
 (
  /*----日志文件的具体描述，各参数含义同上--*/
  NAME = 'proDB_log', 
  FILENAME = 'D:\SQL\proDB_log.ldf' ,
  SIZE = 1MB, 
  MAXSIZE = 10MB,
  FILEGROWTH = 20%
 )
GO