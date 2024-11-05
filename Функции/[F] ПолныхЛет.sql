CREATE FUNCTION dbo.fn_ПолныхЛет (@первая_дата DATE)
RETURNS INT
AS
BEGIN
    DECLARE @лет INT;

    SET @лет = DATEDIFF(YEAR, @первая_дата, GETDATE()) 
                - CASE 
                    WHEN DATEADD(YEAR, DATEDIFF(YEAR, @первая_дата, GETDATE()), @первая_дата) > GETDATE() 
                    THEN 1 
                    ELSE 0 
                  END;

    RETURN @лет;
END;
