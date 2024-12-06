CREATE TRIGGER ЗаписьПриказаПриема
ON Работники
AFTER INSERT
AS
	INSERT INTO Приказы(табельный_номер, дата, код_типа_приказа, текст_приказа)
	SELECT i.табельный_номер, GETDATE(), 1, 'Прием на работу'
	FROM inserted i;