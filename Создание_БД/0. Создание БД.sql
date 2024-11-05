CREATE DATABASE Staff
ON 
( 
    NAME = 'Staff_Data',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Staff_Data.mdf',
    SIZE = 8MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 64MB
)
LOG ON 
( 
    NAME = 'Staff_Log',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Staff_Log.ldf',
    SIZE = 8MB,
    MAXSIZE = 2GB,
    FILEGROWTH = 64MB
);
GO
