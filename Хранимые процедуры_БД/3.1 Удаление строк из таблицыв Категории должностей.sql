USE Staff
GO

CREATE PROCEDURE УдалитьКатегориюДолжностиПоКоду
    @КодКатегории INT
AS
    DELETE FROM Категории_должностей
    WHERE код_категории = @КодКатегории
GO