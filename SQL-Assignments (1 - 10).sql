use b119;
select * from emp;

-- Assignment 1

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select substring_index(ename," ",1) as WORKER_NAME from emp;

-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct job, deptno from emp;

-- Q-3. Write an SQL query to show the last 5 record from a table.
select * from emp 
order by empno desc
limit 5;

-- --------------------------------------------------------------------------------------------------------

-- Assignment 2

-- Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table. 
select substr(ename,1,3) from emp;

-- Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
SELECT ename, INSTR(ename, 'a') from emp;

-- Q-3. Write an SQL query to print the name of employees having the highest salary in each department.
select ename, sal, deptno from emp where sal in (select max(sal) from emp group by deptno);

-- --------------------------------------------------------------------------------------------------------

-- Assignment 3

-- Q-1. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select ltrim(ename) from emp;

-- Q-2. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct job, length(job) from emp;

-- Q-3. Write an SQL query to fetch nth max salaries from a table.
select max(sal) from emp;

-- --------------------------------------------------------------------------------------------------------

-- Assignment 4

-- Q-1. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(ename, "a", "A") from emp;

-- Q-2. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from emp order by ename asc, deptno desc;

-- Q-3. Write an SQL query to fetch the names of workers who earn the highest salary.
select ename, job, sal from emp
where sal = (select max(sal) from emp);

-- --------------------------------------------------------------------------------------------------------

-- Assignment 5

-- Q-1. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from emp
where ename not in ("Vipul", "Satish");

-- Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from emp
where ename like "%h" and length(ename) = 6;

-- Q-3. Write a query to validate Email of Employee.
select * from emp
where email like "_@_%._%";

-- --------------------------------------------------------------------------------------------------------

-- Assignment 6

-- Q-1. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from emp 
where year(hiredate) = 2014 and month(hiredate) = 2;

-- Q-2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select deptno, count(*) from emp
group by deptno
having count(*)>1;

-- Q-3. How to remove duplicate rows from Employees table.

-- --------------------------------------------------------------------------------------------------------

-- Assignment 7

-- Q-13. Write an SQL query to show only odd rows from a table.
with rowNumCTE as 
(
	select *, row_number() over(order by empno) as row_num from emp
) select * from rowNumCTE
where row_num % 2 = 1;

-- Q-14. Write an SQL query to clone a new table from another table.
create table emp_clone like emp;

select * 
into emp_clone
from emp;

select * from emp_clone;

-- --------------------------------------------------------------------------------------------------------

-- Assignment 8

-- Q-15. Write an SQL query to fetch intersecting records of two tables.
select deptno from emp intersect select deptno from dept;

-- Q-16. Write an SQL query to show records from one table that another table does not have.
select * from t1
except
select * from t2;

-- --------------------------------------------------------------------------------------------------------

-- Assignment 9

-- Q-17.  Write an SQL query to show the top n (say 10) records of a table.
select * from emp
limit 10;

-- Q-18. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from emp
order by sal desc
limit 5;

-- --------------------------------------------------------------------------------------------------------

-- Assignment 10

-- Q-19. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select ename,sal from emp where sal = (select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp where sal<(select max(sal) from emp)))));

-- Q-20. Write an SQL query to fetch the list of employees with the same salary.
select * from emp
where sal in 
(select sal from emp 
group by sal
having count(*) > 1)