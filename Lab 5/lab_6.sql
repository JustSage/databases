SELECT Maker FROM Product p WHERE Model EXISTS(
	SELECT Model FROM Pc pc WHERE p.Model = pc.Model AND pc.Speed >= 1200);

SELECT Model FROM Printer p1 WHERE Price > ALL(SELECT Price FROM Printer p2 WHERE p1.Model != p2.Model);

SELECT Model FROM Laptop l WHERE l.price < ALL(SELECT Price FROM Pc);

SELECT Maker FROM Product p WHERE Type = 'LAPTOP' AND NOT EXISTS(
	SELECT * FROM Product WHERE p.Maker = Maker AND Model IN(SELECT Model FROM Laptop WHERE Price>2500));

SELECT * FROM Laptop l WHERE Speed < ANY(SELECT Speed FROM Pc);

SELECT Model FROM (
	SELECT Model,Price FROM LATOP
	UNION ALL
	SELECT Model,Price FROM Pc) lap_pc WHERE  Price > ALL(
	SELECT Price FROM(
		SELECT Model,Price FROM Laptop
		UNION ALL
		SELECT Model, Price FROM Pc) lp
	WHERE lap_pc.Model != lp.Model);


