CREATE VIEW vw_Список_по_национальности AS
	SELECT r.ФИО, n.наименование
	FROM Работники r
		JOIN Национальности n ON n.код_национальности = r.код_национальности
	WHERE n.наименование = 'Казах'
;