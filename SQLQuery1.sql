CREATE DATABASE Public_Transportation_Transaction_DW;

use Public_Transportation_Transaction_DW;

drop table Fact1;
drop table Fact2;
drop table Fact3;
drop table Fact4;
drop table Fact5;
drop table Fact;

drop table Dim_Time_In;
drop table Dim_Card;
drop table Dim_Time_Out;
drop table Dim_Corridor;
drop table Dim_Stop_In;
drop table Dim_Stop_Out;
drop table Fact_Raw;



select * from Fact_Raw;
select * from Dim_Time_In;
select * from Dim_Time_Out;
select * from Dim_Card;
select * from Dim_Corridor;
select * from Dim_Stop_In;
select * from Dim_Stop_Out;


select * from Fact;







CREATE TABLE [Dim_Time_In] (
    [TimeInID] DATETIME CONSTRAINT pk_time_in PRIMARY KEY,
    [Day] INT,
    [Month] INT,
    [Year] INT,
    [Hour] INT,
    [Minute] INT,
    [Second] INT
)

CREATE TABLE [Dim_Time_Out] (
    [TimeOutID] DATETIME CONSTRAINT pk_time_out PRIMARY KEY,
    [Day] INT,
    [Month] INT,
    [Year] INT,
    [Hour] INT,
    [Minute] INT,
    [Second] INT
)

CREATE TABLE [Dim_Card] (
    [id_Card] int identity(1,1) CONSTRAINT pk_card PRIMARY KEY,
    [payCardID] bigint,
    [payCardBank] varchar(100),
    [payCardName] varchar(100),
    [payCardSex] varchar(50),
    [payCardBirthDate] int,
)

CREATE TABLE [Dim_Corridor] (
    [id_Corridor] int identity(1,1) CONSTRAINT pk_corridor PRIMARY KEY,
    [CorridorID] VARCHAR(50),
    [CorridorName] VARCHAR(500)
)

CREATE TABLE [Dim_Stop_In] (
    [tapInStopsID] int IDENTITY(1,1) CONSTRAINT pk_stop_in PRIMARY KEY,
    [tapInStops] varchar(100),
    [tapInStopsName] varchar(100),
    [tapInStopsLat] float,
    [tapInStopsLon] float,
    [stopStartSeq] int
)

CREATE TABLE [Dim_Stop_Out] (
    [tapOutStopsID] int IDENTITY(1,1) CONSTRAINT pk_stop_out PRIMARY KEY,
    [tapOutStops] varchar(100),
    [tapOutStopsName] varchar(100),
    [tapOutStopsLat] float,
    [tapOutStopsLon] float,
    [stopEndSeq] int
)






CREATE TABLE [Fact_Raw] (
    [transID] varchar(100) CONSTRAINT pk_fact_raw PRIMARY KEY,
    [payCardID] bigint,
    [corridorID] varchar(50),
    [tapInStops] varchar(100),
    [tapOutStops] varchar(100), 
    [tapInTime] datetime,
    [tapOutTime] datetime,
    [direction] int,
    [payAmount] float
)

CREATE TABLE [Fact1] (
    [transID] varchar(100) CONSTRAINT pk_fact1 PRIMARY KEY,
    [payCardID] bigint,
    [corridorID] varchar(50),
    [tapInStops] varchar(100),
    [tapOutStops] varchar(100),
    [TimeInID] datetime,
    [tapOutTime] datetime,
    [direction] int,
    [payAmount] float,
    )






CREATE TABLE [Fact2] (
    [transID] varchar(100) CONSTRAINT pk_fact2 PRIMARY KEY,
    [payCardID] bigint,
    [corridorID] varchar(50),
    [tapInStops] varchar(100),
    [tapOutStops] varchar(100),
    [TimeInID] datetime,
    [TimeOutID] datetime,
    [direction] int,
    [payAmount] float
)

CREATE TABLE [Fact3] (
    [transID] varchar(100) CONSTRAINT pk_fact3 PRIMARY KEY,
    [payCardID] bigint,
    [id_Corridor] int,
    [tapInStops] varchar(100),
    [tapOutStops] varchar(100),
    [TimeInID] datetime,
    [TimeOutID] datetime,
    [direction] int,
    [payAmount] float 
)






CREATE TABLE [Fact4] (
    [transID] varchar(100) CONSTRAINT pk_fact4 PRIMARY KEY,
    [id_Card] int,
    [id_Corridor] int,
    [tapInStops] varchar(100),
    [tapOutStops] varchar(100),
    [TimeInID] datetime,
    [TimeOutID] datetime,
    [direction] int,
    [payAmount] float 
)

CREATE TABLE [Fact5] (
    [transID] varchar(100) CONSTRAINT pk_fact5 PRIMARY KEY,
    [id_Card] int,
    [id_Corridor] int,
    [tapInStopsID] int,
    [tapOutStops] varchar(100),
    [TimeInID] datetime,
    [TimeOutID] datetime,
    [direction] int,
    [payAmount] float 
)






CREATE TABLE [Fact] (
    [transID] varchar(100) CONSTRAINT pk_fact6 PRIMARY KEY,
    [id_Card] int,
    [id_Corridor] int,
    [tapInStopsID] int,
    [tapOutStopsID] int,
    [TimeInID] datetime,
    [TimeOutID] datetime,
    [direction] int,
    [payAmount] float 
)



