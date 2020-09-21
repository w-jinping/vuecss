/**---建立营业主管登录帐户---*/
EXEC sp_addlogin 'trafficManager', 'manager'
/*---建立营业员登录帐户---*/
EXEC sp_addlogin 'seller','seller'
GO
/*---建立数据库用户---*/
USE productDB
GO
EXEC sp_grantdbaccess 'trafficManager','manager'
EXEC sp_grantdbaccess 'seller','seller'
GO
/*---向新建立的数据库用户授予权限---*/
USE productDB
GO
GRANT select,insert,update,delete on proInfo to manager
GRANT select on proInfo to seller
GO