
SELECT * FROM stuInfo
SELECT * FROM stumarks

/*--����EXISTS�Ӳ�ѯ����������ӷ�--*/
IF EXISTS (SELECT * FROM stuMarks WHERE writtenExam>80)
  BEGIN
    print '�������˱��Գɼ�����80�֣�ÿ��ֻ��2�֣��ӷֺ�ĳɼ�Ϊ��'
    UPDATE stuMarks SET writtenExam=writtenExam+2
    SELECT * FROM stuMarks
  END
ELSE
  BEGIN
    print '�������˱��Գɼ�����80�֣�ÿ�˿��Լ�5�֣��ӷֺ�ĳɼ�Ϊ��'
    UPDATE stuMarks SET writtenExam=writtenExam+5
    SELECT * FROM stuMarks
  END
GO

/*--����NOT EXISTS�Ӳ�ѯ�����������Ѷȼӷ�--*/
IF NOT EXISTS (SELECT * FROM stuMarks WHERE writtenExam>60 AND labExam>60)
  BEGIN
    print '��������ͨ�����ԣ�����ƫ�ѣ�ÿ�˼�3�֣��ӷֺ�ĳɼ�Ϊ��'
    UPDATE stuMarks SET writtenExam=writtenExam+3,labExam=labExam+3
    SELECT * FROM stuMarks
  END
ELSE
  BEGIN
    print '���࿼�Գɼ�һ�㣬ÿ��ֻ��1�֣��ӷֺ�ĳɼ�Ϊ��'
    UPDATE stuMarks SET writtenExam=writtenExam+1,labExam=labExam+1
    SELECT * FROM stuMarks
  END
GO