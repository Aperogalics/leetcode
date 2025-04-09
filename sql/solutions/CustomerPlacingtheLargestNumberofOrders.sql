--Problem Statement
--
--Table: Orders
--
--+-----------------+----------+
--| Column Name     | Type     |
--+-----------------+----------+
--| order_number    | int      |
--| customer_number | int      |
--+-----------------+----------+
--order_number is the primary key (column with unique values) for this table.
--This table contains information about the order ID and the customer ID.
--
--
--Write a solution to find the customer_number for the customer who has placed the largest number of orders.
--
--The test cases are generated so that exactly one customer will have placed more orders than any other customer.
--
--The result format is in the following example.
--
--
--
--Example 1:
--
--Input:
--Orders table:
--+--------------+-----------------+
--| order_number | customer_number |
--+--------------+-----------------+
--| 1            | 1               |
--| 2            | 2               |
--| 3            | 3               |
--| 4            | 3               |
--+--------------+-----------------+
--Output:
--+-----------------+
--| customer_number |
--+-----------------+
--| 3               |
--+-----------------+
--Explanation:
--The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order.
--So the result is customer_number 3.
--
--
--Follow up: What if more than one customer has the largest number of orders, can you find all the customer_number in this case?
--
--SCHEMA
--Create table If Not Exists orders (order_number int, customer_number int);
--Truncate table orders;
--insert into orders (order_number, customer_number) values ('1', '1');
--insert into orders (order_number, customer_number) values ('2', '2');
--insert into orders (order_number, customer_number) values ('3', '3');
--insert into orders (order_number, customer_number) values ('4', '3');

--Solution

-- First solution: ORDER BY + TOP 1
select top 1 customer_number from Orders group by customer_number order by count(order_number) desc;
Select customer_number from Orders group by customer_number order by count(customer_number) desc limit 1;

-- Second solution: >= ALL
select customer_number from Orders group by customer_number having count(order_number) >= all(select count(order_number) from Orders group by customer_number);

-- Third solution: = MAX
select customer_number from Orders group by customer_number having count(order_number) = (select max(order_num) from (select count(order_number) as order_num from Orders group by customer_number) as Order_nums);

-- Fourth solution: WITH
with Order_nums as (select customer_number, count(*) as order_num from Orders group by customer_number)
select customer_number from Order_nums where order_num = (select max(order_num) from Order_nums);