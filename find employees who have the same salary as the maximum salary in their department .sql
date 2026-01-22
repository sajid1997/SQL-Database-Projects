Write a SQL query to find employees who have the same salary as the maximum salary in their department.

Output:
EmployeeName
Department
Salary*/

Select EmployeeName, Department, Salary 
from Mulazim m1
where Salary =
(Select MAx(Salary) as MAxSalary
from mulazim m2
Where M2.Department = M1.Department)
