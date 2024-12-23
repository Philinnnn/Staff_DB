USE [Staff]
GO

CREATE PROCEDURE [dbo].[ВставитьСтрокиКатегорииДолжностей]
    @КодКатегории1 INT, @Наименование1 NVARCHAR(255),
    @КодКатегории2 INT, @Наименование2 NVARCHAR(255),
    @КодКатегории3 INT, @Наименование3 NVARCHAR(255)
AS
DECLARE @i INT = 0
WHILE @i < 3
BEGIN
    IF @i = 1
        INSERT INTO Категории_должностей (код_категории, наименование) 
        VALUES (@КодКатегории1, @Наименование1);
    ELSE IF @i = 2
        INSERT INTO Категории_должностей (код_категории, наименование) 
        VALUES (@КодКатегории2, @Наименование2);
    ELSE IF @i = 3
        INSERT INTO Категории_должностей (код_категории, наименование) 
        VALUES (@КодКатегории3, @Наименование3);
    SET @i = @i + 1;
END;
GO
