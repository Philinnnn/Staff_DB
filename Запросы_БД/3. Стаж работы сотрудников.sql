SELECT 
    ФИО, 
    dbo.fn_ПолныхЛет(дата_приема) AS стаж
FROM Работники;