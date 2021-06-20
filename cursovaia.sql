GO
USE master;
DROP DATABASE if exists РаботаСклада;
CREATE DATABASE РаботаСклада;
GO

 use РаботаСклада;

CREATE TABLE товары(
ID_Товара int IDENTITY(1,1) NOT NULL CONSTRAINT PK_ID_Товара PRIMARY KEY,
Название_Товара varchar(20) NOT NULL,
Ед_Измерения varchar(10) NOT NULL,
Цена_за_ед money NOT NULL,
Дата_Выпуска datetime NOT NULL,
Признак varchar(20) NOT NULL,
);

CREATE TABLE приходные(
ID_Приходной varchar(20) NOT NULL PRIMARY KEY,
ID_Товара int NOT NULL,
Количество int NOT NULL,
Дата datetime NOT NULL,
);

CREATE TABLE поставщики(
ID_Поставщика varchar(20) NOT NULL CONSTRAINT PK_ID_Поставщика PRIMARY KEY,
Адрес varchar(20) NOT NULL,
Телефон int NOT NULL,
);

CREATE TABLE поставки(
ID_Приходной varchar(20) NOT NULL CONSTRAINT PK_ID_Приходной PRIMARY KEY,
ID_Поставщика varchar(20) NOT NULL,
ID_Склада varchar(20) NOT NULL,
CONSTRAINT FK_Поставки_TO_Поставщики
FOREIGN KEY (ID_Поставщика)
REFERENCES поставщики(ID_Поставщика)
);

CREATE TABLE склады(
ID_Склада varchar(20) NOT NULL CONSTRAINT PK_ID_Склада PRIMARY KEY,
Район varchar(20) NOT NULL,
Адрес varchar(20) NOT NULL,
Телефон_Склада int NOT NULL,
);

CREATE TABLE потребители(
ID_Потребителя varchar(20) NOT NULL CONSTRAINT PK_ID_Потребителя PRIMARY KEY,
Название_магазина varchar(20) NOT NULL,
Адрес varchar(20) NOT NULL,
Телефон int NOT NULL,
);

CREATE TABLE продажи(
ID_Расходной varchar(20) NOT NULL CONSTRAINT PK_ID_Расходной PRIMARY KEY,
ID_Потребителя varchar(20) NOT NULL,
ID_Склада varchar(20) NOT NULL,
CONSTRAINT FK_Продажи_TO_Потребители
FOREIGN KEY (ID_Потребителя)
REFERENCES потребители(ID_Потребителя)
);

CREATE TABLE расходные(
ID_Расходной varchar(20) NOT NULL PRIMARY KEY,
ID_Товара int NOT NULL,
Количество int NOT NULL,
Дата datetime NOT NULL,
);

CREATE TABLE учет_склада(
ID_Склада varchar(20) NOT NULL,
ID_Товара int NOT NULL,
Количество int NOT NULL,
PRIMARY KEY (ID_Склада, ID_Товара),
);

ALTER TABLE расходные
ADD CONSTRAINT FK_Расходные_TO_Товары
FOREIGN KEY (ID_Товара)
REFERENCES товары(Id_Товара)



ALTER TABLE приходные
ADD CONSTRAINT FK_Приходные_TO_Товары
FOREIGN KEY (ID_Товара)
REFERENCES товары(Id_Товара)

ALTER TABLE поставки
ADD CONSTRAINT FK_Поставки_TO_Склады
FOREIGN KEY (ID_Склада)
REFERENCES склады(Id_Склада)

ALTER TABLE продажи
ADD CONSTRAINT FK_Продажи_TO_Склады
FOREIGN KEY (ID_Склада)
REFERENCES склады(Id_Склада)

ALTER TABLE поставки
ADD CONSTRAINT FK_Поставки_TO_Приходные
FOREIGN KEY (ID_Приходной)
REFERENCES приходные(Id_Приходной)

ALTER TABLE расходные
ADD CONSTRAINT FK_Расходные_TO_Продажи
FOREIGN KEY (ID_Расходной)
REFERENCES продажи(Id_Расходной)

ALTER TABLE учет_Склада
ADD CONSTRAINT FK_Учет_Склада_TO_Товары
FOREIGN KEY (ID_Товара)
REFERENCES товары(ID_Товара)

ALTER TABLE учет_Склада
ADD CONSTRAINT FK_Учет_Склада_TO_Склады
FOREIGN KEY (ID_Склада)
REFERENCES склады(ID_Склада)

create table ucet_tovara( 
Id_Товара int identity(1,1) not null,
Название_Товара varchar(20) not null,
Колличество int NULL,
цена money, сумма as ([Колличество] * [Цена]) Persisted )

insert into ucet_tovara
values 
('koffee', 1, 5000),
('ciai', 3 , 20), 
('voda', 10, 50) 

select * from ucet_tovara



insert into товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак) 
values ('toner', 'шт', 20, '20.05.07', 'neprodov'),
('tonic','шт', 19, '20.05.08', 'neprodov'),
('crem', 'шт', 21, '20.07.07', 'prodov'),
('esentia','шт', 18, '20.05.09', 'prodov'),
('serum', 'шт', 30, '20.05.10', 'prodov'),
('spf','шт', 19, '20.05.08', 'prodov'),
('masca', 'шт', 21, '20.03.07', 'prodov'),
('patci','шт', 18, '20.05.09', 'prodov'),
 ('penca', 'шт', 22, '20.03.07', 'prodov'),
('scrab','шт', 18, '20.05.09', 'prodov')

