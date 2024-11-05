CREATE TABLE Национальности (
    код_национальности INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL
);
CREATE TABLE Образование (
    код_образования INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL
);
CREATE TABLE Пенсионные_фонды (
    код_фонда INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL
);
CREATE TABLE Категории_должностей (
    код_категории INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL
);
CREATE TABLE Должности (
    код_должности INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL,
    код_категории INT,
    FOREIGN KEY (код_категории) REFERENCES Категории_должностей(код_категории) ON UPDATE CASCADE
);
CREATE TABLE Подразделения (
    код_подразделения INT PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL,
    табельный_номер_начальника ТабельныйНомер
);
CREATE TABLE Работники (
    ФИО VARCHAR(100),
    табельный_номер ТабельныйНомер PRIMARY KEY IDENTITY,
    адрес_проживания VARCHAR(255) NOT NULL,
    дата_рождения DATE NOT NULL,
    код_национальности INT,
    пол CHAR(1) CHECK (пол IN ('М', 'Ж')),
    код_образования INT,
    кол_во_иждивенцев INT CHECK (кол_во_иждивенцев >= 0),
    ИИН VARCHAR(12) UNIQUE NOT NULL,
    код_пенсионного_фонда INT,
    код_должности INT,
    оклад DECIMAL(10, 2) NOT NULL,
    код_подразделения INT,
    дата_приема DATE NOT NULL,
    дата_увольнения DATE,
    FOREIGN KEY (код_национальности) REFERENCES Национальности(код_национальности) ON UPDATE CASCADE,
    FOREIGN KEY (код_образования) REFERENCES Образование(код_образования) ON UPDATE CASCADE,
    FOREIGN KEY (код_пенсионного_фонда) REFERENCES Пенсионные_фонды(код_фонда) ON UPDATE CASCADE,
    FOREIGN KEY (код_должности) REFERENCES Должности(код_должности) ON UPDATE CASCADE,
    FOREIGN KEY (код_подразделения) REFERENCES Подразделения(код_подразделения) ON UPDATE CASCADE
);
CREATE TABLE Типы_приказов (
	код_типа_приказа INT PRIMARY KEY,
	наименование NVARCHAR(100) NOT NULL 
);
CREATE TABLE Приказы (
    номер_приказа INT PRIMARY KEY IDENTITY(1,1),
    дата DATE NOT NULL,
    табельный_номер ТабельныйНомер,
    код_типа_приказа INT,
    текст_приказа VARCHAR(MAX),
    FOREIGN KEY (табельный_номер) REFERENCES Работники(табельный_номер) ON UPDATE CASCADE,
	FOREIGN KEY (код_типа_приказа) REFERENCES Типы_приказов(код_типа_приказа) ON UPDATE CASCADE
);
CREATE TABLE Штатное_расписание (
    код_подразделения INT,
    код_должности INT,
    общее_количество INT CHECK(общее_количество>=0),
    количество_вакансий INT CHECK(количество_вакансий>=0),
    PRIMARY KEY (код_подразделения, код_должности),
    FOREIGN KEY (код_подразделения) REFERENCES Подразделения(код_подразделения) ON UPDATE CASCADE,
    FOREIGN KEY (код_должности) REFERENCES Должности(код_должности) ON UPDATE CASCADE
);