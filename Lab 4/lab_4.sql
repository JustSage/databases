-- 1 --
SELECT AVG(Speed) Average_Speed FROM PC
-- 2 --
SELECT AVG(Speed) Average_Speed FROM Laptop l WHERE l.price > 2500
-- 3 --
SELECT AVG(Price) FROM SELECT FROM PC pc,Product p WHERE Maker = 'A' AND p.model = pc.Model;
-- 4 --
SELECT AVG(Price) FROM (
	SELECT Price FROM PC pc, Product p WHERE Maker ='D' AND pc.model = p.model
	UNION ALL
	SELECT Price FROM Laptop l, Product p WHERE Maker ='D' and l.model = lp.model;
-- 5 --
SELECT Speed, AVG(Price) FROM PC GROUP BY Speed;
-- 6 --
SELECT AVG(Screen) FROM Laptop l, Product p WHERE l.model = lp.model;
-- 7 --

SELECT Maker FROM Product WHERE Type='PC' GROUP BY Maker HAVING COUNT(Model) >= 3;
-- 8 --
SELECT MAX(Price) FROM Product WHERE Type='PC' GROUP BY Maker;
-- 9 --
SELECT AVG(Price) FROM Pc WHERE Speed > 150 GROUP BY Speed;
-- 10 --
SELECT Maker,AVG(Hd) FROM Pc,Product WHERE Maker IN(
	SELECT Maker FROM Product WHERE Type = 'Printer' GROUP BY Maker, Type HAVING COUNT(Type) >= 1)
GROUP By Maker;