--alter table поставщики 
--drop column Цена_За_Партию

insert into поставщики(ID_Поставщика, Адрес, Телефон)
values ('A210', 'kiev8', 234576),
('A201', 'kiev', 234567),
('A202', 'kiev1', 234568),
('A203', 'kiev2', 234569),
('A204', 'kiev3', 234570),
('A205', 'kiev4', 234571),
('A206', 'kiev5', 234572),
('A207', 'kiev6', 234573),
('A208', 'kiev7', 234574),
('A209', 'kiev8', 234575)

insert into приходные(ID_Приходной, ID_Товара, Количество, Дата)
values ('P01',1, 3,'19.03.07'),
('P02', 2,4,'19.04.07'),
('P03', 3,5,'19.05.07'),
('P04', 4,6,'19.06.07'),
('P05', 5,7,'19.07.07'),
('P06', 6,8,'19.08.07'),
('P07', 7,9,'19.09.07'),
('P08', 8,1,'19.10.07'),
('P09', 9,2,'19.11.07'),
('P10', 10,3,'19.12.07')

insert into склады(ID_Склада, Район, Адрес, Телефон_Склада)
values ('SK01', 'risc', 'dimo',060999),
('SK02', 'risc', 'saharovo',060998),
('SK03', 'risc', 'russo',060997),
('SK04', 'risc', 'kiev',060996),
('SK05', 'risc', 'moscov',060995),
('SK06', 'risc', 'florilor',060994),
('SK07', 'cioc', 'sadoveanu',060993),
('SK08', 'cioc', 'vieru',060992),
('SK09', 'cioc', 'lui voda',060991),
('SK10', 'ciocan', 'ginta',060990)

insert into поставки(ID_Приходной, ID_Поставщика, ID_Склада)
values ('P01', 'A201', 'SK01'),
('P02', 'A202', 'SK02'),
('P03', 'A203', 'SK03'),
('P04', 'A204', 'SK04'),
('P05', 'A205', 'SK05'),
('P06', 'A206', 'SK06'),
('P07', 'A207', 'SK07'),
('P08', 'A208', 'SK08'),
('P09', 'A209', 'SK09'),
('P10', 'A210', 'SK10')

insert into потребители(ID_Потребителя, Название_магазина, Адрес, Телефон)
values ('B11','n1', 'adress1', 01231),
('B12','n2', 'adress2', 01232),
('B13','n3', 'adress3', 01233),
('B14','n4', 'adress4', 01234),
('B15','n5', 'adress5', 01235),
('B16','n6', 'adress6', 01236),
('B17','n7', 'adress7', 01237),
('B18','n8', 'adress8', 01238),
('B19','n9', 'adress9', 01239),
('B20','n10','adress10', 012310)



insert into продажи(ID_Расходной, ID_Потребителя, ID_Склада)
values ('R01','B11', 'SK01'),
('R02', 'B12', 'SK02'),
('R03', 'B13', 'SK03'),
('R04', 'B14', 'SK04'),
('R05', 'B15', 'SK05'),
('R06', 'B16', 'SK06'),
('R07', 'B17', 'SK07'),
('R08', 'B18', 'SK08'),
('R09', 'B19', 'SK09'),
('R10', 'B20', 'SK10')

INSERT INTO учет_склада(ID_Склада, ID_Товара, Количество)
VALUES ('SK01',1,11),
('SK02',2,11),
('SK03',3,11),
('SK04',4,11),
('SK05',5,11),
('SK06',6,11),
('SK07',7,11),
('SK08',8,11),
('SK09',9,11),
('SK10',10,11)


insert into расходные(ID_Расходной, ID_Товара, Количество, Дата)
values ('R01',1, 2,'19.04.07'),
('R02', 2,3,'19.05.07'),
('R03', 3,4,'19.06.07'),
('R04', 4,5,'19.07.07'),
('R05', 5,6,'19.08.07'),
('R06', 6,7,'19.09.07'),
('R07', 7,8,'19.10.07'),
('R08', 8,9,'19.11.07'),
('R09', 9,1,'19.12.07'),
('R10', 10,2,'20.01.07')


--3 try catch
go
create procedure prod2
as
select 
ERROR_NUMBER() as ErrNum,
ERROR_SEVERITY() as ErrSeverity,
ERROR_STATE() as ErrState,
ERROR_LINE() as ErrorLine,
ERROR_MESSAGE() as ErrMessage;
go

begin try
select 1/0;
end try
begin catch 
execute prod2;
end catch;

drop procedure prod2;
go

--4 temp table 
CREATE TABLE #ProductSummary 
(ProdId INT IDENTITY, 
ProdName NVARCHAR(20), 
Price MONEY) 

INSERT INTO #ProductSummary 
VALUES ('Nokia 8', 18000), 
('iPhone 8', 56000) 

SELECT * FROM #ProductSummary 


SELECT товары.ID_Товара, 
SUM(учет_склада.Количество) AS TotalCount, 
SUM(Количество * Цена_за_ед) AS TotalSum 
INTO #OrdersSummary 
FROM учет_склада, товары 
GROUP BY товары.ID_Товара 

SELECT товары.Название_Товара, #OrdersSummary.TotalCount, #OrdersSummary.TotalSum 
FROM товары 
JOIN #OrdersSummary ON товары.ID_Товара = #OrdersSummary.ID_Товара


drop table #OrdersSummary, #ProductSummary 

--5 execute

