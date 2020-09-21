/*--本次考试的原始数据--*/
--SELECT * FROM stuInfo
--SELECT * FROM stuMarks
/*--------------统计考试缺考情况----------------------*/
SELECT 应到人数=(SELECT count(*)  FROM stuInfo) ,   --应到人数为子查询表达式的别名
  实到人数=(SELECT count(*) FROM stuMarks)  ,
   缺考人数=((SELECT count(*) FROM stuInfo)-(SELECT count(*) FROM stuMarks))  

/*----------统计考试通过情况，并将统计结果存放在新表newTable中---------*/
IF EXISTS(SELECT * FROM sysobjects where name='newTable')
  DROP TABLE newTable

SELECT  stuName,stuInfo.stuNo,writtenExam ,labExam ,
   isPass=CASE 
              WHEN writtenExam>=60 and labExam>=60 THEN 1
              ELSE 0
          END
 INTO newTable FROM stuInfo left Join  stuMarks 
   ON stuInfo.stuNo=stuMarks.stuNo 

--SELECT * FROM newTable --查看统计结果，可用于调试

/*-------酌情加分：比较笔试和机试平均分，哪科偏低，就给哪科提分--------*/
DECLARE @avgWritten numeric(4,1),@avgLab numeric(4,1) --定义变量存放笔试和机试平均分
SELECT @avgWritten=AVG(writtenExam) FROM newTable WHERE  writtenExam IS NOT NULL
SELECT @avgLab=AVG(labExam)FROM newTable WHERE  labExam IS NOT NULL
IF @avgWritten<@avgLab --比较笔试和机试平均分，看哪科偏低
  WHILE (1=1) --循环给笔试加分，最高分不能超过97分
    BEGIN  
      UPDATE newTable SET writtenExam=writtenExam+1
      IF (SELECT MAX(writtenExam) FROM newTable )>=97
         BREAK
    END
ELSE 
  WHILE (1=1) --循环给机试加分，最高分不能超过97分
    BEGIN  
      UPDATE newTable SET labExam=labExam+1
      IF (SELECT MAX(labExam) FROM newTable)>=97
        BREAK
    END

 --因为提分，所以需要更新isPass（是否通过）列的数据
UPDATE newTable 
  SET isPass=CASE
               WHEN writtenExam>=60 and labExam>=60 THEN 1
               ELSE  0
              END

--SELECT * FROM newTable--查看更新isPass列后的成绩和通过情况，可用于调试

/*--------------显示考试最终通过情况----------------*/
SELECT 姓名=stuName,学号=stuNo 
 ,笔试成绩=CASE 
            WHEN writtenExam IS NULL THEN '缺考'
             ELSE  convert(varchar(5),writtenExam)
          END
 ,机试成绩=CASE
             WHEN labExam IS NULL THEN '缺考'
             ELSE  convert(varchar(5),labExam)
          END
 ,是否通过=CASE 
             WHEN isPass=1 THEN '是'
             ELSE  '否'
           END
 FROM newTable  

/*--显示通过率及通过人数--*/ 
SELECT 总人数=count(*) ,通过人数=SUM(isPass),
   通过率=(convert(varchar(5),AVG(isPass*100))+'%')  FROM newTable 
GO
