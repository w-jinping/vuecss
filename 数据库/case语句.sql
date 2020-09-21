use stuDB
Go
IF EXISTS(SELECT * FROM sysobjects WHERE name='books')
DROP TABLE books

CREATE TABLE books  --书信息表
(
  bookid int NOT NULL,  --学号
  bookname  CHAR(50) NOT NULL ,     --书名
  price  money,    --价格
)
GO

INSERT INTO books(bookid,bookname,price)VALUES('1001','人生若只如初见','25.52')
INSERT INTO books(bookid,bookname,price)VALUES('1002','SQl Server 2005','')
INSERT INTO books(bookid,bookname,price)VALUES('1003','东莞不相信眼泪','15')
INSERT INTO books(bookid,bookname,price)VALUES('1004','感谢折磨你的人','18')
INSERT INTO books(bookid,bookname,price)VALUES('1005','我的人生刚刚开始','')
INSERT INTO books(bookid,bookname,price)VALUES('1006','下午三点的女人','39.50')
INSERT INTO books(bookid,bookname,price)VALUES('1007','法律基础','8.50')
INSERT INTO books(bookid,bookname,price)VALUES('1008','标准韩国语','55.85')


Select bookid,bookname,价格=case 
when price='' then '价格未知' 
when price between 10 and 20 then '价格在10至20之间' 
when price between 20 and 30 then '价格适中' 
else cast(price as char(10))
end 
from books