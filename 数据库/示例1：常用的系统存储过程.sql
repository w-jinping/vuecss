-- Purpose: ����ϵͳ�洢����ʹ��

EXEC sp_databases  --�г���ǰϵͳ�е����ݿ�

EXEC  sp_renamedb 'Northwind','Northwind1'--�ı����ݿ�����(���û�����)

USE stuDB
GO

EXEC sp_tables  --��ǰ���ݿ��в�ѯ�Ķ�����б�

EXEC sp_columns stuInfo  --����ĳ�����е���Ϣ

EXEC sp_help stuInfo  --�鿴��stuInfo����Ϣ

EXEC sp_helpconstraint stuInfo --�鿴��stuInfo��Լ��

EXEC sp_helpindex stuMarks  --�鿴��stuMarks������

EXEC sp_helptext 'view_stuInfo_stuMarks' --�鿴��ͼ������ı�

EXEC sp_stored_procedures  --���ص�ǰ���ݿ��еĴ洢�����б�

