CREATE TRIGGER �������������������������
ON �������_����������
AFTER UPDATE
AS
IF EXISTS (
	SELECT 1
	FROM �������_���������� sr
	JOIN ������������� p ON sr.���_������������� = p.���_�������������
	WHERE sr.�����_���������� < (
		SELECT COUNT(*)
		FROM ��������� r
		WHERE r.���_������������� = sr.���_�������������
		)
	)
RAISERROR ('��������� ����� ���������� ����������� ��� �������������', 16, 1);
ROLLBACK;