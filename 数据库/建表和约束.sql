USE productDB
GO

/*---������Ʒ��Ӧ����Ϣ��---*/
/*---����Ƿ��Ѵ��ڱ�pro_Supplier����ѯproductDB���ݿ��е�ϵͳ��sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='pro_Supplier')
  DROP TABLE pro_Supplier
CREATE TABLE pro_Supplier 
(
   sID INT IDENTITY (1,1) PRIMARY KEY,	--��Ӧ�̱��
   sName VARCHAR(255) NOT NULL ,		--��Ӧ������
   sAddress VARCHAR (255) ,				--��Ӧ�̵�ַ
   sPhone VARCHAR (20) ,				--��ϵ�绰
)
GO

/*---���빩Ӧ����Ϣ---*/
insert into pro_Supplier(sName,sAddress,sPhone)values('�ɿڿ����й����޹�˾','�����з�̨�������8��','010-77777777')
insert into pro_Supplier(sName,sPhone)values('������������','010-68745566')
insert into pro_Supplier(sName,sAddress,sPhone)values('�й���ҵ�̾ƹ�˾','�����ж���������ʮ��22��','010-56651234')
insert into pro_Supplier(sName,sAddress,sPhone)values('�㽭�ɰ�˹����','�㽭ʡ̨���ж�����','0577-3698765')
insert into pro_Supplier(sName,sAddress,sPhone)values('���м���','����������','83698765')
GO

/*---������Ʒ�����Ϣ��---*/
/*---����Ƿ��Ѵ��ڱ�pro_Type����ѯproductDB���ݿ��е�ϵͳ��sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='pro_Type')
  DROP TABLE pro_Type
CREATE TABLE pro_Type
(
   typeID INT IDENTITY (1,1)PRIMARY KEY ,	--�����
   typeName VARCHAR(50) NOT NULL ,		--�������
   typeDesc VARCHAR (255) ,				--�������
) 
GO
/*---������Ʒ�����Ϣ---*/
insert into pro_Type(typeName,typeDesc)values('����Ʒ','����С�ٻ�')
insert into pro_Type(typeName,typeDesc)values('ʳƷ','���,����ʳƷ')
insert into pro_Type(typeName,typeDesc)values('����','����Һ̬��Ʒ')
insert into pro_Type(typeName,typeDesc)values('�ҵ�','���õ���,���Ե�')
GO

/*-----����Ʒ��Ϣ��--------*/
/*---����Ƿ��Ѵ��ڱ�proInfo����ѯproductDB���ݿ��е�ϵͳ��sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='proInfo')
  DROP TABLE proInfo
GO
CREATE TABLE proInfo 
(
   proID INT IDENTITY (1,1) NOT NULL ,	 --�Զ���ţ���Ʒ���
   proName VARCHAR(50) NOT NULL ,		 --��Ʒ����
   typeID INT ,						 --��Ʒ���ID
   sID INT ,					 --��Ӧ��ID
   proStorage INT  ,					 --��Ʒ�������
   proPrice Money NOT NULL ,					 --��Ʒ����
) 
GO
/*--------�����Ʒ��Ϣ���ֶ�Լ��-------*/
ALTER TABLE proInfo ADD CONSTRAINT PK_proID PRIMARY KEY(proID)					--���Ĭ��Ϊ�ۺ���
ALTER TABLE proInfo ADD CONSTRAINT DF_proStorage DEFAULT (0) FOR proStorage		--Ĭ�Ͽ����Ʒ����0
GO
/*---������Ʒ��Ϣ������Լ��---*/
ALTER TABLE proInfo ADD CONSTRAINT FK_sID FOREIGN KEY(sID) REFERENCES pro_Supplier(sID)
ALTER TABLE proInfo ADD CONSTRAINT FK_tID FOREIGN KEY(typeID) REFERENCES pro_Type(typeID)
GO

/*---������Ʒ��Ϣ������---*/
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('ͳһ�ɴ���','2','1','100','0.90')
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('�ɿڿ���','3','1','30','5.6')
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('JACK&JONES','1','5','10','768')
insert into proInfo(proName,typeID,sID,proPrice)values('NOKIAN99','4','5','6000')
insert into proInfo(proName,typeID,sID,proPrice)values('�緹��','4','4','105')
GO
/*--�޸ļ�¼---*/
update proInfo set proStorage=30  where proID=4
/*---�������������----*/
insert into proInfo(proName,typeID,sID)values('�緹��','78','2')
insert into proInfo(proName,typeID,sID)values('�緹��','4','9')
