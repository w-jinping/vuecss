DECLARE @num int
SELECT @num=count(*)  from stuInfo
print '��������:'+convert(varchar(5),@num)
IF (@num>10)
  BEGIN
    print '����ǰ����ѧԱ��Ϣ'
    SELECT TOP 5 * FROM stuInfo ORDER BY stuNo DESC
  END
ELSE
  BEGIN
    print '��������ѧԱ��Ϣ'
    SELECT  * FROM stuInfo
  END