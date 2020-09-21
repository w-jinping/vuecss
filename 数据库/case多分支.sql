SELECT * FROM stuMarks  --原始成绩
print 'ABCDE五级显示成绩如下：'
SELECT stuNo,成绩= CASE  
                     WHEN writtenExam<60 THEN 'E'
                     WHEN writtenExam between 60 AND 69 THEN 'D'
                     WHEN writtenExam between 70 AND 79 THEN 'C'
                     WHEN writtenExam between 80 AND 89 THEN 'B'
                     ElSE 'A'
                  END
             FROM stuMarks