CREATE TRIGGER ЗащитаОтУдаленияОбразования
ON Образование
INSTEAD OF DELETE
AS
    IF EXISTS (
        SELECT 1
        FROM deleted d
        JOIN Работники r ON d.код_образования = r.код_образования
    )
        RAISERROR ('Нельзя удалить запись об образовании, так как она связана с работниками', 16, 1);
    ELSE
        DELETE FROM Образование WHERE код_образования IN (SELECT код_образования FROM deleted);