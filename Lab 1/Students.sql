ALTER SESSION SET nls_date_format = 'dd/mm/yyyy';

CREATE TABLE Students(
Id NUMBER(6),
LastName VARCHAR2(20),
FirstName VARCHAR2(10),
Address VARCHAR2(10),
BirthDay DATE,
GroupId NUMBER(3)
);
INSERT INTO Students VALUES(101,'Solin','Dan','BeerSheva','01/02/1985',11);
ALTER TABLE Students ADD AvgMark NUMBER(5,2) DEFAULT 0;

INSERT INTO Students VALUES(102,'Tal','Ruti','Tel-Aviv','10/07/1988',12, 70);
INSERT INTO Students VALUES(103,'Kohen','Yosi','Dimona','01/08/1987',11, 80);
INSERT INTO Students VALUES(104,'Toys','Vered','Tel-Aviv','15/09/1988',12, 90);

ALTER TABLE Students MODIFY Address VARCHAR2(15);

CREATE TABLE Students2 AS SELECT * FROM Students;
CREATE TABLE Students3 AS SELECT Id,Address,Birthday FROM Students;
SELECT * FROM Students;
SELECT * FROM Students2;
SELECT * FROM Students3;

DELETE FROM Students WHERE Birthday = '10/07/1988';
UPDATE Students2 SET GroupId = 10 WHERE GroupId = 11;

RENAME Students2 TO Students_new;
SELECT * FROM Students_new;
DROP TABLE Students_new;
