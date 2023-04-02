CREATE TABLE assignment1.SalesPeople (
  Snum INT PRIMARY KEY,
  Sname VARCHAR(50) UNIQUE,
  City VARCHAR(50),
  Comm FLOAT
);
INSERT INTO assignment1.salespeople (Snum, Sname, City, Comm)
VALUES (1001, 'Peel', 'London', 0.12),
       (1002, 'Serres', 'Sanjose', 0.13),
       (1004, 'Motika', 'London', 0.11),
       (1007, 'Rifkin', 'Barcelona', 0.15),
       (1003, 'Axelrod', 'Newyork', 0.10);

SELECT * FROM assignment1.salespeople;

CREATE TABLE assignment1.Customers (
  Cnum INT PRIMARY KEY,
  Cname VARCHAR(50),
  City VARCHAR(50) NOT NULL,
  Snum INT,
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
INSERT INTO assignment1.Customers (Cnum, Cname, City, Snum)
VALUES (2001, 'Hoffman', 'London', 1001),
       (2002, 'Giovanni', 'Rome', 1003),
       (2003, 'Liu', 'Sanjose', 1002),
       (2004, 'Grass', 'Berlin', 1002),
       (2006, 'Clemens', 'London', 1001),
       (2008, 'Cisneros', 'Sanjose', 1007),
       (2007, 'Pereira', 'Rome', 1004);

SELECT * FROM assignment1.Customers;

CREATE TABLE assignment1.Orders (
  Onum INT PRIMARY KEY,
  Amt FLOAT,
  Odate DATE,
  Cnum INT,
  Snum INT,
  FOREIGN KEY (Cnum) REFERENCES Customers(Cnum),
  FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum)
);
INSERT INTO assignment1.Orders (Onum, Amt, Odate, Cnum, Snum)
VALUES (3001, 18.69, '1990-10-03', 2008, 1007),
       (3003, 767.19, '1990-10-03', 2001, 1001),
       (3002, 1900.10, '1990-10-03', 2007, 1004),
       (3005, 5160.45, '1990-10-03', 2003, 1002),
       (3006, 1098.16, '1990-10-03', 2008, 1007),
       (3009, 1713.23, '1990-10-04', 2002, 1003),
       (3007, 75.75, '1990-10-04', 2004, 1002),
       (3008, 4273.00, '1990-10-05', 2006, 1001),
       (3010, 1309.95, '1990-10-06', 2004, 1002),
       (3011, 9891.88, '1990-10-06', 2006, 1001);

SELECT * FROM assignment1.Orders;

