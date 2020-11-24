--1--
SELECT Model,Speed,Hd FROM Laptop WHERE Price > 1600 AND Hd=10 OR Hd=20;
--2--
SELECT Model,Speed "Speed.Mhz",Hd "Hd.GB" FROM Laptop WHERE Price > 1600;
--3--
SELECT DISTINCT Maker FROM Product WHERE Type = 'LAPTOP';
--4--
SELECT Model,Ram,Screen FROM Laptop WHERE Price > 2000 AND Screen >= 14 OR Ram >= 64;
--5--
SELECT DISTINCT Model,Speed From Laptop WHERE Laptop.hd >= 10;
SELECT DISTINCT Maker From Product;
--6--
SELECT p.Model FROM Pc p, Pc k WHERE k.model=1001 AND p.speed>k.speed;
--7--
SELECT p.Model, pc.Price FROM Product p, Pc pc WHERE Maker = 'A' AND p.Model = pc.Model
UNION
SELECT p.Model, lap.Price FROM Product p, Laptop lap WHERE Maker = 'A' AND p.Model = lap.Model;
--8--
SELECT p.Maker FROM Product p, Pc pc WHERE pc.Price > 2000 AND pc.Speed > 100
INTERSECT
SELECT p.Maker FROM Product p,Laptop lap WHERE lap.Price > 2000 AND lap.Speed > 100;







