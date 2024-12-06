USE [Staff]
GO

CREATE PROCEDURE [dbo].[ВыбратьСвободныеВакансии]
AS
SELECT * 
FROM Штатное_расписание 
WHERE общее_количество - количество_вакансий > 0;
GO
