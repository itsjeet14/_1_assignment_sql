
SELECT * FROM assignment1.customers;

--  Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT * FROM assignment1.salespeople;
USE assignment1;
SELECT COUNT(*) AS NumOfSalesPeopleStartingWithA
FROM SalesPeople
WHERE Sname LIKE 'a%';



--  Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT S.Snum, S.Sname, S.City, S.Comm, FORMAT(O.TotalOrderWorth, 2) AS TotalOrderWorth
FROM SalesPeople S
INNER JOIN (
    SELECT Snum, SUM(Amt) AS TotalOrderWorth
    FROM Orders
    GROUP BY Snum
    HAVING SUM(Amt) > 2000
) O
ON S.Snum = O.Snum;




-- Count the number of Salesperson belonging to Newyork.
SELECT COUNT(DISTINCT S.Snum) AS NumOfSalesPeopleInNewYork
FROM SalesPeople S
INNER JOIN Customers C
ON S.Snum = C.Snum
WHERE UPPER(S.City) = 'NEWYORK';


--  Display the number of Salespeople belonging to London and belonging to Paris.
SELECT C.City, COUNT(DISTINCT SP.Snum) AS "Count"
FROM SalesPeople SP
JOIN Customers C ON SP.Snum = C.Snum
WHERE C.City IN ('London', 'Paris')
GROUP BY C.City;



-- Display the number of orders taken by each Salesperson and their date of orders.
SELECT S.Sname, O.Odate, COUNT(*) AS NumOfOrders
FROM SalesPeople S
INNER JOIN Orders O
ON S.Snum = O.Snum
GROUP BY S.Sname, O.Odate;



