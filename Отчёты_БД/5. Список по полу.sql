CREATE VIEW vw_Список_по_полу AS
	SELECT табельный_номер, ФИО, пол
	FROM Работники 
	WHERE пол = 'М'
;