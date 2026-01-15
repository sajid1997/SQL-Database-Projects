/*Advanced SQL

For each department in Mulazim, display:
Department
employeeName
Salary
The average salary of that department
Mark each employee as:
'Above Average' if their salary > department average
'Average' if their salary = department average
'Below Average' if their salary < department average*/

WITH CTE 
AS
(
 Select Department, EmployeeName, Salary
 from mulazim
),

Avg_Salary
as
(
 Select Department, AVG(Salary) as AVGSALARY
 from Mulazim
 Group by Department
)
Select C.Department, C.EmployeeName, C.Salary, A.AVGSALARY,
Case
When C.Salary > A.AVGSALARY Then 'Above Average'
When C.Salary =  A.AVGSALARY Then 'Average'
Else 'Below Average'
END AS RANKING
From CTE C
inner join Avg_Salary A on A.Department = C.Department
Order by Department, EmployeeName 

