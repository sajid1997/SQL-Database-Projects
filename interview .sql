/*✅ Question 11 (Interview Level):

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


/*✅ Question 12 (Tricky Logic):

Write a SQL query to find departments where the average salary is greater than 70,000 AND the total number of 
employees is more than 5.

Output:
Department
AvgSalary
TotalEmployees*/

Select Department, AVG(Salary) AS AvgSalary , Count(*) as TotalEmployees
from Mulazim
GRoup by Department
HAving AVG(Salary) > 70000 and Count(*) > 5


/*✅ Question 15 (Tricky – Window + Conditional Logic):

Write a SQL query to find each employee and the difference between their salary and the average salary of their department.

Output:
EmployeeName
Department
Salary
DifferenceFromDeptAvg*/

With AVGSALARY 
AS
( 
 Select 
 Department,
 Avg(Salary) as AvgSalary
 from Mulazim
 group by Department
)
 Select
 M.EmployeeName,
 M.Department,
 M.Salary,
 C.AvgSalary - M.Salary as DifferenceFromDeptAvg
 From mulazim m
 Inner join 
 AVGSALARY C ON 
 M.Department= C.Department

 WITH AvgSalary AS
(
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Mulazim
    GROUP BY Department
)
SELECT 
    M.EmployeeName,
    M.Department,
    M.Salary,
    M.Salary - C.AvgSalary AS DifferenceFromDeptAvg
FROM Mulazim M
INNER JOIN AvgSalary C 
    ON M.Department = C.Department
ORDER BY M.Department, M.Salary DESC;
