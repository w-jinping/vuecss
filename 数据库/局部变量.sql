use stuDB
declare @name varchar(8) 
declare @age int
select @name=stuName,@age=stuAge from stuInfo where stuSeat=3
select @name as ĞÕÃû,@age as ÄêÁä