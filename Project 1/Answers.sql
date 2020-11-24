-- Name : Sagie Baram
-- ID : 205591829
ALTER SESSION SET nls_date_format = 'dd/mm/yyyy';

-- TABLE CREATION --
CREATE TABLE Tables(
	tnum NUMBER(3),
	Floor NUMBER(1),
	Capacity NUMBER(2),
	Location VARCHAR2(20),
	CONSTRAINT table_number PRIMARY KEY(tnum)
);

CREATE TABLE Diners(
	name VARCHAR2(1),
	Phone NUMBER(2),
	City VARCHAR2(2),
	CONSTRAINT diner_name PRIMARY KEY(name),
	CONSTRAINT diner_phone PRIMARY KEY(Phone)
);

CREATE TABLE Waiters(
	Wid NUMBER(3),
	Wname VARCHAR2(3),
	City VARCHAR2(2),
	CONSTRAINT waiter_id PRIMARY KEY(Wid)
);

CREATE TABLE Visits(
	dinerName VARCHAR2(1) NOT NULL,
    dinerPhone NUMBER(2) NOT NULL,
    visitDate DATE,
    tnum NUMBER(1)  NOT NULL,
    wid NUMBER(3) NOT NULL,
    numOfDiners NUMBER(1),
    CONSTRAINT waiter_id_fk FOREIGN KEY (wid) REFERENCES Waiters(Wid),
    CONSTRAINT table_number_fk FOREIGN KEY (tnum) REFERENCES Tables(tnum),
    CONSTRAINT visit_fk FOREIGN KEY(dinerName,dinerPhone) REFERENCES Diners(name,Phone),
    CONSTRAINT visit_pk PRIMARY KEY(dinerName,dinerPhone,visitDate)
);

-- VALUE INSERTION --
INSERT INTO Tables VALUES(6,2,6,'Near stairs');
INSERT INTO Tables VALUES(1,1,4,'Near entrance');
INSERT INTO Tables VALUES(2,1,4,'Far corner on the right');
INSERT INTO Tables VALUES(7,2,4, 'Far corner');
INSERT INTO Tables VALUES(8,2,8, 'Far corner');
INSERT INTO Tables VALUES(3,1,2, 'Near window');
INSERT INTO Tables VALUES(4,1,2, 'Far corner on the left');
INSERT INTO Tables VALUES(5,1,2, 'Near window');
INSERT INTO Tables VALUES(9,2,8, 'Near stairs');

INSERT INTO Diners VALUES('A',11,'AA');
INSERT INTO Diners VALUES('B',33,'CC');
INSERT INTO Diners VALUES('C',66,'CC');
INSERT INTO Diners VALUES('C',55,'DD');
INSERT INTO Diners VALUES('D',44,'CC');
INSERT INTO Diners VALUES('A',22,'BB');
INSERT INTO Diners VALUES('B',22,'BB');
INSERT INTO Diners VALUES('D',33,'CC');
INSERT INTO Diners VALUES('E',11,'AA');
INSERT INTO Diners VALUES('F',77,'DD');
INSERT INTO Diners VALUES('F',22,'BB');

INSERT INTO Waiters VALUES(111,'AAA','BB');
INSERT INTO Waiters VALUES(222,'BBB','BB');
INSERT INTO Waiters VALUES(333,'CCC', 'AA');
INSERT INTO Waiters VALUES(444, 'DDD','DD');

INSERT INTO Visits VALUES('A',11,'6/9/2019',5,222,2);
INSERT INTO Visits VALUES('A',22,'5/8/2019',7,111,3);
INSERT INTO Visits VALUES('C',66,'6/9/2019',9,333,5);
INSERT INTO Visits VALUES('F',77,'7/9/2019',9,444,8);
INSERT INTO Visits VALUES('D',44,'6/10/2019',3,111,1);
INSERT INTO Visits VALUES('D',44,'5/11/2019',3,111,1);
INSERT INTO Visits VALUES('B',22,'6/9/2019',7,111,4);
INSERT INTO Visits VALUES('B',33,'7/11/2019',6,444,6);
INSERT INTO Visits VALUES('C',66,'7/12/2019',2,444,3);

--1-- Select the names and phone numbers of diners who oredered a table on
--september.
SELECT dinerName,dinerPhone FROM Visits WHERE
visitDate >= '01/09/2019' AND visitDate <= '30/09/2019';
--2-- Select the ID's of waiters who served on the 2nd floor.
SELECT DISTINCT wid FROM Visits v, Tables t
WHERE v.tnum = t.tnum AND t.Floor = 2;
--3-- Select the names and phone numbers of diners who ordered a table in
--a reusturant that the number of diners on that table equals to the capacity
--of the table.
SELECT v.dinerName,v.dinerPhone FROM Visits v, Tables t
WHERE v.tnum = t.tnum AND v.numOfDiners = t.Capacity;
--4-- Select the names of all waiters who live in the same city and worked on
--the same day.
SELECT w1.Wname FROM Waiters w1, Waiters w2
WHERE w1.City = w2.City AND w1.wid != w2.wid
INTERSECT
SELECT w.Wname FROM Waiters w, Visits v1, Visits v2
WHERE v1.wid = w.wid AND  v1.wid != v2.wid AND v1.visitDate = v2.visitDate;
--5-- Select table numbers located Near Stairs and number of diners is even.
SELECT tnum FROM Tables WHERE Location = 'Near stairs'
INTERSECT
SELECT tnum FROM Visits v WHERE MOD(v.numofdiners,2) = 0;


-- SELECT TABLES --
SELECT * FROM Tables;
SELECT * FROM Visits;
SELECT * FROM Waiters;
SELECT * FROM Diners;

-- DROP TABLES --
DROP TABLE Tables;
DROP TABLE Diners;
DROP TABLE Waiters;
DROP TABLE Visits;
