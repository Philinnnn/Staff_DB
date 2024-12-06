USE [Staff]
GO

CREATE PROCEDURE [dbo].[ВывестиКоличествоЗанятыхРабочихМест]
    @код_подразделения INT,
    @код_должности INT
AS
SELECT 
    код_подразделения, 
    код_должности, 
    общее_количество - количество_вакансий AS КоличествоЗанятыхМест
FROM 
    Штатное_расписание
WHERE 
    код_подразделения = @код_подразделения 
    AND код_должности = @код_должности;
GO
