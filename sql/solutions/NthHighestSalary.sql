--Problem Statement
--
--Table: Employee
--
--+-------------+------+
--| Column Name | Type |
--+-------------+------+
--| id          | int  |
--| salary      | int  |
--+-------------+------+
--id is the primary key (column with unique values) for this table.
--Each row of this table contains information about the salary of an employee.
--
--
--Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.
--
--The result format is in the following example.
--
--
--
--Example 1:
--
--Input:
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--| 2  | 200    |
--| 3  | 300    |
--+----+--------+
--n = 2
--Output:
--+------------------------+
--| getNthHighestSalary(2) |
--+------------------------+
--| 200                    |
--+------------------------+
--Example 2:
--
--Input:
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--+----+--------+
--n = 2
--Output:
--+------------------------+
--| getNthHighestSalary(2) |
--+------------------------+
--| null                   |
--+------------------------+
--
--Schema
--
--Create table If Not Exists Employee (Id int, Salary int);
--Truncate table Employee;
--insert into Employee (id, salary) values ('1', '100');
--insert into Employee (id, salary) values ('2', '200');
--insert into Employee (id, salary) values ('3', '300');
--
--Solution
--
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N-1;
  RETURN (
      # Write your MySQL query statement below.
            select distinct salary from Employee order by salary desc limit N , 1
  );
END