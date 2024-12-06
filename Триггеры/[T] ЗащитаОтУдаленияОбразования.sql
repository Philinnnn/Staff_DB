CREATE TRIGGER ���������������������������
ON �����������
INSTEAD OF DELETE
AS
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN ��������� r ON d.���_����������� = r.���_�����������
    )
        RAISERROR ('������ ������� ������ �� �����������, ��� ��� ��� ������� � �����������', 16, 1);
    ELSE
        DELETE FROM ����������� WHERE ���_����������� IN (SELECT ���_����������� FROM deleted);