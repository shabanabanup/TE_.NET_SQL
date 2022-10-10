Use org;
create table Salesman(
Salesman_ID INT NOT NULL PRIMARY KEY,
Name CHAR (60),
City CHAR (50),
Commission FLOAT (15)
);

INSERT INTO Salesman
(Salesman_ID, Name, City, Commission) VALUES
	(5001, 'James Hoog', 'New York', 0.15),
	(5002, 'Nail Knite', 'Paris', 0.13),
	(5005, 'Pit Alex', 'London', 0.11),
	(5006, 'Mc Lyon', 'Paris', 0.14),
	(5007, 'Paul Adam', 'Rome', 0.13),
	(5003, 'Lauson Hen', 'San Jose', 0.12)

select * from Salesman

CREATE VIEW newyork
AS select * from Salesman
WHERE City = 'New York';

Select * from newyork

CREATE VIEW salesperall
AS SELECT Salesman_ID, Name, City FROM Salesman;

Select * from salesperall

CREATE VIEW allcitynum
AS SELECT City, COUNT (DISTINCT Salesman_ID)
FROM Salesman GROUP BY City;

----
create table customer(
Customer_id INT NOT NULL PRIMARY KEY,
cust_name varchar(50),
city varchar(30),
grade int,
salesman_id int
);

insert into customer
(Customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', ' New York', 100, 5001),
(3007, 'Brad Davis' ,'New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007)

Select * from customer

create view gradecount 
as select grade, count(*)
from customer group by grade;

---
create table orders(
order_no int,
purch_amt float(50),
ord_date Date,
customer_id int,
salesman_id int
);

insert into orders
(order_no, purch_amt, ord_date,customer_id,salesman_id) values
(70001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001)

Select * from orders

CREATE VIEW nameorders
AS SELECT order_no, purch_amt, a.salesman_id, name, cust_name
FROM orders a, customer b, salesman c
WHERE a.Customer_id = b.Customer_id
AND a.salesman_id = c.salesman_id;

Select * from nameorders