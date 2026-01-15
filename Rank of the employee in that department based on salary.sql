/*Question 1 — Advanced SQL

For each department in Employees, display:
Department
EmployeeName
Salary
Rank of the employee in that department based on salary (highest first)
Top Earner status: if rank = 1 → ‘Top Earner’, else → ‘Not Top Earner’*/


With Ranking_CTE
AS
(
 Select Department, EmployeeName, Salary,
 DENSE_RANK() Over(Partition by Department Order by Salary desc) as Ranking 
 from Employees
)
Select Department, EmployeeName, Salary, 
CASE 
When Ranking = 1 Then 'Top Earner'
Else 'Not Top Earner'
END as Ranking_Detaills
from Ranking_CTE
