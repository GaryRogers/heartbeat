USE master
GO

CREATE DATABASE Heartbeat
GO

CREATE LOGIN heartbeat_app WITH PASSWORD = 'Super_SECRET';  
GO

USE Heartbeat
GO

CREATE USER heartbeat_app FOR LOGIN heartbeat_app;  
GO 

EXEC sp_addrolemember 'db_owner', 'heartbeat_app';
GO