EXEC sp_executeSQL N'Select * from товары Where 
ID_Товара = @Number', 
N'@Number INT', --zadaiem tip znaceniai peremenoi
@Number = 1



--lab 7
use РаботаСклада;
--1.2 Записать запрос для добавления кортежей в два новых отношения, 
--используя оператор SELECT … INTO.
go 
create table товары_с_товаров(
ID_Товара int NOT NULL PRIMARY KEY,
Название_Товара varchar(20) NOT NULL,
Ед_Измерения varchar(10) NOT NULL,
Цена_за_ед money NOT NULL,
Дата_Выпуска datetime NOT NULL DEFAULT ('2019-01-01'),
Признак varchar(20)  NULL,
);

CREATE TABLE склады_со_складов(
ID_Склада varchar(20) NOT NULL PRIMARY KEY,
Район varchar(20) NOT NULL,
Адрес varchar(20) NOT NULL CHECK (Адрес LIKE '[A-Z][A-Z][A-Z]%'),
Телефон_Склада int NOT NULL,
);

GO 
INSERT INTO товары_с_товаров SELECT * FROM товары
INSERT INTO склады_со_складов SELECT * FROM склады

SELECT * FROM товары_с_товаров
SELECT * FROM склады_со_складов

alter table товары_с_товаров 
alter column Признак varchar(20) null

--drop table товары_с_товаров
--drop table склады_со_складов

--задание для курсовой 

SELECT * INTO NewTable2
FROM товары;

select * from NewTable2


--1.3. Записать два запроса для операторa INSERT с подзапросом:
--INSERT TOP … SELECT, 
--INSERT … SELECT TOP.

INSERT TOP(5) INTO  склады_со_складов
SELECT *
FROM склады
SELECT * FROM склады_со_складов

INSERT INTO товары_с_товаров
SELECT TOP(5) * 
FROM товары
SELECT * FROM товары_с_товаров


--1.4 Записать два запроса для изменения кортежей 
--(с помощью операторов UPDATE TOP, UPDATE с подзапросом). 

UPDATE TOP (5) товары_с_товаров SET Признак = 'НЕИЗВЕСТНО'
select * from товары_с_товаров

UPDATE склады_со_складов
SET Район = 'changed'
WHERE Адрес IN (SELECT TOP (5) Адрес FROM склады WHERE Адрес LIKE '[A-H]%')
select * from склады_со_складов
--1.5 Записать два запроса для удаления кортежей с помощью операторов
--DELETE TOP, DELETE с подзапросом

DELETE TOP (10) товары_с_товаров WHERE Цена_за_ед <= 21
select * from товары_с_товаров

DELETE склады_со_складов 
WHERE Адрес IN (SELECT Адрес FROM склады WHERE Адрес LIKE '[A-F]%')
SELECT * FROM склады_со_складов

--1.6 Напишите три запроса для оператора OUTPUT (совместно с INSERT, DELETE, UPDATE).
--delete
DECLARE @del_table TABLE (ID_товара INT, Дата_Выпуска DATE);
DELETE товары_с_товаров
OUTPUT DELETED.ID_Товара, DELETED.Дата_Выпуска INTO @del_table
SELECT * FROM @del_table
SELECT * FROM товары_с_товаров


--insert 
DECLARE @ins_table TABLE (ID_Товара int NOT NULL PRIMARY KEY,
Название_Товара varchar(20) NOT NULL,
Ед_Измерения varchar(10) NOT NULL,
Цена_за_ед money NOT NULL,
Дата_Выпуска datetime NOT NULL DEFAULT ('2019-01-01'),
Признак varchar(20) NOT NULL);

INSERT INTO товары_с_товаров
OUTPUT INSERTED.ID_Товара,
INSERTED.Название_Товара,
INSERTED.Ед_Измерения,
INSERTED.Цена_за_ед,
INSERTED.Дата_Выпуска,
INSERTED.Признак

INTO @ins_table
VALUES
(1, 'toner', 'шт', 20, '20.05.07', 'neprodov'),
(2, 'tonic','шт', 19, '20.05.08', 'neprodov'),
(3, 'crem', 'шт', 21, '20.07.07', 'prodov'),
(4, 'esentia','шт', 18, '20.05.09', 'prodov'),
(5, 'serum', 'шт', 30, '20.05.10', 'prodov')
SELECT * FROM @ins_table

--update
DECLARE @update_table TABLE(ID_склада varchar(20), Адрес varchar(20));
UPDATE склады_со_складов
SET Район = 'Unknown'
OUTPUT INSERTED.ID_Склада, INSERTED.Адрес INTO @update_table
WHERE Телефон_Склада LIKE '60%'
SELECT * FROM @update_table
select * from склады_со_складов

--2
--2.1Напишите к Вашей БД запросы с вложенными некоррелированными подзапросами 
--(по одному запросу для каждого из предикатов IN, ALL, ANY, EXISTS).

--IN удалить все склады, которые находятся в районе, который начинается на a-c
DELETE склады_со_складов
WHERE Адрес IN (SELECT Адрес FROM склады WHERE Район LIKE '[A-C]%')
select * from склады_со_складов

--ALL    как работает???
SELECT *
FROM товары_с_товаров
WHERE Дата_Выпуска >= ALL (
SELECT Дата_Выпуска
FROM товары
WHERE Признак = 'prodov')

--ANY	нходим товары с признаком prodov 
SELECT *
FROM товары_с_товаров
WHERE ID_Товара = ANY (
SELECT ID_Товара
FROM товары
WHERE Признак = 'prodov')

