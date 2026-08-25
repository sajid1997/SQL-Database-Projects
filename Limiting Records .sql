/*Chapter 6 — Limiting Records in MSSQL

In SQL Server, we mainly limit records using:

TOP
TOP (n)
TOP (n) PERCENT
OFFSET ... FETCH*/

/*Question 1 — Intermediate 🟡

Write a query to display the 5 oldest employees from the Employees table.*/


Select top 5 EmployeeName, Age from Employees
Order by Age Desc 

--🔥 Perfect! 10/10 — Correct.


/*Question 2 — Intermediate 🟡

Write a query to display the 5 youngest employees from the Employees table.*/

Select top 5 EmployeeName, Age from Employees
Order by Age Asc; 

--🔥 Perfect again! 10/10 — Correct

Select top 3 EmployeeName, Len(EmployeeName) as LongestName from Employees 
Order by LongestName Desc 

--🔥 Excellent! 10/10 — Correct.


/*Question 4 — Intermediate → Advanced 🟡🔴
Write a query to display the 5 oldest employees who belong to the IT, HR, or Finance department.*/

Select top 5 E.Employeename, E.Age, D.DepartmentName from Employees as E
inner Join Department AS D On D.DepartmentID = E.DepartmentName
Where D.DepartmentName in ('IT', 'HR', 'Finance')
Order By E.Age Desc 

--🔥 Perfect! 10/10 — Your query is completely correct.


/*Question 5 — Advanced 🔴

You have 30 employees.
You need to create a report showing:
Employees 11–20, sorted by EmployeeID in ascending order.
The query should return exactly 10 employees.
Write the SQL query.*/

Select * from Employees 
Order By EmployeeID 
Offset 10 rows 
Fetch next 10 rows only 

--🔥 Exactly correct — 10/10!



/*Question 6 — Advanced 🔴

A company wants to display the top 10% of employees based on salary.

However, there may be employees with the same salary as the last employee selected, and all employees tied at that salary must also be included.

Write a query that returns:

EmployeeName
Salary

sorted from highest salary to lowest.*/

Select top 10 Percent with Ties 
EmployeeName, salary 
From Employees 
Order by salary Desc

--🔥 Perfect! 10/10 — Exactly the right SQL Server solution.
