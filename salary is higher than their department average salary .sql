 /*✅ Question 3

👉 Write a SQL query to return employees whose salary is higher than their department average salary.

Return:
EmployeeName
Department
Salary
AvgDepartmentSalary
Write the query.*/

With CTE 
AS
(
 Select EmployeeName,Department, Salary
 From Employees
),
 AVG_SALARY
 as
(
 Select Department, AVg(cast(Salary as int)) as AvgDepartmentSalary 
 from mulazim 
 Group by Department
)
Select C.EmployeeName, C.Department, C.Salary, A.AvgDepartmentSalary
from CTE C 
Inner Join AVG_SALARY A On A.Department = C.Department
Where Salary > AvgDepartmentSalary
