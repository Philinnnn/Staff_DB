CREATE FUNCTION dbo.fn_Рассчитать_начисления_на_иждивенцев (@табельный_номер ТабельныйНомер)
RETURNS INT
AS
BEGIN
    DECLARE @начисления INT;
    DECLARE @оклад DECIMAL(18, 2);
    DECLARE @кол_во_иждивенцев INT;

    SELECT @оклад = оклад, @кол_во_иждивенцев = кол_во_иждивенцев
    FROM Работники
    WHERE табельный_номер = @табельный_номер;

    SET @начисления = 0;

    DECLARE @I INT = 0;
    WHILE @I < @кол_во_иждивенцев
    BEGIN
        SET @начисления = @начисления + (@оклад * 0.1);
        SET @I = @I + 1;
    END

    RETURN @начисления;
END;
