USE stuDB
GO
--�ָ�ԭ��������
--UPDATE bank SET currentMoney=currentMoney-1000 WHERE customerName='����' 
SET NOCOUNT ON --����ʾ��Ӱ���������Ϣ
print '�鿴ת������ǰ�����'
SELECT * FROM bank  
GO

/*--��ʼ����ָ������Ӵ˴���ʼ��������T-SQL��䶼��һ������--*/
BEGIN TRANSACTION 
/*--��������������ۼ�����ִ�й����еĴ���--*/
DECLARE @errorSum INT 
SET @errorSum=0  --��ʼ��Ϊ0�����޴���

/*--ת�ʣ��������ʻ���1000Ԫ�����ĵ��ʻ���1000Ԫ*/
UPDATE bank SET currentMoney=currentMoney-800 WHERE customerName='����'
SET @errorSum=@errorSum+@@error  --�ۼ��Ƿ��д���
UPDATE bank SET currentMoney=currentMoney+800 WHERE customerName='����'
SET @errorSum=@errorSum+@@error  --�ۼ��Ƿ��д���

print '�鿴ת����������е����'
SELECT * FROM bank 

/*--�����Ƿ��д���ȷ���������ύ���ǳ���---*/
IF @errorSum<>0  --����д���
  BEGIN
    print '����ʧ�ܣ��ع�����'
    ROLLBACK TRANSACTION 
  END  
ELSE
  BEGIN
    print '���׳ɹ����ύ����д��Ӳ�̣����õı���'
    COMMIT TRANSACTION   
  END
GO

print '�鿴ת�����������'
SELECT * FROM bank  
GO