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
