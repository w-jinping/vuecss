select * from stuinfo
select * from stumarks

/*-ʵ�ַ���һ��SQL����-*/
DECLARE @age INT  --������������ڴ����˹�ĵ�����
SELECT @age=stuAge FROM stuInfo where stuName='��˹��' --�����˹�ĵ�����
SELECT * FROM stuInfo WHERE stuAge>@age --ɸѡ����˹��������ѧԱ
GO

/*-ʵ�ַ��������Ӳ�ѯ-*/
SELECT * FROM stuInfo
 WHERE stuAge>( SELECT stuAge FROM stuInfo where stuName='��˹��')
GO