--EXISTS	найдем все товары, на которые не было расходных в таблице расходные:
SELECT *
FROM товары_с_товаров
WHERE EXISTS 
(SELECT * FROM расходные WHERE товары_с_товаров.ID_Товара = расходные.ID_Товара )


--2.2 Напишите по одному коррелированному подзапросу с предикатами
--IN,
--EXISTS с одним внешним атрибутом в подзапросе, 
--EXISTS с несколькими внешними атрибутами в подзапросе.

--IN

SELECT С.Название_Товара
FROM товары AS С
WHERE 'serum' IN (SELECT Название_Товара FROM товары AS B
WHERE B.ID_Товара = С.ID_Товара)


--EXISTS
--1)

SELECT С.Название_Товара
FROM товары AS С
WHERE EXISTS
(SELECT * FROM расходные AS B
WHERE B.Количество > 7 AND B.ID_Товара = С.ID_Товара)
ORDER BY С.Название_Товара, С.ID_Товара

--2)   выводит все товары, где количество больше либо равно 7  

SELECT С.ID_Товара, С.Название_Товара, С.Дата_Выпуска, С.Признак
FROM товары AS С
WHERE EXISTS
(SELECT * FROM расходные AS B
WHERE B.Количество >= 7 AND B.ID_Товара = С.ID_Товара)
ORDER BY С.Название_Товара, С.ID_Товара

--2.3 Напишите к БД по одному запросу с подзапросом после FROM,
--после SELECT,
--а также с подзапросом в качестве выражения в других местах.

--FROM
SELECT * FROM (SELECT * FROM товары WHERE Признак = 'neprodov') расходные

--SELECT     не понятно что делает 
SELECT Название_Товара, Признак  AS описание_товара,
(SELECT ID_товара AS ID FROM товары AS two 
WHERE ID_товара = 2) AS ID
FROM товары AS one

--3) --ищет район, у которого номер телефона 60996 и выводит склады, которые находятся в этой районе 
Select * FROM склады_со_складов WHERE Район IN 
(SELECT Район FROM склады WHERE Телефон_Склада LIKE '60996')

--3
--3.1 Напишите к базе данных запросы, используя обобщающие функции
--AVG, COUNT, MIN, MAX, SUM. Некоторые напишите с подзапросом.
SELECT MIN(ID_товара) AS 'Min Id товара'
FROM товары

SELECT MAX(ID_товара) AS 'Max Id товара'
FROM товары
WHERE Признак IN (SELECT Признак FROM товары WHERE Признак = 'neprodov')

SELECT COUNT(ID_товара) AS 'Кол-во непродовольственных товаров'
FROM товары
WHERE Признак IN (SELECT Признак FROM товары WHERE Признак = 'neprodov')

 --посмотреть этот avg
SELECT AVG(ID_товара)/2 AS 'СРЕДНЕЕ ЗНАЧЕНИЕ ID деленное на 2'
FROM товары
--посмотреть и этот запрос
SELECT SUM(ID_Товара)+AVG(ID_Товара) AS 'СУММА ВСЕХ ID + СРЕДНЕЕ ЗНАЧЕНИЕ ID '
FROM товары

--3.2 Напишите к базе данных два группирующих запроса с использованием оператора 
--GROUP BY, с подзапросом. В одном из них используйте HAVING

SELECT Название_товара, COUNT(Название_товара) as Колво_записей FROM 
(SELECT Название_товара FROM товары WHERE Признак = 'neprodov') AS Колво_непродовольственных_товаров
GROUP BY Название_товара
--разобраться
SELECT Название_товара, Признак
FROM (SELECT Название_товара, Признак FROM товары) собаки
GROUP BY Название_товара, Признак
HAVING COUNT(*) >= 2

--3.4 Напишите по одному запросу для операторов PIVOT и UNPIVOT.
--в rabotesclada (запросе) поменять даты 2009-05-20(их 3 одинаковых поменять на 21, 22 . Также поменять 2008 году )
--и продолжить работать на этим заданимем 
SELECT Название_Товара,[2007-05-20],[2008-05-20],[2007-07-20],[2009-05-20],[2010-05-20],
[2008-05-21],[2007-03-02],[2009-05-21],[2007-03-20],[2009-05-22], [2010-03-03],
[2018-02-22],[2019-03-03],[2020-01-01],[2019-07-28]
FROM РаботаСклада.dbo.товары
PIVOT (COUNT(ID_товара) FOR Дата_Выпуска IN 
([2007-05-20],[2008-05-20],[2007-07-20],[2009-05-20],[2010-05-20],
[2008-05-21],[2007-03-02],[2009-05-21],[2007-03-20],[2009-05-22],[2010-03-03],
[2018-02-22],[2019-03-03],[2020-01-01],[2019-07-28]))AS testpivot

CREATE TABLE Студенты
(Id INT PRIMARY KEY IDENTITY,
Имя_Студента VARCHAR (50),
SOMIPP INT,
PAM INT,
WEB INT,
BD INT)
GO

INSERT INTO Студенты VALUES ('Глеб', 8, 9, 10, 8)
INSERT INTO Студенты VALUES ('Сергей', 7, 6, 5, 5)

SELECT Имя_студента, Предмет, Оценка
FROM Студенты
UNPIVOT
(Оценка FOR Предмет in (SOMIPP, PAM, WEB, BD)
) AS UnpivotTest

drop table Студенты


--lab8
use РаботаСклада;
--1. Напишите в SQL запросы для каждой из теоретико-множественных операций над отношениями 
--(объединение, пересечение, разность, декартово произведение, активное дополнение).

