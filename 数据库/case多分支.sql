SELECT * FROM stuMarks  --ԭʼ�ɼ�
print 'ABCDE�弶��ʾ�ɼ����£�'
SELECT stuNo,�ɼ�= CASE  
                     WHEN writtenExam<60 THEN 'E'
                     WHEN writtenExam between 60 AND 69 THEN 'D'
                     WHEN writtenExam between 70 AND 79 THEN 'C'
                     WHEN writtenExam between 80 AND 89 THEN 'B'
                     ElSE 'A'
                  END
             FROM stuMarks