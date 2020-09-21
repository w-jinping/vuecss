INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('梅超风','s25318','女','23')
print '当前错误号'+convert(varchar(5),@@ERROR)   --如果大于0表示上一条语句执行有错误
print '刚才报名的学员，座位号为:' +convert(varchar(5),@@IDENTITY )
UPDATE stuinfo SET stuAge=85 WHERE stuName='李文才'
print '当前错误号'+convert(varchar(5),@@ERROR) 
print 'SQL Server的版本'+@@VERSION 
GO
