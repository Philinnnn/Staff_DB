CREATE TRIGGER ПроверкаПереполненияШтата
ON Штатное_расписание
AFTER UPDATE
AS
IF EXISTS (
	SELECT 1
	FROM Штатное_расписание sr
	JOIN Подразделения p ON sr.код_подразделения = p.код_подразделения
	WHERE sr.общее_количество < (
		SELECT COUNT(*)
		FROM Работники r
		WHERE r.код_подразделения = sr.код_подразделения
		)
	)
RAISERROR ('Превышено общее количество сотрудников для подразделения', 16, 1);
ROLLBACK;