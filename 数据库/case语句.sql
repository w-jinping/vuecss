use stuDB
Go
IF EXISTS(SELECT * FROM sysobjects WHERE name='books')
DROP TABLE books

CREATE TABLE books  --����Ϣ��
(
  bookid int NOT NULL,  --ѧ��
  bookname  CHAR(50) NOT NULL ,     --����
  price  money,    --�۸�
)
GO

INSERT INTO books(bookid,bookname,price)VALUES('1001','������ֻ�����','25.52')
INSERT INTO books(bookid,bookname,price)VALUES('1002','SQl Server 2005','')
INSERT INTO books(bookid,bookname,price)VALUES('1003','��ݸ����������','15')
INSERT INTO books(bookid,bookname,price)VALUES('1004','��л��ĥ�����','18')
INSERT INTO books(bookid,bookname,price)VALUES('1005','�ҵ������ոտ�ʼ','')
INSERT INTO books(bookid,bookname,price)VALUES('1006','���������Ů��','39.50')
INSERT INTO books(bookid,bookname,price)VALUES('1007','���ɻ���','8.50')
INSERT INTO books(bookid,bookname,price)VALUES('1008','��׼������','55.85')


Select bookid,bookname,�۸�=case 
when price='' then '�۸�δ֪' 
when price between 10 and 20 then '�۸���10��20֮��' 
when price between 20 and 30 then '�۸�����' 
else cast(price as char(10))
end 
from books