--объединение (вывести id товара,Признак, Цена_за_ед, у которого признак является prodov или Цена за единицу будет больше 19)  
SELECT ID_товара,Признак, Цена_за_ед
FROM товары WHERE Признак Like 'prodov'
UNION
SELECT ID_товара,Признак, Цена_за_ед
FROM товары WHERE Цена_за_ед > 19

--пересечение (вывести id товара, у которого признак является prodov и Цена за единицу будет больше 19)
SELECT ID_Товара
FROM товары WHERE Признак Like 'prodov'
INTERSECT
SELECT ID_Товара
FROM товары WHERE Цена_за_ед > 19
ORDER BY ID_Товара
GO

--разность (вывести id товара, у которого признак является prodov, но Цена за единицу будет меньше 19)
SELECT ID_Товара
FROM товары WHERE Признак Like 'prodov'
EXCEPT
SELECT ID_Товара
FROM товары WHERE Цена_за_ед > 19
ORDER BY ID_Товара
GO

--декартово произведение (найти все ассоциации между товарами и складами)
select *
from товары ,склады
order by ID_Склада

--(активное дополнение) 
SELECT ID_Товара, Название_Товара, Цена_за_ед
FROM (SELECT ID_Товара FROM товары)  AS ID_товара
CROSS JOIN 
(SELECT Название_Товара FROM товары)  AS Название
CROSS JOIN 
(SELECT Цена_за_ед FROM товары)  AS Цена
EXCEPT 
SELECT ID_Товара, Название_Товара, Цена_за_ед FROM товары

--2. Напишите запрос, реализующий операцию декартово произведение отношения с самим собой,
--используя для этого переименование атрибутов
--выводятся все возможные пары
select distinct т2.* , т.Название_Товара as Наименование_товара from товары as т, товары as т2 
go

--Задание 2. Реализация в SQL специальных реляционных операций

--Напишите запросы для каждой из специальных операций реляционной алгебры
--(селекция,проекция, деление, естественное соединение, тета-соединение,
--экви-соединение, самосоединение, полусоединение, внешнее соединение трех типов).


--селекция (выбрать все товары с признаком непродовольственным)
select *
from товары where Признак Like 'neprodov'

--проекция (показать название и адрес всех складов )
select ID_Склада, Адрес
from склады

--Деление (находим товар, который продовали только 2 раза)
select Количество
into Колво_продаж
from расходные
WHERE Количество=2
go
select distinct расходные.ID_товара, расходные.Количество
from расходные
WHERE not exists (select* from Колво_продаж as Количество_Продаж
WHERE not exists (select * from расходные as Продаж_количество
WHERE Количество_Продаж.Количество= Продаж_количество.Количество and расходные.ID_Товара=Продаж_количество.ID_Товара))
GO
drop table Колво_продаж
go

--естественное соединение (показываем всю информацию о товарах и также количество продаж с таблицы расходные)
select товары.*, расходные.Количество as Количесво_продаж
from расходные inner join товары on расходные.ID_Товара = товары.ID_товара
order by Количество
go

--тета соединение (вывести инфомрацию о товарах, у которых кол-во продаж меньше 7)
select товары.*, расходные.Количество as Количесво_продаж
from расходные inner join товары on расходные.ID_Товара = товары.ID_товара
where Количество<7
order by Количество
go

--экви соединение (вывожу все продов товары)

select товары.*, расходные.ID_Товара
from товары , расходные
where товары.ID_Товара = расходные.ID_Товара and товары.Признак like 'prodov'
go

--сомосоединение (вывести товары с признаком продов)
select т1.Название_Товара, т1.Признак
from товары as т1 Inner join товары as т2 
on т1.Название_Товара = т2.Название_Товара and т1.признак = 'prodov'

--полусоединение (вывести информацию о товарах в расходных)
select товары.*
from товары, расходные
where товары.ID_Товара=расходные.ID_Товара
go

--left outer join. вывести информацию о товарах и ее покупках(расходные) ,если она есть
select товары.* , расходные.ID_Товара
from товары LEFT OUTER JOIN расходные
on товары.ID_Товара=расходные.ID_Товара
go

--full outer join
SELECT расходные.* , товары.*
FROM товары FULL OUTER JOIN расходные
ON товары.ID_Товара=расходные.ID_Товара
GO

alter table товары
alter column Признак varchar(20)  null

SELECT товары.* , расходные.ID_Товара
FROM товары RIGHT OUTER JOIN расходные
ON товары.ID_Товара=расходные.ID_Товара
GO

--lab9

use РаботаСклада;
--1.
--1.Напишите транзакцию. Установите соответствующий уровень изоляции. 

--Вывести данные товаров, цена за единицу которых меньше среднего
set transaction isolation level REPEATABLE READ 
BEGIN TRAN

SELECT *
FROM Работасклада.dbo.товары
WHERE Цена_за_ед < (SELECT AVG([Цена_за_ед]) AS Цена_за_единицу FROM товары)
ORDER BY Цена_за_ед
COMMIT TRAN 
GO 

--2.2. Напишите транзакцию, в которой произойдёт ошибка.
--Откатите данную транзакцию с ошибкой и выведете сообщение об ошибке.

--В отношение товары вставляю два значения. Одно правилное, второе нет.
--из-за отката первая строчка(правильная) не вставится в отношение 

set transaction isolation level REPEATABLE READ 
BEGIN TRAN

insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ('antiwrinklesthg','st',50, '2002-05-09', 'neprodov')
insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ('antiwrinklesthg', 8 ,'st',50, '2002-05-09', 'neprodov')
rollback tran 

--3. Напишите транзакцию, в которой будет несколько операторов INSERT. 
--Значения выбирайте наугад, однако проследите за тем,
--чтобы если один из операторов выдаст ошибку, все остальные не сработали.
--Выводите сообщения об удачном завершении транзакции или провале.

--Вставляю некоторые значения в отнршения. В одном из них будет ошибка. Выведется сообщение об ошибки 
begin try 
set transaction isolation level REPEATABLE READ 
begin tran 

insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ( 'antiwrinklesthg','st',50, '2002-05-09', 'neprodov')
insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ('antiwrinklesthg' ,'st',50, '2002-05-09', 'neprodov')
insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ('antiwrinklesthg','st','st', '2002-05-09', 'neprodov')
insert into Работасклада.dbo.товары(Название_Товара, Ед_Измерения, Цена_за_ед, Дата_Выпуска, Признак)
values ('antiwrinklesthg','st' ,50, '2002-05-09', 'neprodov')

print 'tran was successfull'
	end try
begin catch
rollback tran
print 'Error tran'
	end catch
go

--4. Напишите транзакцию. Установите соответствующий уровень изоляции.

--Вывести  непродов товары, которые стоят больше средней цены всех товаров   
set transaction isolation level REPEATABLE READ 
BEGIN TRAN

SELECT *
FROM Работасклада.dbo.товары
WHERE Цена_за_ед > (SELECT AVG([Цена_за_ед]) AS Цена_за_единицу FROM Работасклада.dbo.товары) and 
Признак Like 'neprodov'
ORDER BY Цена_за_ед
COMMIT TRAN 
GO 

--5 
--Обновить список товаров так, чтобы товар с названием тонер поменял свой признак 
set transaction isolation level REPEATABLE READ 
BEGIN TRAN

UPDATE Работасклада.dbo.товары
set Признак = 'prodov1'
WHERE Название_Товара = 'toner'
COMMIT TRAN
GO 

sELECT * FROM Работасклада.dbo.товары
GO


--2
--1.	Напишите две транзакции к БД Automobiles, у которых высокая вероятность взаимоблокировки 
--(используете высокий уровень изоляции в транзакциях и разную последовательность доступа к таблицам). 


set transaction isolation level SERIALIZABLE
BEGIN TRAN tran1
UPDATE РаботаСклада.dbo.товары_с_товаров1 SET Признак = 'Продовольственный' WHERE Признак LIKE 'prodov'
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'Непродовольственный' WHERE Признак LIKE 'neprodov'


set transaction isolation level SERIALIZABLE
BEGIN TRAN tran2
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'Непродовольственный' WHERE Признак LIKE 'neprodov'
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'Продовольственный' WHERE Признак LIKE 'prodov'

COMMIT 
GO

SELECT * FROM РаботаСклада.dbo.товары_с_товаров1 


--2Напишите те же транзакции из задания 2 пункт 1, но уже с меньшей вероятностью взаимоблокировки 
--(используйте рекомендации минимизации взаимоблокировок из теоретических указаний).

set transaction isolation level READ COMMITTED
BEGIN TRAN tran1
UPDATE РаботаСклада.dbo.товары_с_товаров1 SET Признак = 'prodov' WHERE Признак LIKE 'Продовольственный'
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'neprodov' WHERE Признак LIKE 'Непродовольственный'


set transaction isolation level READ COMMITTED
BEGIN TRAN tran2
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'neprodov' WHERE Признак LIKE 'Непродовольственный'
UPDATE РаботаСклада.dbo.товары_с_товаров1  SET Признак = 'prodov' WHERE Признак LIKE 'Продовольственный'

COMMIT 
GO


SET transaction isolation level READ COMMITTED
BEGIN TRAN tran1
UPDATE РаботаСклада.dbo.товары_с_товаров1 WITH(SERIALIZABLE) SET Признак = 'Продовольственный' WHERE Признак LIKE 'prodov'
UPDATE РаботаСклада.dbo.товары_с_товаров1 WITH(SERIALIZABLE)  SET Признак = 'neprodov' WHERE Признак LIKE 'Непродовольственный'
COMMIT 
GO


--lab10
use РаботаСклада
--1
--1.1 Создайте пользовательскую функцию, которая возвращает самый дешевый товар на скалде с ценой свыше, указанной в аргументе функции.
--Запустите ее. Измените эту функцию, чтобы она вместо возврата самого дешевого товара после указанной цены возвращала цену самого дорогого товара до указанной цены. Проверьте ее работу.
go
CREATE FUNCTION TheCheapestItem (@price int)
RETURNS int
AS
BEGIN
	DECLARE @tmp int;
	SELECT @tmp = MIN(Цена_за_ед)
	FROM товары
	WHERE Цена_за_ед > @price
	IF (@tmp IS NULL)
	SET @tmp = 19
	RETURN @tmp
END
GO
SELECT dbo.TheCheapestItem (20) AS TheCheapest
GO
ALTER FUNCTION TheCheapestItem (@price int)
RETURNS int
AS
BEGIN
	DECLARE @tmp int;
	SELECT @tmp = Max(Цена_за_ед)
	FROM товары
	WHERE Цена_за_ед < @price
	IF (@tmp IS NULL)
	SET @tmp = 21
	RETURN @tmp
