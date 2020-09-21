USE stuDB
GO
/*--检测是否存在：视图存放在系统表sysobjects中--*/
IF EXISTS (SELECT * FROM  sysobjects
          WHERE name = 'view_stuInfo_stuMarks')
   DROP VIEW view_stuInfo_stuMarks
GO

/*--创建视图：查看学员的成绩情况--*/
CREATE VIEW view_stuInfo_stuMarks
  AS
    SELECT 姓名=stuName,学号=stuInfo.stuNo,笔试成绩=writtenExam,
      机试成绩=labExam,平均分=(writtenExam+labExam)/2 
        FROM stuInfo LEFT JOIN stuMarks ON stuInfo.stuNo=stuMarks.stuNo
GO

/*--使用视图：视图是一个虚拟表，可以像物理表一样打开--*/
SELECT * FROM view_stuInfo_stuMarks


