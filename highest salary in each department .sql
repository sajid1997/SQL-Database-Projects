/*👉 Question:
Write a SQL query to find the employee(s) who have the highest salary in each department.

✔ Output should show:
EmployeeName
Department
Salary*/

wITH CTE 
AS
(
 Select EmployeeName, Department, Salary,
 DENSE_RANK() Over(partition by Department Order By Salary Desc) as Ranking
 from Employees
 )
 Select EmployeeName, Department, Salary from CTE
 Where Ranking = 1
