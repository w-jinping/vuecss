USE master
GO
/*---����Ƿ��Ѵ���productDB���ݿ⣺��ѯmaster���ݿ��е�ϵͳ��sysdatabases---*/
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'productDB')
	DROP DATABASE productDB
GO
EXEC xp_cmdshell 'mkdir D:\SQL'  --����DOS������ļ��У������½ڽ�����
/*-----����--------*/
CREATE DATABASE productDB
 ON 
 (
  /*----�����ļ��ľ�������--*/
  NAME = 'proDB_data', --�������ļ����߼���
  FILENAME = 'D:\SQL\proDB_data.mdf' , --�������ļ���������
  SIZE = 10 MB,  --�������ļ���ʼ��С
  FILEGROWTH = 20%   --�������ļ���������
 ) 
 LOG ON 
 (
  /*----��־�ļ��ľ�������������������ͬ��--*/
  NAME = 'proDB_log', 
  FILENAME = 'D:\SQL\proDB_log.ldf' ,
  SIZE = 1MB, 
  MAXSIZE = 10MB,
  FILEGROWTH = 20%
 )
GO