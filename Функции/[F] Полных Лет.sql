CREATE FUNCTION dbo.fn_ПолныхЛет (@дата DATE)
RETURNS INT
AS
BEGIN
    DECLARE @лет INT;
		IF(MONTH (@дата) > MONTH (GETDATE()) OR (MONTH (@дата) = MONTH (GETDATE())) AND DAY(@дата) > DAY(GETDATE()))
		SET @лет = DATEDIFF (YEAR, @дата, GETDATE()) -1
		ELSE
		SET @лет = DATEDIFF (YEAR, @дата, GETDATE())
    RETURN @лет;
END;
