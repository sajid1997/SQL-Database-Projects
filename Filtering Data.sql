--Chapter 4 — Filtering Data


/*Question 1️⃣ — Basic
Write a query to display all employees whose age is greater than 25.*/


Select * from Department


Select * from Employees 
Where AGE > 25
--🔥 Correct! 10/10


/*Question 2 — Intermediate 🔥

Write a query to display the EmployeeName, Age, and DepartmentName of employees who:

are between 25 and 35 years old, and
belong to IT, HR, or Finance departments.*/

Select E.EmployeeName, E.Age, D.DepartmentName from Employees as E
inner join Department AS D On D.DepartmentID = E.DepartmentName
Where AGe Between 25 and 35
and 
D.DepartmentName in ('IT', 'HR', 'Finance')

--🔥 Excellent! 10/10 — Correct. Your query is exactly right:

/*Question 3 — Advanced 🔴
  
Write a query to display the EmployeeName, Age, and DepartmentName of employees
who are NOT from the IT or HR departments and whose age is NOT between 25 and 30.*/

select E.EmployeeName, E.Age, D.DepartmentName from Employees as E
inner join Department as D on D.DepartmentID = E.DepartmentName
where D.DepartmentName not in ('It', 'HR') and 
Age Not between 23 and 30;

--100% correct. ✅


/*Question 4 — Advanced 🔴

Write a query to display the EmployeeName, Age, and DepartmentName of employees whose name starts with the letter
A OR ends with the letter n, and whose age is greater than 25.*/


 Select EmployeeName, Age, D.DepartmentName From Employees as E
 inner join Department AS D On D.DepartmentID = E.DepartmentName 
 where (E.EmployeeName like 'A%' OR E.EmployeeName like '%N') AND Age > 25;
 --10/10 🔥

 /*Question 5 — Advanced 🔴

Write a query to display the EmployeeName, Age, and DepartmentName of employees whose name contains the
letter a anywhere in the name, but does not start with A.*/

select EmployeeName, Age, DepartmentName from employees 
Where EmployeeName Like '%A%' AND EmployeeName not like 'A%'
