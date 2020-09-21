DECLARE @num int
SELECT @num=count(*)  from stuInfo
print '本班人数:'+convert(varchar(5),@num)
IF (@num>10)
  BEGIN
    print '本班前五名学员信息'
    SELECT TOP 5 * FROM stuInfo ORDER BY stuNo DESC
  END
ELSE
  BEGIN
    print '本班所有学员信息'
    SELECT  * FROM stuInfo
  END