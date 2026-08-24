/*Chapter 5 — Sorting Data in SQL Server
1. What is Sorting?

Sorting means arranging the query result in a specific order.

For example, employees can be sorted by:

Age
Salary
Name
Hire Date
Employee ID*/



/*************************************************************************************************************************/

 /*Question 1 — Intermediate ??

Write a query to display the EmployeeName, Age, and DepartmentName of all employees, sorted first by DepartmentName in ascending order 
and then, within each department, by Age in descending order.*/

Select EmployeeName, Age, D.DepartmentName from Employees as E 
inner join Department As D on D.DepartmentID = E.DepartmentName
Order By D.DepartmentName ASC, Age Desc;
--?? Excellent! 10/10 — Correct.



/*Question 2 — Intermediate ? Advanced ????

Write a query to display the DepartmentName and the total number of employees in each department, sorted by 
the total number of employees from highest to lowest.*/

Select D.DepartmentName, Count(EmployeeName) as total_number_of_employees from Employees as E 
Inner join Department as D on D.DepartmentID = E.DepartmentName
group by D.DepartmentName 
order by total_number_of_employees Desc

--?? Perfect! 10/10 — Absolutely correct.

/*Question 3 — Advanced ??

Write a query to display the DepartmentName, AverageAge, and TotalEmployees for each department, sorted first by AverageAge
from highest to lowest and then by TotalEmployees from highest to lowest.*/


Select D.DepartmentName, AVG(E.AGE) as AverageAge, Count(*) as TotalEmployees from Employees as E
inner Join Department AS D on D.DepartmentID = E.DepartmentName
Group By D.DepartmentName
Order by AverageAge DESC, TotalEmployees Desc;
