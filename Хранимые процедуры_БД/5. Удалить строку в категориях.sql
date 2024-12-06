USE [Staff]
GO

CREATE PROCEDURE [dbo].[УдалитьКатегориюДолжностиПоКоду]
    @КодКатегории INT
AS
DELETE FROM Категории_должностей
WHERE код_категории = @КодКатегории;
GO
