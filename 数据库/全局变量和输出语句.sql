INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('÷����','s25318','Ů','23')
print '��ǰ�����'+convert(varchar(5),@@ERROR)   --�������0��ʾ��һ�����ִ���д���
print '�ղű�����ѧԱ����λ��Ϊ:' +convert(varchar(5),@@IDENTITY )
UPDATE stuinfo SET stuAge=85 WHERE stuName='���Ĳ�'
print '��ǰ�����'+convert(varchar(5),@@ERROR) 
print 'SQL Server�İ汾'+@@VERSION 
GO
