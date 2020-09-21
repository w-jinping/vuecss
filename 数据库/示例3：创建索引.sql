USE stuDB
GO
/*--����Ƿ���ڸ�����(���������ϵͳ��sysindexes��)----*/
IF EXISTS (SELECT name FROM sysindexes 
          WHERE name = 'IX_stuMarks_writtenExam')
   DROP INDEX stuMarks.IX_stuMarks_writtenExam  --ɾ������
/*--�����д����ۼ�����:�������Ϊ30��--*/
CREATE NONCLUSTERED INDEX IX_stuMarks_writtenExam
   ON stuMarks(writtenExam)
	   WITH FILLFACTOR= 30
GO

/*--ָ����������IX_stuMarks_writtenExam��ѯ--*/
SELECT * FROM stuMarks 
  (INDEX=IX_stuMarks_writtenExam)
    WHERE writtenExam BETWEEN 60 AND 90
     