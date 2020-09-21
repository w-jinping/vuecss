create table emp(id int,name varchar(10),age int,wh varchar(10));

insert into emp(id,name,age,wh)values(1,'moner',29,'本科以上')
insert into emp(id,name,age,wh)values(2,'rose',20,'本科以上')
insert into emp(id,name,age,wh)values(3,'aa',21,'本科以上')
insert into emp(id,name,age,wh)values(4,'bb',21,'大专')
insert into emp(id,name,age,wh)values(5,'cc',21,'大专')
insert into emp(id,name,age,wh)values(6,'dd',21,'高中')
insert into emp(id,name,age,wh)values(8,'d4',26,'高中')
insert into emp(id,name,age,wh)values(7,'ee',21,'初中以下')
insert into emp(id,name,age,wh)values(9,'ef',27,'初中以下')
insert into emp(id,name,age,wh)values(10,'eg',35,'初中以下')
insert into emp(id,name,age,wh)values(11,'d6',28,'高中')
insert into emp(id,name,age,wh)values(12,'d9',33,'高中')


select wh 学历,avg(age) 平均年龄,count(*) 人数,round(cast(count(*) as float )/cast((select count(*) from emp) as float),2)*100 as 百分比 from emp
group by wh
