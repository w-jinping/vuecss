USE productDB
GO

/*---建立商品供应商信息表---*/
/*---检查是否已存在表pro_Supplier：查询productDB数据库中的系统表sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='pro_Supplier')
  DROP TABLE pro_Supplier
CREATE TABLE pro_Supplier 
(
   sID INT IDENTITY (1,1) PRIMARY KEY,	--供应商编号
   sName VARCHAR(255) NOT NULL ,		--供应商名称
   sAddress VARCHAR (255) ,				--供应商地址
   sPhone VARCHAR (20) ,				--联系电话
)
GO

/*---插入供应商信息---*/
insert into pro_Supplier(sName,sAddress,sPhone)values('可口可乐中国有限公司','北京市丰台区七里店8号','010-77777777')
insert into pro_Supplier(sName,sPhone)values('海尔电器集团','010-68745566')
insert into pro_Supplier(sName,sAddress,sPhone)values('中国糖业烟酒公司','北京市东城区东四十条22号','010-56651234')
insert into pro_Supplier(sName,sAddress,sPhone)values('浙江纳爱斯集团','浙江省台州市东湖区','0577-3698765')
insert into pro_Supplier(sName,sAddress,sPhone)values('中有集团','北京东湖区','83698765')
GO

/*---建立商品类别信息表---*/
/*---检查是否已存在表pro_Type：查询productDB数据库中的系统表sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='pro_Type')
  DROP TABLE pro_Type
CREATE TABLE pro_Type
(
   typeID INT IDENTITY (1,1)PRIMARY KEY ,	--类别编号
   typeName VARCHAR(50) NOT NULL ,		--类别名称
   typeDesc VARCHAR (255) ,				--类别描述
) 
GO
/*---插入商品类别信息---*/
insert into pro_Type(typeName,typeDesc)values('日用品','日用小百货')
insert into pro_Type(typeName,typeDesc)values('食品','糕点,休闲食品')
insert into pro_Type(typeName,typeDesc)values('饮料','各类液态饮品')
insert into pro_Type(typeName,typeDesc)values('家电','家用电器,电脑等')
GO

/*-----建商品信息表--------*/
/*---检查是否已存在表proInfo：查询productDB数据库中的系统表sysobjects---*/
IF EXISTS(SELECT * FROM sysobjects WHERE name='proInfo')
  DROP TABLE proInfo
GO
CREATE TABLE proInfo 
(
   proID INT IDENTITY (1,1) NOT NULL ,	 --自动编号，商品编号
   proName VARCHAR(50) NOT NULL ,		 --商品名称
   typeID INT ,						 --商品类别ID
   sID INT ,					 --供应商ID
   proStorage INT  ,					 --商品库存数量
   proPrice Money NOT NULL ,					 --商品单价
) 
GO
/*--------添加商品信息表字段约束-------*/
ALTER TABLE proInfo ADD CONSTRAINT PK_proID PRIMARY KEY(proID)					--类别默认为综合类
ALTER TABLE proInfo ADD CONSTRAINT DF_proStorage DEFAULT (0) FOR proStorage		--默认库存商品数量0
GO
/*---设置商品信息表的外键约束---*/
ALTER TABLE proInfo ADD CONSTRAINT FK_sID FOREIGN KEY(sID) REFERENCES pro_Supplier(sID)
ALTER TABLE proInfo ADD CONSTRAINT FK_tID FOREIGN KEY(typeID) REFERENCES pro_Type(typeID)
GO

/*---插入商品信息表数据---*/
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('统一干脆面','2','1','100','0.90')
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('可口可乐','3','1','30','5.6')
insert into proInfo(proName,typeID,sID,proStorage,proPrice)values('JACK&JONES','1','5','10','768')
insert into proInfo(proName,typeID,sID,proPrice)values('NOKIAN99','4','5','6000')
insert into proInfo(proName,typeID,sID,proPrice)values('电饭锅','4','4','105')
GO
/*--修改记录---*/
update proInfo set proStorage=30  where proID=4
/*---测试主外键关联----*/
insert into proInfo(proName,typeID,sID)values('电饭锅','78','2')
insert into proInfo(proName,typeID,sID)values('电饭锅','4','9')
