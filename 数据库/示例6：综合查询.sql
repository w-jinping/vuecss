/*--���ο��Ե�ԭʼ����--*/
--SELECT * FROM stuInfo
--SELECT * FROM stuMarks
/*--------------ͳ�ƿ���ȱ�����----------------------*/
SELECT Ӧ������=(SELECT count(*)  FROM stuInfo) ,   --Ӧ������Ϊ�Ӳ�ѯ���ʽ�ı���
  ʵ������=(SELECT count(*) FROM stuMarks)  ,
   ȱ������=((SELECT count(*) FROM stuInfo)-(SELECT count(*) FROM stuMarks))  

/*----------ͳ�ƿ���ͨ�����������ͳ�ƽ��������±�newTable��---------*/
IF EXISTS(SELECT * FROM sysobjects where name='newTable')
  DROP TABLE newTable

SELECT  stuName,stuInfo.stuNo,writtenExam ,labExam ,
   isPass=CASE 
              WHEN writtenExam>=60 and labExam>=60 THEN 1
              ELSE 0
          END
 INTO newTable FROM stuInfo left Join  stuMarks 
   ON stuInfo.stuNo=stuMarks.stuNo 

--SELECT * FROM newTable --�鿴ͳ�ƽ���������ڵ���

/*-------����ӷ֣��Ƚϱ��Ժͻ���ƽ���֣��Ŀ�ƫ�ͣ��͸��Ŀ����--------*/
DECLARE @avgWritten numeric(4,1),@avgLab numeric(4,1) --���������ű��Ժͻ���ƽ����
SELECT @avgWritten=AVG(writtenExam) FROM newTable WHERE  writtenExam IS NOT NULL
SELECT @avgLab=AVG(labExam)FROM newTable WHERE  labExam IS NOT NULL
IF @avgWritten<@avgLab --�Ƚϱ��Ժͻ���ƽ���֣����Ŀ�ƫ��
  WHILE (1=1) --ѭ�������Լӷ֣���߷ֲ��ܳ���97��
    BEGIN  
      UPDATE newTable SET writtenExam=writtenExam+1
      IF (SELECT MAX(writtenExam) FROM newTable )>=97
         BREAK
    END
ELSE 
  WHILE (1=1) --ѭ�������Լӷ֣���߷ֲ��ܳ���97��
    BEGIN  
      UPDATE newTable SET labExam=labExam+1
      IF (SELECT MAX(labExam) FROM newTable)>=97
        BREAK
    END

 --��Ϊ��֣�������Ҫ����isPass���Ƿ�ͨ�����е�����
UPDATE newTable 
  SET isPass=CASE
               WHEN writtenExam>=60 and labExam>=60 THEN 1
               ELSE  0
              END

--SELECT * FROM newTable--�鿴����isPass�к�ĳɼ���ͨ������������ڵ���

/*--------------��ʾ��������ͨ�����----------------*/
SELECT ����=stuName,ѧ��=stuNo 
 ,���Գɼ�=CASE 
            WHEN writtenExam IS NULL THEN 'ȱ��'
             ELSE  convert(varchar(5),writtenExam)
          END
 ,���Գɼ�=CASE
             WHEN labExam IS NULL THEN 'ȱ��'
             ELSE  convert(varchar(5),labExam)
          END
 ,�Ƿ�ͨ��=CASE 
             WHEN isPass=1 THEN '��'
             ELSE  '��'
           END
 FROM newTable  

/*--��ʾͨ���ʼ�ͨ������--*/ 
SELECT ������=count(*) ,ͨ������=SUM(isPass),
   ͨ����=(convert(varchar(5),AVG(isPass*100))+'%')  FROM newTable 
GO
