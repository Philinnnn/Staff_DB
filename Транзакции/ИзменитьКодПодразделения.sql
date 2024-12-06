BEGIN TRANSACTION;

BEGIN TRY
    UPDATE Подразделения
    SET Код_подразделения = @NewCode
    WHERE Код_подразделения = @OldCode;

    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50001, 'Код подразделения не найден в таблице Подразделения.', 1;
    END

    UPDATE Штатное_расписание
    SET код_подразделения = @NewCode
    WHERE код_подразделения = @OldCode;

    UPDATE Работники
    SET код_подразделения = @NewCode
    WHERE код_подразделения = @OldCode;

    COMMIT;
    PRINT 'Транзакция успешно завершена.';

END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Ошибка при выполнении транзакции: ' + ERROR_MESSAGE();
END CATCH;