END
GO
SELECT dbo.TheCheapestItem (20) AS TheMostExpensive
GO

drop function TheCheapestItem
go

--1.2 -- Создайте пользовательскую функцию, которая возвращает данные в виде таблицы о товаре,
-- на которое указывает признак в аргументе функции. Проверьте работу функции. 
GO
CREATE FUNCTION GETITEMINFO (@PRIZNAK VARCHAR(50))
returns @tmpInfoTable TABLE
(
	Название VARCHAR(50) NOT NULL ,
	ID_товара INT NOT NULL PRIMARY KEY,
	Признак VARCHAR(50) NOT NULL


)
AS BEGIN
	DECLARE
	@ID_товара INT,
	@Название VARCHAR(50),
	@Признак VARCHAR(50);
	

	SELECT 
	@Название = Название_Товара, 
	@ID_товара = ID_Товара, 
	@Признак = Признак
	
	FROM товары
	WHERE Признак = @PRIZNAK
	
	IF @Название IS NOT NULL
	BEGIN
		INSERT @tmpInfoTable
		SELECT @Название,@ID_товара,@Признак;
	END
RETURN
END

GO
SELECT * FROM dbo.GETITEMINFO ('neprodov')
GO 

drop function GETITEMINFO
go


--2
--Создайте хранимую процедуру, которая вставляет новые записи в отношение склады. Запустите её.
go
CREATE PROCEDURE NewWarehouse (@ID_Склада VARCHAR(20),@Район VARCHAR(20),@Адрес VARCHAR(20),@Телефон INT)
AS
BEGIN
	BEGIN TRY
		INSERT INTO склады
		VALUES (@ID_Склада,@Район,@Адрес,@Телефон)
	END TRY
	BEGIN CATCH
	PRINT 'Ошибка при выполнении процедуры!'
	RETURN -1
	END CATCH
END


go
--DISABLE TRIGGER NewWarehouse ON склады
DELETE FROM склады WHERE ID_Склада = 'SK5568'
EXECUTE dbo.NewWarehouse 'SK5568','botanica','Decebal3',707879
select * from склады


drop procedure NewWarehouse

--3 Работа с триггерами 
--3.1 Создайте DML триггер, который при добавлении нового кортежа в отношение «товары» автоматически выводит всю необходимую информацию о товаре, а также дату завоза.
go
CREATE TRIGGER itemChange
ON товары
AFTER INSERT												 --Триггер AFTER запускается после успешного завершения SQL-сервером всех операций. 
AS
DECLARE @now DATETIME
SET @now = getdate()
BEGIN TRY
SELECT 'INSERTED ROW', @now, inserted.Название_Товара, inserted.Дата_Выпуска, inserted.Признак, inserted.Ед_Измерения
FROM INSERTED
END TRY
BEGIN CATCH
PRINT 'Error!'
ROLLBACK TRANSACTION
END CATCH

go
 SET IDENTITY_INSERT dbo.товары ON;      

ENABLE TRIGGER itemChange ON товары
DELETE FROM товары WHERE Название_Товара = 'pasta'
INSERT INTO товары(ID_Товара, Название_Товара,Ед_Измерения,Цена_за_ед, Дата_Выпуска, Признак)
VALUES (52,'pasta','st',200, '2000-11-11','neprodov') 
go

drop trigger itemChange
 go
 
--3.2 Напишите DML триггер, который обеспечил бы правильное (последовательное) заполнение кортежами двух заданных связанных отношений и позволил бы избежать ошибок на уровне внешних ключей. 

go
CREATE TRIGGER SecondTrigger
ON РаботаСклада.dbo.расходные
INSTEAD OF INSERT				-- триггеры, срабатывающие вместо инициирующего действия
AS
DECLARE @now DATETIME
SET @now = getdate()

BEGIN TRY
IF NOT EXISTS (SELECT ID_Товара FROM РаботаСклада.dbo.товары WHERE ID_Товара = (SELECT ID_Товара FROM inserted))
PRINT 'Товары с таким ID не существует, пожалуйста добавьте данный товар в базу!'

ELSE SELECT 'INSERTED ROW', @now, inserted.ID_Товара
FROM INSERTED
END TRY
BEGIN CATCH
PRINT 'Error!'
ROLLBACK TRANSACTION
END CATCH

INSERT INTO РаботаСклада.dbo.расходные VALUES ('RRR1',52,5,getdate())
INSERT INTO РаботаСклада.dbo.расходные VALUES ('RRR2',55,6,getdate())

 go
drop trigger SecondTrigger

--3.3 . Напишите DML триггер, который реализует комплексное многотабличное ограничение к базе данных и следит за соблюдением данного ограничения для каждого введенного, измененного, или удаленного кортежа. 
go
CREATE TRIGGER ThirdTrigger
ON расходные
FOR INSERT,UPDATE
AS
DECLARE @now DATETIME
SET @now = getdate()

BEGIN TRY
IF EXISTS (SELECT Дата_Выпуска FROM товары WHERE Дата_Выпуска > (SELECT Дата FROM inserted))
PRINT 'Дата выпуска товара указана неверно!'
ELSE SELECT 'INSERTED ROW', @now, inserted.ID_Расходной, inserted.ID_Товара, inserted.Дата
FROM INSERTED
ROLLBACK TRANSACTION
END TRY
BEGIN CATCH
PRINT 'Error!'
ROLLBACK TRANSACTION
END CATCH

UPDATE расходные SET Дата = '2018-01-01' WHERE ID_Товара = 2
drop trigger ThirdTrigger

