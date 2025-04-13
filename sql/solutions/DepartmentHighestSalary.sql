--Problem Statement
--
--Table: Employee
--
--+--------------+---------+
--| Column Name  | Type    |
--+--------------+---------+
--| id           | int     |
--| name         | varchar |
--| salary       | int     |
--| departmentId | int     |
--+--------------+---------+
--id is the primary key (column with unique values) for this table.
--departmentId is a foreign key (reference columns) of the ID from the Department table.
--Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
--
--
--Table: Department
--
--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| id          | int     |
--| name        | varchar |
--+-------------+---------+
--id is the primary key (column with unique values) for this table. It is guaranteed that department name is not NULL.
--Each row of this table indicates the ID of a department and its name.
--
--
--Write a solution to find employees who have the highest salary in each of the departments.
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
--Employee table:
--+----+-------+--------+--------------+
--| id | name  | salary | departmentId |
--+----+-------+--------+--------------+
--| 1  | Joe   | 70000  | 1            |
--| 2  | Jim   | 90000  | 1            |
--| 3  | Henry | 80000  | 2            |
--| 4  | Sam   | 60000  | 2            |
--| 5  | Max   | 90000  | 1            |
--+----+-------+--------+--------------+
--Department table:
--+----+-------+
--| id | name  |
--+----+-------+
--| 1  | IT    |
--| 2  | Sales |
--+----+-------+
--Output:
--+------------+----------+--------+
--| Department | Employee | Salary |
--+------------+----------+--------+
--| IT         | Jim      | 90000  |
--| Sales      | Henry    | 80000  |
--| IT         | Max      | 90000  |
--+------------+----------+--------+
--Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
--
--Schema
--
--Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
--Create table If Not Exists Department (id int, name varchar(255));
--Truncate table Employee;
--insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1');
--insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1');
--insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2');
--insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2');
--insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1');
--Truncate table Department;
--insert into Department (id, name) values ('1', 'IT');
--insert into Department (id, name) values ('2', 'Sales');
--
--Solution
--
SELECT Department.name AS Department ,Employee.name AS Employee, Employee.salary
FROM Department  JOIN Employee  ON Employee.departmentId=Department.id
WHERE(departmentId, salary) IN
(SELECT departmentId,MAX(salary) FROM Employee GROUP BY departmentId) ;

-- Optimized Solution

SELECT Department, Employee, Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) ranked
WHERE rnk = 1;
