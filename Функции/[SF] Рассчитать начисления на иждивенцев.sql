CREATE FUNCTION dbo.fn_����������_����������_��_���������� (@���������_����� ��������������)
RETURNS INT
AS
BEGIN
    DECLARE @���������� INT;
    DECLARE @����� DECIMAL(18, 2);
    DECLARE @���_��_���������� INT;

    SELECT @����� = �����, @���_��_���������� = ���_��_����������
    FROM ���������
    WHERE ���������_����� = @���������_�����;

    SET @���������� = 0;

    DECLARE @I INT = 0;
    WHILE @I < @���_��_����������
    BEGIN
        SET @���������� = @���������� + (@����� * 0.1);
        SET @I = @I + 1;
    END

    RETURN @����������;
END;
