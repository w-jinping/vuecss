create table emp(id int,name varchar(10),age int,wh varchar(10));

insert into emp(id,name,age,wh)values(1,'moner',29,'��������')
insert into emp(id,name,age,wh)values(2,'rose',20,'��������')
insert into emp(id,name,age,wh)values(3,'aa',21,'��������')
insert into emp(id,name,age,wh)values(4,'bb',21,'��ר')
insert into emp(id,name,age,wh)values(5,'cc',21,'��ר')
insert into emp(id,name,age,wh)values(6,'dd',21,'����')
insert into emp(id,name,age,wh)values(8,'d4',26,'����')
insert into emp(id,name,age,wh)values(7,'ee',21,'��������')
insert into emp(id,name,age,wh)values(9,'ef',27,'��������')
insert into emp(id,name,age,wh)values(10,'eg',35,'��������')
insert into emp(id,name,age,wh)values(11,'d6',28,'����')
insert into emp(id,name,age,wh)values(12,'d9',33,'����')


select wh ѧ��,avg(age) ƽ������,count(*) ����,round(cast(count(*) as float )/cast((select count(*) from emp) as float),2)*100 as �ٷֱ� from emp
group by wh
