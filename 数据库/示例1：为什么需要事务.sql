/*--������Ϊʲô��Ҫ����--*/
--ͬһ���У��綼��ũ�е��ʺţ�����ֱ��ת��
/*��--------------����-----------------*/
USE stuDB
GO

--����ũ���ʻ���bank
IF EXISTS(SELECT * FROM sysobjects WHERE name='bank')
   DROP TABLE bank
GO
 
CREATE TABLE bank
(
    customerName CHAR(10), --�˿�����
    currentMoney MONEY     --��ǰ���
)
GO

/*---���Լ�����������й涨���ʻ���������1Ԫ����������----*/
ALTER TABLE bank
  ADD CONSTRAINT CK_currentMoney CHECK(currentMoney>=1)
GO

/*--����������ݣ������������������Ϊ800 �����Ŀ������������1 ---*/
INSERT INTO bank(customerName,currentMoney) VALUES('����',1000)
INSERT INTO bank(customerName,currentMoney) VALUES('����',1)
GO
--�鿴���
SELECT * FROM bank

GO

/*--ת�ʲ��ԣ�����ϣ��ͨ��ת�ˣ�ֱ�ӻ�Ǯ������1000Ԫ--*/
--���ǿ��ܻ���������д����
--�������ʻ���1000Ԫ�����ĵ��ʻ���1000Ԫ
UPDATE bank SET currentMoney=currentMoney-1000 
     WHERE customerName='����'
UPDATE bank SET currentMoney=currentMoney+1000 
     WHERE customerName='����'
GO
--�ٴβ鿴��������������ʲô���صĴ���?��ν���أ�
SELECT * FROM bank
GO
























