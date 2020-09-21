--1.��
USE bbsDB
GO
SELECT * FROM bbsTopic WHERE TID NOT IN 
                   (SELECT RtID FROM bbsReply)

USE stuDB
GO
SELECT top 1 * FROM stuInfo 
  WHERE  stuNo NOT IN (SELECT top 1 stuNo FROM stuInfo)


--2.�⣺����������ŵĴ洢����(һ���õ�ǰ�·���\��ǰ����\��ǰ����������һ����ϵ����Ϊ�������)
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'proc_randCardID' )
  DROP PROCEDURE  proc_randCardID
GO
CREATE PROCEDURE proc_randCardID
  @randCardID char(19) OUTPUT,
  @frontNo char(10)='1010 3576 '
  AS
    DECLARE @r numeric(15,8) 
    DECLARE @tempStr  char(10)
    SELECT  @r=RAND((DATEPART(mm, GETDATE()) * 100000 )+ (DATEPART(ss, GETDATE()) * 1000 )
                  + DATEPART(ms, GETDATE()) )
    set @tempStr=convert(char(10),@r) --����0.xxxxxxxx������,������ҪС�����İ�λ���� 
    set @randCardID=@frontNo+SUBSTRING(@tempStr,3,4)+' '+SUBSTRING(@tempStr,7,4)  --���Ϊ�涨��ʽ�Ŀ���
GO
--���Բ����������
DECLARE @mycardID char(19) 
EXECUTE proc_randCardID @mycardID OUTPUT
print '�������������Ϊ��'+@mycardID
GO

--3.�⣺

USE master
GO
/*$$$$$$$$$$$$$����$$$$$$$$$$$$$$$$$$$$$$$$*/
--�������ݿ��Ƿ���ڣ����Ϊ�棬ɾ�������ݿ�--
IF exists(SELECT * FROM sysdatabases WHERE name='STU')
  DROP DATABASE STU
GO
CREATE DATABASE STU
GO

USE STU
GO
CREATE TABLE S  --ѧԱ��Ϣ��
(
  SID CHAR(8) NOT NULL,  --ѧ��
  SN  CHAR(10) NOT NULL ,     --����
  SD  CHAR(10) NOT NULL,    --������λ
  SA  CHAR(10) NOT NULL    --����
)
GO
CREATE TABLE C  --�γ̱�
(
  CID  CHAR(10) NOT NULL,    --�γ̱��
  CN  CHAR(20) NOT NULL  --�γ�����
)
GO
CREATE TABLE SC  --�ɼ���
(
  CID  CHAR(10) NOT NULL,    --�γ̱��
  SID  CHAR(10) NOT NULL,  --ѧ��
  G  CHAR(10) NOT NULL   --�ɼ�
)
GO

/*--��������--*/
INSERT INTO S(SID,SN,SD,SA)VALUES('1001','����','�й�����','28')
INSERT INTO S(SID,SN,SD,SA)VALUES('1002','����','��������','30')
INSERT INTO C(CID,CN)VALUES('s001','˰�ջ���')
INSERT INTO C(CID,CN)VALUES('s002','��������')
INSERT INTO C(CID,CN)VALUES('s003','��˼Ӣ��')
INSERT INTO SC(CID,SID,G)VALUES('s001','1001','85')
INSERT INTO SC(CID,SID,G)VALUES('s002','1001','76')
INSERT INTO SC(CID,SID,G)VALUES('s003','1002','90')


--4.�⣺
--�鿴���
  SELECT SN,SD FROM S WHERE [SID] IN(SELECT [SID] FROM C,SC WHERE C.[CID]=SC.[CID] AND CN='˰�ջ���')
GO

SELECT ����=(select SN from S where SID=SC.SID),���ڵ�λ=(select SD from S where SID=SC.SID),����=(select SA from S where SID=SC.SID),�γ�����=(select CN from C where CID=SC.CID),�ɼ�=G FROM SC
GO

SELECT COUNT(DISTINCT [SID]) as ѧԱ���� FROM SC
GO