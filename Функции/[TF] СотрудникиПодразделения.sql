CREATE FUNCTION �����������������������(@���������������� INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
		���������_�����, ���, �����, ����_������
    FROM ���������
    WHERE ���_������������� = @����������������
);