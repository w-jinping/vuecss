USE stuDB
GO
/*--����Ƿ���ڣ���ͼ�����ϵͳ��sysobjects��--*/
IF EXISTS (SELECT * FROM  sysobjects
          WHERE name = 'view_stuInfo_stuMarks')
   DROP VIEW view_stuInfo_stuMarks
GO

/*--������ͼ���鿴ѧԱ�ĳɼ����--*/
CREATE VIEW view_stuInfo_stuMarks
  AS
    SELECT ����=stuName,ѧ��=stuInfo.stuNo,���Գɼ�=writtenExam,
      ���Գɼ�=labExam,ƽ����=(writtenExam+labExam)/2 
        FROM stuInfo LEFT JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
GO

/*--ʹ����ͼ����ͼ��һ������������������һ����--*/
SELECT * FROM view_stuInfo_stuMarks


