/**---����Ӫҵ���ܵ�¼�ʻ�---*/
EXEC sp_addlogin 'trafficManager', 'manager'
/*---����ӪҵԱ��¼�ʻ�---*/
EXEC sp_addlogin 'seller','seller'
GO
/*---�������ݿ��û�---*/
USE productDB
GO
EXEC sp_grantdbaccess 'trafficManager','manager'
EXEC sp_grantdbaccess 'seller','seller'
GO
/*---���½��������ݿ��û�����Ȩ��---*/
USE productDB
GO
GRANT select,insert,update,delete on proInfo to manager
GRANT select on proInfo to seller
GO