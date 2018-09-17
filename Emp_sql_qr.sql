SELECT * FROM EMPLOYEES ;

SELECT * FROM DEPARTMENTS;

--List employees (names) who have a bigger salary than their boss
SELECT e.name AS Ename, e2.name AS Boss, 
e.salary AS Esalary, e2.salary AS Bsalary
FROM employees e
JOIN employees e2 ON e.boss_id = e2.employee_id
WHERE e.salary  > e2.salary 

--List employees who have the biggest salary IN their departments
WITH TEM AS (
SELECT A.employee_id, A.department_id, a.salary, a.name as emp FROM
EMPLOYEES A LEFT JOIN DEPARTMENTS B
ON A.department_id = B.department_id )
SELECT  department_id, max(salary) 
FROM Tem 
GROUP BY  department_id
ORDER BY 2 ;

--List ALL departments along WITH the NUMBER OF people there 
WITH tem AS (SELECT A.employee_id, A.department_id,B.name as Dname, a.salary, a.name as emp FROM
EMPLOYEES A LEFT JOIN DEPARTMENTS B
ON A.department_id = B.department_id)
SELECT Dname, count(*) FROM TEM GROUP BY Dname

--List employees that don't have a boss in the same department
SELECT A.* , B.Salary , b.department_id
FROM EMPLOYEES A LEFT  JOIN EMPLOYEES B
ON A.BOSS_ID = B.EMPLOYEE_ID
WHERE a.department_id != b.department_id
ORDER BY 1

--List all departments along with the total salary there
WITH TEM AS (
SELECT  A.department_id,B.name as Dname, CAST(A.salary AS INT)FROM
EMPLOYEES A LEFT JOIN DEPARTMENTS B
ON A.department_id = B.department_id )
SELECT Dname, SUM(salary) 
FROM TEM
GROUP BY Dname 
ORDER BY 1





