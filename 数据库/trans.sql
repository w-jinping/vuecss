�����ڱ��غ�Զ�����ݿ��ϸ������ߵ��ա����غ�Զ�����ݿ⽫ͬʱ�ύ��ͬʱ�ع�������
USE pubs
GO
BEGIN DISTRIBUTED TRANSACTION
UPDATE authors
SET au_lname = 'McDonald' WHERE au_id = '409-56-7008'
EXECUTE link_Server_T.pubs.dbo.changeauth_lname '409-56-7008','McDonald'
COMMIT TRAN
GO