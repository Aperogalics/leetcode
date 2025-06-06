--Problem Statement
--
--Table: Person
--
--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| id          | int     |
--| email       | varchar |
--+-------------+---------+
--id is the primary key (column with unique values) for this table.
--Each row of this table contains an email. The emails will not contain uppercase letters.
--
--
--Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
--
--For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
--
--For Pandas users, please note that you are supposed to modify Person in place.
--
--After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.
--
--The result format is in the following example.
--
--
--
--Example 1:
--
--Input:
--Person table:
--+----+------------------+
--| id | email            |
--+----+------------------+
--| 1  | john@example.com |
--| 2  | bob@example.com  |
--| 3  | john@example.com |
--+----+------------------+
--Output:
--+----+------------------+
--| id | email            |
--+----+------------------+
--| 1  | john@example.com |
--| 2  | bob@example.com  |
--+----+------------------+
--Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.

-- Schema
--Create table If Not Exists Person (Id int, Email varchar(255));
--Truncate table Person;
--insert into Person (id, email) values ('1', 'john@example.com');
--insert into Person (id, email) values ('2', 'bob@example.com');
--insert into Person (id, email) values ('3', 'john@example.com');

-- One Solution slow here because of non usage of index but should be used if more data and no key based operation is involved
delete p1 from Person p1
left join Person p2
on p1.email = p2.email
where p1.id > p2.id;

-- Optimised Solution
DELETE Person.* FROM Person
WHERE Id NOT IN (
    SELECT MIN(Id) FROM (SELECT Id, Email FROM Person) T1 GROUP BY Email
);