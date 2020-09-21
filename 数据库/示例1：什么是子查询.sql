select * from stuinfo
select * from stumarks

/*-实现方法一：SQL变量-*/
DECLARE @age INT  --定义变量，用于存放李斯文的年龄
SELECT @age=stuAge FROM stuInfo where stuName='李斯文' --求出李斯文的年龄
SELECT * FROM stuInfo WHERE stuAge>@age --筛选比李斯文年龄大的学员
GO

/*-实现方法二：子查询-*/
SELECT * FROM stuInfo
 WHERE stuAge>( SELECT stuAge FROM stuInfo where stuName='李斯文')
GO