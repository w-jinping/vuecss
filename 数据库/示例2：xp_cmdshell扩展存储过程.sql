Purpose: xp_cmdshell��չ�洢���̵�ʹ��
USE master
GO
/*---�������ݿ�bankDB��������D:\bank---*/
EXEC xp_cmdshell 'mkdir d:\bank', NO_OUTPUT  --�����ļ���D:\bank 


--��������bankDB
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

EXEC xp_cmdshell 'dir D:\bank\' --�鿴�ļ�




