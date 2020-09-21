select * from stuinfo
select * from stumarks

/*--实现方法一：采用表连接--*/
SELECT stuName FROM stuInfo INNER JOIN stuMarks 
   ON stuInfo.stuNo=stuMarks.stuNo WHERE writtenExam=60

/*--实现方法二：采用子查询--*/
SELECT stuName FROM stuInfo 
  WHERE stuNo=(SELECT stuNo FROM stuMarks WHERE writtenExam=60)
GO