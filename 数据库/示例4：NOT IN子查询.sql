
SELECT * FROM stuInfo
SELECT * FROM stumarks

/*--����IN�Ӳ�ѯ���鿴�μӿ��Ե�ѧԱ����--*/
SELECT stuName FROM stuInfo
  WHERE stuNo IN (SELECT stuNo FROM stuMarks)
GO

/*--����NOT IN�Ӳ�ѯ���鿴δ�μӿ��Ե�ѧԱ����--*/
SELECT stuName FROM stuInfo
  WHERE stuNo NOT IN (SELECT stuNo FROM stuMarks)
GO