/*3.4 Создайте копию отношения «товары» и назовите его «ItemTest». 
Затем создайте DDL триггер, который при попытке удалить отношение «ItemTest» вместо того чтобы его удалить,
заменяет значение всех полей «Имя_товара» на слова «Удалено из БД».
Попробуйте удалить отношение «ItemTest». 
Убедитесь, что оно ещё существует и что значения полей «Имя_товара» поменялись при помощи запроса: SELECT * FROM dbo.ItemTest. 
Удалите триггер. Создайте хранимую процедуру, которая удаляет отношение «ItemTest».
Запустите процедуру, затем удалите её. */

GO
SELECT * INTO ItemTest FROM РаботаСклада.dbo.товары

Go
CREATE TRIGGER ddl_dropdogTestTable ON DATABASE
FOR DROP_TABLE AS
BEGIN
	DECLARE @Schema SYSNAME = eventdata().value('(/EVENT_INSTANCE/SchemaName)[1]', 'sysname');
	DECLARE @Table SYSNAME = eventdata().value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname');
	IF @Schema = 'dbo' AND @Table = 'ItemTest'
	BEGIN
		PRINT 'DROP TABLE Issued.';
		RAISERROR ('[dbo].[ItemTest] cannot be dropped.', 16, 1);
		ROLLBACK;
		BEGIN TRAN
			UPDATE dbo.ItemTest
			SET Название_Товара = 'Удалено из БД'
			PRINT 'Отключите триггер ddl_dropTable чтобы удалить отношение ItemTest!'
		COMMIT
	END	
END

GO
DROP TABLE ItemTest
SELECT * FROM РаботаСклада.dbo.ItemTest
GO
DISABLE TRIGGER ddl_dropdogTestTable ON DATABASE;
DROP TRIGGER ddl_dropdogTestTable ON DATABASE;
GO

DROP PROCEDURE if exists delete_table
go
CREATE PROCEDURE delete_table 
AS
BEGIN
	DROP TABLE ItemTest
	PRINT 'Отношение ItemTest успешно удалено'
END
Go
EXEC delete_table
GO 

--3.5. Напишите DDL триггер, который запрещает удаление ограничений в отношениях, используемого для связи между таблицами.
GO
CREATE TRIGGER refferencies ON DATABASE
FOR ALTER_TABLE
AS begin
IF(EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)') LIKE '%drop constraint%')
ROLLBACK TRANSACTION
END
GO
ALTER TABLE РаботаСклада.dbo.товары ADD CONSTRAINT ddl_check CHECK (Признак != 'prodov11')
ALTER TABLE РаботаСклада.dbo.товары DROP CONSTRAINT ddl_check
GO
DISABLE TRIGGER refferencies ON DATABASE
DROP TRIGGER refferencies ON DATABASE




--3.6 Напишите DDL триггер, который при изменении свойств определенного поля, сделал бы автоматически схожие изменения в остальных таблицах. 

GO
CREATE TRIGGER change ON DATABASE
FOR ALTER_TABLE
AS begin
DECLARE @option NVARCHAR(max)
SET @option = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)')
EXEC @option
SET @option = 'DELETE FROM приходные WHERE ID_Приходной = P02'
EXEC @option
END

GO
DELETE FROM РаботаСклада.dbo.поставки
WHERE ID_Приходной = 'P04'
GO
DISABLE TRIGGER change ON DATABASE
DROP TRIGGER change ON DATABASE 

--7.Напишите триггер, который запрещает изменение схемы базы данных вне рабочего времени.

GO
CREATE TRIGGER timechanger
ON DATABASE
FOR ALTER_TABLE
AS
BEGIN
	DECLARE @start_day TIME, @stop_day TIME, @now TIME
	SET @start_day=convert(varchar(10),'13:00:00',108)
	SET @stop_day=convert(varchar(10),'24:00:00',108)
	SET @now = convert(varchar(10),GETDATE(),108)
	IF (@now<@start_day) OR (@now > @stop_day)
	BEGIN
	PRINT 'Сейчас не рабочее время!'
	ROLLBACK TRANSACTION
	END
END
GO
ENABLE TRIGGER timechanger ON DATABASE
GO

ALTER TABLE [склады]
ADD testrow int NULL

GO
DISABLE TRIGGER timechanger ON DATABASE
GO
DROP TRIGGER timechanger ON DATABASE

ALTER TABLE [склады]
DROP COLUMN testrow

-- 8Напишите LOGON триггер, который запрещает заданному пользователю вход в систему, если у него уже есть 3 активных подключения с данным логином к одному экземпляру SQLServer. Триггер должен считать количество активных подключений для данного логина из системного представления sys.dm_exec_sessions.

USE master
GO
CREATE LOGIN login_test5 WITH PASSWORD = '1234',
	CHECK_EXPIRATION = ON;
GO
GRANT VIEW SERVER STATE TO login_test5;
GO
create TRIGGER connection_limit_trigger
ON ALL SERVER WITH EXECUTE AS 'login_test5'
FOR LOGON
AS
BEGIN
IF ORIGINAL_LOGIN()= 'login_test5' AND
	(SELECT COUNT(*) FROM sys.dm_exec_sessions
		WHERE is_user_process = 1 AND
			original_login_name = 'login_test5') > 5
	ROLLBACK
END
GO
DISABLE TRIGGER connection_limit_trigger ON ALL SERVER
DROP TRIGGER connection_limit_trigger ON ALL SERVER
DROP LOGIN login_test5


