CREATE TRIGGER �������������������
ON ���������
AFTER INSERT
AS
	INSERT INTO �������(���������_�����, ����, ���_����_�������, �����_�������)
	SELECT i.���������_�����, GETDATE(), 1, '����� �� ������'
	FROM inserted i;