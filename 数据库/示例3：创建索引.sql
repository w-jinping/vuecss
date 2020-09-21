USE stuDB
GO
/*--检测是否存在该索引(索引存放在系统表sysindexes中)----*/
IF EXISTS (SELECT name FROM sysindexes 
          WHERE name = 'IX_stuMarks_writtenExam')
   DROP INDEX stuMarks.IX_stuMarks_writtenExam  --删除索引
/*--笔试列创建聚集索引:填充因子为30％--*/
CREATE NONCLUSTERED INDEX IX_stuMarks_writtenExam
   ON stuMarks(writtenExam)
	   WITH FILLFACTOR= 30
GO

/*--指定按索引：IX_stuMarks_writtenExam查询--*/
SELECT * FROM stuMarks 
  (INDEX=IX_stuMarks_writtenExam)
    WHERE writtenExam BETWEEN 60 AND 90
     