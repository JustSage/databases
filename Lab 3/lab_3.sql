--1.	ORD (ORDID, ORDERDATE, COMMPLAN, CUSTID, SHIPDATE, TOTAL)
--2.	PRODUCT(PRODID, NAME)
--3.	ITEM (ORDID, ITEMID, PRODID,  ACTUALPRICE, QTY, ITEMTOT  ) 
--4.	CUSTOMER(ZIP, STATE, REPID, PHONE, NAME, CUSTID, REDITLIMIT,
-- CITY, AREA, ADDRESS, COMMENTS)

--3.????? ???? ????? (?????? 100890) � ?????? ?? ?????  ?????? ?-100$
--?????? ????? ???? ?????? 101 ?????? ?????? ?????? ??? ??? ???? ?????? ????.

UPDATE ORD SET TOTAL = (TOTAL + 100);
UPDATE ITEM SET ACTUALPRICE = 100 WHERE ITEMID = 100890;
SELECT ORDERDATE FROM ORD WHERE ORDERDATE = 07/01/1987;
SELECT CUSTID FROM CUSTOMER WHERE CUSTID = 101;


SELECT ORDID, ORDERDDATE FROM ORD 
WHERE CUSTID IN(SELECT CUSTID FROM CUSTOMER WHERE NAME = 'DAN');

SELECT NAME FROM CUSTOMER WHERE CUSTID IN ( 
SELECT CUSTID FROM ORD WHERE ORDID IN (
SELECT ORDID FROM ITEM WHERE PRODID = (
SELECT PRODID FROM PRODUCT WHERE NAME = 'ACE TENNIS NET')));


SELECT Maker FROM Product p, PC pc WHERE pc.Speed >= 1200 AND p.Model = pc.Model;
--??????? ?????--
--1--
--?? ????? ?? ?? ?directors ??? ?? actors
--MovieDirector(title,director,year)
-- MoveCast(title,actor,salary)
-- MovieReview(title,reviwer,score)

SELECT Director FROM MovieDirector,MoveCast WHERE Director = Actor; 
--2--
--?? ????? ?? ??????? ?? ?????? ??????? ?? ????? ??????
-- Sailors(sid,sname,rating,age)
-- Boats(bid,bdname,color)
-- Reserves(sid,bid,day)
SELECT age FROM Sailors
WHERE sid IN (SELECT sid FROM Reverves 
WHERE bid IN (SELECT bid FROM Boats 
WHERE color = 'red'));