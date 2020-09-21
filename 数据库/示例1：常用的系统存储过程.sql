-- Purpose: 常用系统存储过程使用

EXEC sp_databases  --列出当前系统中的数据库

EXEC  sp_renamedb 'Northwind','Northwind1'--改变数据库名称(单用户访问)

USE stuDB
GO

EXEC sp_tables  --当前数据库中查询的对象的列表

EXEC sp_columns stuInfo  --返回某个表列的信息

EXEC sp_help stuInfo  --查看表stuInfo的信息

EXEC sp_helpconstraint stuInfo --查看表stuInfo的约束

EXEC sp_helpindex stuMarks  --查看表stuMarks的索引

EXEC sp_helptext 'view_stuInfo_stuMarks' --查看视图的语句文本

EXEC sp_stored_procedures  --返回当前数据库中的存储过程列表

