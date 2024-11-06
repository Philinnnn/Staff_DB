SELECT ФИО, дата_приема, dbo.fn_ПолныхЛет(дата_приема) AS стаж
FROM Работники
WHERE DATEDIFF(YEAR, дата_приема, GETDATE()) BETWEEN 10 AND 15;