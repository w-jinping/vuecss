本例在本地和远程数据库上更新作者的姓。本地和远程数据库将同时提交或同时回滚本事务。
USE pubs
GO
BEGIN DISTRIBUTED TRANSACTION
UPDATE authors
SET au_lname = 'McDonald' WHERE au_id = '409-56-7008'
EXECUTE link_Server_T.pubs.dbo.changeauth_lname '409-56-7008','McDonald'
COMMIT TRAN
GO