--Problem Statement
--
--Table: Logs
--
--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| id          | int     |
--| num         | varchar |
--+-------------+---------+
--In SQL, id is the primary key for this table.
--id is an autoincrement column starting from 1.
--
--
--Find all numbers that appear at least three times consecutively.
--
--Return the result table in any order.
--
--The result format is in the following example.
--
--
--
--Example 1:
--
--Input:
--Logs table:
--+----+-----+
--| id | num |
--+----+-----+
--| 1  | 1   |
--| 2  | 1   |
--| 3  | 1   |
--| 4  | 2   |
--| 5  | 1   |
--| 6  | 2   |
--| 7  | 2   |
--+----+-----+
--Output:
--+-----------------+
--| ConsecutiveNums |
--+-----------------+
--| 1               |
--+-----------------+
--Explanation: 1 is the only number that appears consecutively for at least three times.
--
--Schema
--
--Create table If Not Exists Logs (id int, num int);
--Truncate table Logs;
--insert into Logs (id, num) values ('1', '1');
--insert into Logs (id, num) values ('2', '1');
--insert into Logs (id, num) values ('3', '1');
--insert into Logs (id, num) values ('4', '2');
--insert into Logs (id, num) values ('5', '1');
--insert into Logs (id, num) values ('6', '2');
--insert into Logs (id, num) values ('7', '2');
--
--Solution
--
-- Non optimized Solution
SELECT DISTINCT i1.num AS ConsecutiveNums
FROM logs i1, logs i2, logs i3
WHERE
    i1.id = i2.id + 1
    AND i2.id = i3.id + 1
    AND i1.num = i2.num
    AND i2.num = i3.num;

-- Optimized Solution
WITH cte as (
SELECT num,
lead(num, 1) over() num1,
lead(num, 2) over() num2
from logs
)
SELECT DISTINCT num as ConsecutiveNums FROM cte where (num=num1) AND (num=num2);