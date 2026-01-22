/*✅ Question 15 (Tricky – Window + Conditional Logic):

Write a SQL query to find each employee and the difference between their salary and the average salary of their department.

Output:
EmployeeName
Department
Salary
DifferenceFromDeptAvg*/


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
