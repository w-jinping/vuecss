INSERT INTO stuMarks(examNo,stuNo,writtenExam,LabExam)  --�����������
   VALUES('S271819','s25318',56,48)
SELECT * FROM stuMarks

DECLARE @n int
WHILE(1=1) --������Զ����
  BEGIN
    SELECT @n=COUNT(*) FROM stuMarks WHERE writtenExam<60 --ͳ�Ʋ���������
    IF (@n>0)
       UPDATE stuMarks SET writtenExam=writtenExam+2  --ÿ�˼�2��
    ELSE
       BREAK  --�˳�ѭ��
  END
print '�ӷֺ�ĳɼ����£�'
SELECT * FROM stuMarks