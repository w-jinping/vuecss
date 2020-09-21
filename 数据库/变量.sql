/*--查找李文才的信息--*/
DECLARE @name varchar(8)
SET @name='李文才'      --使用SET赋值
SELECT * FROM stuInfo where stuName = @name

/*--查找李文才的左右同桌--*/
DECLARE @seat int
SELECT @seat=stuSeat from stuInfo where stuName=@name  --使用SELECT赋值
SELECT * FROM stuInfo where (stuSeat = @seat+1) or (stuSeat = @seat-1)
GO

