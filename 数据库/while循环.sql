INSERT INTO stuMarks(examNo,stuNo,writtenExam,LabExam)  --插入测试数据
   VALUES('S271819','s25318',56,48)
SELECT * FROM stuMarks

DECLARE @n int
WHILE(1=1) --条件永远成立
  BEGIN
    SELECT @n=COUNT(*) FROM stuMarks WHERE writtenExam<60 --统计不及格人数
    IF (@n>0)
       UPDATE stuMarks SET writtenExam=writtenExam+2  --每人加2分
    ELSE
       BREAK  --退出循环
  END
print '加分后的成绩如下：'
SELECT * FROM stuMarks