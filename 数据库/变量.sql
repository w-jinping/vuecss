/*--�������Ĳŵ���Ϣ--*/
DECLARE @name varchar(8)
SET @name='���Ĳ�'      --ʹ��SET��ֵ
SELECT * FROM stuInfo where stuName = @name

/*--�������Ĳŵ�����ͬ��--*/
DECLARE @seat int
SELECT @seat=stuSeat from stuInfo where stuName=@name  --ʹ��SELECT��ֵ
SELECT * FROM stuInfo where (stuSeat = @seat+1) or (stuSeat = @seat-1)
GO

