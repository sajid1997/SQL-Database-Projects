/*Q1??
Write a query to retrieve all columns from the Mulazim table*/


Select * from mulazim


/*Q2??

Select only EmployeeName and Department from Mulazim.*/

Select Employeename, Department From mulazim


/*Q3??

Retrieve EmployeeName, Salary, and HireDate for all employees.*/

Select EmployeeName, Salary, HireDate from Mulazim



/*Q4 Select distinct Department values from Mulazim.*/
 Select Distinct Department from mulazim

 /*Q5 Retrieve the top 5 employees based on Salary.*/


 select top 5 Employeename, Salary from mulazim
 order by Salary Desc 

 /*
  6: Select EmployeeName and Email of all employees from Mulazim table.*/

 select EmployeeName, Email from mulazim 

 /*Q7??

Retrieve EmployeeID and PhoneNumber for employees in the ‘HR’ department.*/

Select EmployeeID, PhoneNumber from mulazim 
where Department = 'HR'


/*Q8??

Select all employees who have Status as 'Active'.*/

select * from mulazim 
where Status ='Active'


/*Q9??

Retrieve the EmployeeName and Age of employees older than 30*/

select EmployeeName, Age from mulazim 
where Age >30



/*Q10??

Select EmployeeName and Salary for employees whose salary is greater than 50,000.*/
select Employeename, Salary from mulazim 
where Salary > 50000;


/*Q11??

Retrieve employees’ names whose HireDate is after 2023-01-01.*/

select EmployeeName from mulazim 
where HireDate > '2023-01-01'



/*Q12??

Select EmployeeName and Address for employees living in Islamabad.*/

select EmployeeName , [Address] from mulazim
where [Address] like '%Islamabad%'


/*Q13??

Retrieve employees with Designation as 'Manager'.*/

select * from mulazim 
where Designation = 'Manager'


/*Q14??

Select all employees ordered by EmployeeName alphabetically.*/
select * from mulazim 
order by EmployeeName


/*Q15??

Retrieve EmployeeName and Department for employees in IT and HR.*/


select Employeename, Department from mulazim
where Department in ('IT', 'HR')



/*Q16??

Select EmployeeName, Department, and Salary for employees earning between 30,000 and 60,000.*/

select Employeename, Department,Salary from mulazim
where salary Between 30000 and 60000



/*Q17??

Retrieve all columns for employees whose PhoneNumber starts with ‘0300’.*/

  select * from mulazim 
  where PhoneNumber like '0300%'

/*Q18??

Select EmployeeName and Email where Email contains ‘gmail.com’.*/

select Employeename, Email from mulazim 
where Email like '%gmail.com%'


/*Q19??

Retrieve employees whose Age is not null.*/

select * from mulazim 
where Age is not null






--_______________________________________2. WHERE Filtering (Advanced) – 20 Questions_______________________________________________________________________________--


/*? Question 1:

Retrieve employees whose Salary is greater than the average salary of all employees*/

select department, EmployeeName, Salary from mulazim
where salary > (Select AVG(Salary) as  AVGSALARY from mulazim)


select m1.department, m1.EmployeeName, m1.Salary from mulazim m1
where salary > (Select AVG(m2.Salary) as  AVGSALARY from mulazim m2
inner join mulazim
 on m2.Department =  m1.Department
)



/*Question 2:

Select employees whose Salary is greater than 50,000 and Department is 'IT'.*/

select * from mulazim 
where Salary > 50000 and Department = 'IT'

/*?? Question 3:

Retrieve employees whose Age is between 25 and 35.*/

select * from mulazim 
where AGE between 25 and 35


/*?? Question 4:

Select employees whose EmployeeName starts with ‘A’ and Status is ‘Active’.*/

select * from mulazim 
where employeeName like 'A%' and Status ='Active'


/*? Q5:

Retrieve employees whose Email ends with '@gmail.com'.*/

select * from mulazim 
where Email like '%@gmail.com'



/*? Question 6:

Select employees whose HireDate is in the year 2024*/

select * from mulazim 
where year(HireDate) = '2024'

/*? Question 7:

Retrieve employees who were born before 1990*/

select * from mulazim 
where year([date of Birth]) < 1990


/*? Question 8:

Select employees whose Department is either ‘HR’, ‘IT’, or ‘Finance’*/
select * from mulazim 
where Department in ('HR' , 'IT' , 'Finance' )


/*? Question 9:

Retrieve employees whose Salary is not null.*/

select * from mulazim 
where Salary is not null


/*? Question 10:

Select employees whose Address contains the word ‘Street’.*/

select * from mulazim 
where Address like '%Street%'

/*? Question 11:

Retrieve employees who are not in the ‘Admin’ department.*/

select * from mulazim 
where Department != 'Admin'




/***********************************3. Aggregate Functions – 20 Questions***********************************/

/*1. Find the average salary of all employees.*/
select  AVG(Salary) as TOTAL_SALARY_AVG from mulazim 


/*2. Find the total salary of all employees in the company*/
Select SUM(Salary) as total_Salary from mulazim 


/*3. Find the maximum salary among all employees.*/
select Max(Salary) MAX_SALARY from mulazim

/*4. Find the minimum salary among all employees.*/
select min(Salary) min_SALARY from mulazim


/*5. Count the total number of employees*/
Select count(*) total from mulazim 


/*6. Count the number of employees in the ‘IT’ department.*/
select count(*) from mulazim
where Department = 'IT'

/*7. Find the average age of employees in each department.*/

select Department, AVG(AGE) from mulazim
Group by Department

/*Question 8: Find the total salary of employees in each department.*/

select Department, sum(Salary) total_Salary from mulazim
Group by Department


/*9. Find the maximum salary in each department.*/
select Department, MAx(salary) from mulazim
group by department

/*10. Find the minimum salary in each department.*/

select Department, min(salary) from mulazim
group by department

/*11. Count the number of employees whose salary is above 50,000.*/
select Count(*) from mulazim 
where Salary > 50000;


/*12. Count the number of employees whose status is ‘Active’.*/

select count(*) from mulazim
where status = 'Active'


/*Calculate the sum of salaries for employees hired in 2024.*/

select SUm(Salary) from mulazim 
where Datename(year,HireDate)= '2024' 


select SUm(Salary) from mulazim 
where year(HireDate)= 2024 

 
/*14. Find the average salary of employees whose age is greater than 30.*/
select AVG(salary) from mulazim 
where AGE > 30

/*15. Find the maximum salary among employees whose designation is ‘Manager’.*/
select  max(Salary) from mulazim 
where Designation = 'Manager'


/*Question 16:
Count the number of employees in departments where total employees are greater than 5.*/
 
select department,count(*)  from mulazim 
group by department
having count(*) > 5

/*Question 17:
Find the total salary of employees whose status is ‘Inactive’.*/
select SUM(Salary) from mulazim 
where Status = 'Inactive'


/*18 :Find the average salary difference from the department’s average salary.*/

Select m2.department, m2.Salary, M2.salary - m.AVGSALARY  as SALARYDIFF from mulazim m2

join
	(
	Select  Department, AVG(Salary) as AVGSALARY from mulazim 
group by Department
) as m
on m.Department = m2.Department
	
/*Question 19:
Count the number of unique designations in the company.*/
select  count(Distinct Designation) as UniqueDesignations from mulazim 

select count(*) from 
(Select Distinct Designation from mulazim)

/*20. Find the sum of salaries of employees whose hire date is within the last year.*/

select Sum(salary) from mulazim 
where hiredate >= dateadd(year,-1,getdate())




/***************************group by And having cluse********************************************/


/*1. Count the number of employees in each department.*/
select department,count(*) total_employees from mulazim 
group by Department


/*Find the average age of employees in each department.*/
 select Department, AVG(AGE) as avg_AGE from mulazim 
 group by Department


 /*3. Find the maximum salary in each departmen*/
 select Department,MAX(Salary) from mulazim
 group by Department



 /*Question 1:

Count employees in each department whose salary is above 50,000.

Level: Upper-Intermediate*/

select Department, Count(*) from mulazim 
where salary > 50000
group by Department


/*2. Find total salary of departments having more than 5 employees.*/


select Department,count(*) NUMBER_OF_Employees ,Sum(Salary) as TOTAL_SALARY from mulazim 
group by Department
Having count(*) > 5

/*3. Find maximum salary in departments where average age > 30.*/

select DEpartment, MAX(Salary) as MAXAGE, AVG(AGE) AVG_AGE from mulazim 
group by Department
Having AVG(AGE) >= 30

/*4. Find departments where minimum salary < 30,000.

Level: Upper-Intermediate / Advanced*/

select Department, min(salary) MINSALARY from mulazim 
group by Department
Having min(salary) <30000


/*Question 5

5. Count employees in each department with status = 'Active' and salary > 60,000.

Level: Advanced*/

select Department, count(*) as TOTAL_EMPLOYEES from mulazim
where Status = 'Active' and Salary > 60000
group by Department

/*6. Find departments where total salary is between 100,000 and 500,000.

Level: Advanced*/
select Department, SUm(Salary) from mulazim 
group by Department
having Sum(Salary) between 100000 and 500000


/*Advanced GROUP BY & HAVING – Question 7
7. Find average salary per designation in departments having more than 2 managers.*/
select Designation, AVG(salary) Avgsalary from mulazim 
group by Designation
having count(case when Designation = 'Manager' then 1 End) >2

/*8. Count employees per department who joined in the last 6 months.

Level: Advanced*/

select Department, Count(*) Counted from mulazim 
where Hiredate >= DATEADD(MONTH,-6, Getdate())
group by Department



/*9. Find departments where maximum salary > 150,000 and average salary > 80,000.
Level: Advanced*/

select  Department, max(Salary) as SUM_SALARY , AVG(Salary) as AVG_SALARY from mulazim 
group by Department
Having AVG(Salary) >80000 and max(Salary) > 150000

/*10. Count employees in each department grouped by status (Active, Inactive, etc.).

Level: Advanced*/
Select department,Status, Count(*) as total_Status from mulazim 
group by Status, department



/*1. Find total salary per department for employees hired in 2024.

Level: Advanced*/
select Department, Sum(Salary) as total_salary from mulazim 
where DATENAME(Year,HireDate) = '2024'
group by Department


/*12. Count employees in each department whose salary is below the department average.

Level: Advanced*/
select Department, salary, Count(*) as TOTAL_NUMBER, AVG(Salary) as total_Salary from mulazim 
Group by Department 
having AVG(Salary) > Salary 

select m1.Department,  Count(*) as TOTAL_NUMBER  from mulazim m1
where m1.salary < (Select AVG(m2.Salary) as total_Salary from mulazim m2 
where 
m2.Department = m1.Department
)
GROUP BY m1.Department



/*13. Find departments having total salary between 100,000 and 500,000.

Level: Intermediate–Advanced*/

select Department, Sum(Salary) as Total_salary from mulazim 
group by Department
Having Sum(Salary) Between 100000 and 500000



/*14. Find average salary per designation.

Level: Basic–Intermediate*/

select designation, AVG(salary) as  AVG_SALARY  from mulazim 
Group by designation 


/****************************************************************************************************************************************/

/*Question 2:

“Write a query to find employees whose email is unique.” */


Select Department,Count(*) AS total from mulazim 
group by Department
Having Count(*) = 1



Select Department,Count(*) AS total from mulazim 
group by Departmentnext
Having Count(*) >1

SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Mulazim') AND is_unique = 1;




/************************STRING_FUNCTIONS**********************************************/

/*String Functions – Question 1

1. Get the first 3 characters of each EmployeeName.

Level: Beginner–Intermediate*/

select Employeename, Left(EmployeeName, 3 ) as first_THree_CHARACTERS from mulazim 
select Employeename, right(EmployeeName, 3 ) as first_THree_CHARACTERS from mulazim 

seLect EmployeeName, Substring(EmployeeName, 1,3) as first_THree_CHARACTERS from mulazim
 

 /*2. Convert all EmployeeName values to uppercase.

Level: Beginner–Intermediate*/

Select EmployeeName, Upper(EmployeeName) as UPPERCASE 
from mulazim 


/*3. Convert all EmployeeName values to lowercase.*/
Select EmployeeName, lower(EmployeeName) as lowerCASE 
from mulazim 



/*4. Find employees whose Email ends with @gmail.com.

Level: Beginner–Intermediat*/
Select EmployeeName, Email from mulazim  
Where Email like '%@gmail.com'

/*5. Concatenate EmployeeName and Department into a single column.
Level: Beginner–Intermediate*/

Select EmployeeName+' '+  Department from mulazim 
Select Concat(EmployeeName,'_' , Department) as CONVATED from mulazim 


/*. Find the length of each employee’s Address.*/
Select len(Convert(Varchar(100),Address)) as Length_OF_Address from mulazim m


/*String Functions – Question 7

7. Trim leading and trailing spaces from EmployeeName.*/

Select Trim(EmployeeName) from Mulazim

/*8. Replace any occurrence of “Manager” with “Lead” in Designation.*/
update Mulazim 
Set Designation = Replace(Designation, 'Manager' , 'Lead')

Select Designation,
Replace(Designation, 'Manager', 'Lead') from mulazim


/*String Functions – Question 9

9. Extract the domain name from Email (after @).*/

SELECT Email, 
Substring(EMAIL,Charindex('@',Email) + 1 , Len(Email))
from mulazim

/*String Functions – Question 11

Task:
Find employees whose EmployeeName contains the substring "Ali".*/


Select EmployeeName From mulazim 
where employeeName Like '%ALI%'

/*2. Get the rightmost 4 digits of PhoneNumber*/

Select Right(PhoneNumber,4) as RIGHTMOST from mulazim

/*Task:
Left-pad EmployeeID with zeros to make it 5 digits long.

Level: Intermediate*/

select Right(Concat('00000' + cast(EmployeeID as Varchar(5)),5) from mulazim

Select Right(Concat('00000', + EmployeeID), 5) from mulazim

/*Task:
Split Address by comma and show the first part.*/
Select Address, STRING_SPLIT(Address , ',') from mulazim


SELECT Address, 
       SUBSTRING(Address, 1, CHARINDEX(',', Address)-3) AS FirstPart
FROM mulazim;


/*20.	Extract the first name and last name separately assuming a space between them*/

select Employeename from mulazim
select left(EmployeeName, CHARINDEX(' ',EmployeeName  ) -1) as first_name ,
       right(EmployeeName, LEN(EmployeeName) - CHARINDEX(' ' ,EmployeeName)) as last_name  from mulazim

/*************************************TIME_AND_DATE*****************************************************************/

/*?? Date Functions – Question 1

Find the number of years each employee has worked using HireDate.
?? Tum query likho.*/

select EmployeeName , DateDiff(Year,Hiredate,Getdate()) as DATEDIFF_ from mulazim


SELECT EmployeeName, DATEPART(WEEKDAY, HireDate) AS DayNumber
FROM Mulazim;


SELECT EmployeeName,Hiredate, FORMAT(HireDate, 'MMMM yyyy') AS FormattedHireDate
FROM Mulazim;


SELECT EmployeeName, EOMONTH(HireDate) AS EndOfMonth
FROM Mulazim;

/*?? Date Functions – Question 2

Find employees who were born in the year 1995.

?? Tum query likho.*/

select EmployeeName, Hiredate from mulazim 
Where DateName(YEAR, [date of Birth]) = 1995


select [date of Birth] from mulazim 

/*?? Date Functions – Question 3

Calculate the number of days since each employee was hired.*/

Select EmployeeName, Datediff(Day,Hiredate,Getdate()) as total_days from mulazim 

/*Extract the month from HireDate for all employees.*/

Select EmployeeName, Datename(MONTH,Hiredate) as total_name,
                     Datepart(MONTH,Hiredate) as total_month          
from mulazim 

/*“Extract the day of the week from HireDate”*/

Select EmployeeName, Datename(WEEKDAY,Hiredate) as DAYNAMEs from mulazim

/*Ab Question 6 ready hai:
Extract the year from DateOfBirth.*/


Select EmployeeName, year([date of Birth]) as YEARNAME from mulazim


/*Ab Question 7:
Find employees whose birthday is today (day & month match).*/

Select EmployeeName, Hiredate,[date of Birth] from mulazim
Where 
     Month([date of Birth]) = Month(Getdate())
	 And
	 Day([date of Birth]) = Day(Getdate())


/*Add 6 months to each employee’s HireDate.*/

Select EmployeeName,Hiredate, Dateadd(MONTH,6,Hiredate) as SIX_MONTHS_ADDED from mulazim

/*Ab Question 9 ready hai:
Subtract 1 year from each employee’s DateOfBirth.*/
Select EmployeeName,[date of Birth], Dateadd(YEAR,-1,[date of Birth]) as subtracted_one_year from mulazim

/*Ab Question 10 ready hai:
Calculate the difference in months between HireDate and today.*/

select Employeename, DateDiff(MONTH,Hiredate,GEtdate()) 
from mulazim ;


/*1.	Create a CTE to select all employees from Mulazim.*/
with CTE as 
(
 Select * from mulazim 
)
Select * from CTE;

/*2 Create a CTE to select employees with salary greater than 50,000.*/
with CTE as 
(
Select * from mulazim
where Salary > 50000
)
select * from CTE;

/*3. Use a CTE to calculate total number of employees.*/
 
WITH CTE AS
( 
 select count(*) as [Total Number OF Epmloyees] from mulazim
)
select * from CTE;

/*4.	Create a CTE to find employees hired after 2020.*/

WITH CTE AS
(
 select EmployeeName, HireDate from mulazim 
 where year(HireDate)> 2020
)
select * from CTE;

/*5. Use a CTE to extract employee name and department only.*/
with CTE as 
(
 Select EmployeeName, Department from mulazim
)
select EmployeeName, Department from CTE;



/*6. Create a CTE to calculate average salary per department*/

with CTE as 
(
 Select Department, Avg(Salary) as AVG_SALARY from mulazim
 group by Department 
)

select * from CTE;

/*7.	Use a CTE to find employees whose salary is above department average.*/
with CTE AS
(
Select EmployeeName, Department, Salary from mulazim m1
where Salary > (Select Avg(Salary) as AVG_Salary from mulazim m2
where m2.Department = m1.Department
)
)
Select * from CTE;


/*?? CTE – Question 8 (Intermediate)

Create a CTE to count employees in each department.*/

with CTE_Total_Count as 
(
 Select Department, Count(*) as total_number from mulazim 
 group by Department
)
select * from CTE_Total_Count
order by total_number


/*?? CTE – Question 9 (Intermediate)

Use a CTE to calculate years of service for each employee.*/

Select EmployeeName, DateDiff(YEAR,HireDate,Getdate()) as YEASR_OF_SERVICE, DateDiff(MONTH,HireDate,Getdate()) as Months_OF_SERVICE 
from mulazim
Create a CTE to find employees with the maximum salary in each department.

/*Create a CTE to find employees with the maximum salary in each department..*/ 


with  CTE_MAximum as
(
select Employeename, Department, salary from mulazim m1
where salary = (select max(salary) as MAX_SALARY from mulazim m2
where m2.Department = m1.Department)
)

select * from CTE_MAximum


with  CTE_MAximum as
(
select Department, max(salary) as max_salary from mulazim
group by Department
)

select * from CTE_MAximum;

/*?? CTE – Question 11 (Upper-Intermediate)

Create a CTE to find the second highest salary in each department.*/
with CTE_RANKIng 
AS
(
select Department, salary as secound_max_salary,
DENSE_RANK() over(Partition by Department order by Salary DESC) as ranking
from mulazim

)
select Department, secound_max_salary from CTE_RANKIng
where ranking =2


/*?? CTE – Question 12 (Upper-Intermediate)

Create a CTE to find employees who were hired most recently in each department*/

with RECENT_EMPLOYEE as 
(
 Select EmployeeName, Department,HireDate,
 DENSE_RANK() Over(PArtition by Department order by  HireDate desc) Ranking 
 from mulazim 
)
select  EmployeeName, Department,HireDate from RECENT_EMPLOYEE
where RAnking = 1

/*Create a CTE to find employees whose salary is higher than the average salary of their department, 
and also show the department average salary alongside each employee.*/

WITH CTE_HIGHER_SALARY 
as 
(
 Select Department, AVG(Salary) as AVG_SALARY
 from mulazim
 Group by Department
)
Select m.EmployeeName, m.Department, m.salary, d.AVG_SALARY from CTE_HIGHER_SALARY d
join Mulazim  m on d.Department = m.Department
where m.Salary> d.AVG_SALARY

/*?? CTE – Question 14 (Advanced)

Create a CTE to find, for each department, the employee who has the minimum salary, along with their salary.*/

WITH MIN_SALARY 
as 
(
 Select Department, MIN(Salary) as MIN_SALARY 
 from mulazim 
 Group BY Department
)
Select M.EmployeeName, D.Department, D.MIN_SALARY from MIN_SALARY D
Join Mulazim M On M.Department = D.Department

/*?? CTE – Question 16 (Advanced)

Create a CTE to calculate cumulative salary for each department, ordered by employee hire date.

Expected columns for output:

EmployeeName

Department

HireDate

Salary

CumulativeSalary (running total per department)*/

WITH CTE_CUMULATIVE_SALARY
as
(
Select Department, EmployeeName, Hiredate, Salary,
SUM(Salary) over(PArtition by Department Order By HireDate
Rows Between UnBounded Preceding ANd Current Row) as CumulativeSalary
from mulazim
)
Select * from CTE_CUMULATIVE_SALARY


/*🔹 CTE – Question 20 (Advanced)

Create a CTE to find employees who have been working longer than the average tenure of their department.

Expected columns:

EmployeeName

Department

HireDate

YearsOfService

DepartmentAverageYears*/ 

;With CTE_Years_Of_Service as 
(
 Select EmployeeName, Department, HireDate, DateDiff(Year,HireDate,Getdate()) as YearsOfService
 From mulazim
),
CTE_Department_Average_Years
AS
(Select Department,AVG(YearsOfService) as DepartmentAverageYears 
from CTE_Years_Of_Service
Group by Department
)

Select y.EmployeeName, y.Department, y.HireDate, y.YearsOfService ,D.DepartmentAverageYears
from CTE_Years_Of_Service y
join CTE_Department_Average_Years D on D.Department = y.Department
Where YearsOfService> DepartmentAverageYears 



/****************************************STORED PROCEDURES***********************************************************************/
;CREATE PROCEDURE RECOARDS 
AS
BEGIN

SELECT * FROM MULAZIM

END

EXEC RECOARDS

/*🔹 SP – Question 2 (Beginner)

Create a stored procedure that accepts a department name as a parameter and returns employees from that department.*/

CREATE PROCEDURE DEP_DATA
@DepsrtmentName Varchar(50) 
as
BEGIN
SELECT EmployeeName, Department from mulazim 
where Department = @DepsrtmentName
END

EXEC DEP_DATA 'IT'

/*🔥 SP – Question 3 (Beginner/Intermediate)

Task: Create a stored procedure that accepts a salary value as a parameter and returns all employees whose salary 
is greater than that value.*/

Alter PRocedure SALARY_SP
@SALARY_VAlue INT
as 
BEgin 
Select EmployeeName, Department, Salary from mulazim 
Where Salary > @SALARY_VAlue
end

EXEC SALARY_SP 20000

/*🔹 SP – Question 4 (Intermediate)

Task:
Create a stored procedure that counts the number of employees in each department and returns:

Expected columns:

Department

EmployeeCount*/

Create procedure TOTAL_NO_OF_EMPLOYEES
as 
begin
select Department, count(*) as EmployeeCount from mulazim
group by Department
end

exec TOTAL_NO_OF_EMPLOYEES 

/*Question 5 (Intermediate/Advanced)

Task:
Create a stored procedure that accepts a date parameter and returns all employees hired after that date.

Expected columns:

EmployeeName

Department

HireDate*/

CREate procedure HIRED
@HireAfterDate DATE
as 
Begin 
Select EmployeeName, department, HireDate from mulazim 
where Hiredate> @HireAfterDate
END

exec HIRED '2025-01-25'


/*Question 6 (Advanced)
Task:
Create a stored procedure that returns employees whose salary is greater than the average salary of their department.
Expected columns:
EmployeeName
Department
Salary
DeptAverageSalary*/

Create procedure Salary_ABOVE_AVG
as 
Begin 
Select EmployeeName, Department, salary from mulazim m
where Salary > (Select AVG(Salary) as DeptAverageSalary from mulazim m1
where m1.Department = m.Department)
End

Exec Salary_ABOVE_AVG


Create procedure SalaryABOVEAVG
as 
Begin 
WITH CTE AS
(
    SELECT
        EmployeeName,
        Department,
        Salary
    FROM mulazim
),
AVGSALARY AS
(
    SELECT
        Department,
        AVG(Salary) AS DeptAverageSalary
    FROM mulazim
    GROUP BY Department
)
SELECT
    c.EmployeeName,
    c.Department,
    c.Salary,
    a.DeptAverageSalary
FROM CTE c
JOIN AVGSALARY a
    ON c.Department = a.Department;

end

Exec SalaryABOVEAVG


/*🔹 SP – Question 7 (Advanced)

Task:
Create a stored procedure that returns the top 3 highest paid employees per department using DENSE_RANK().
Expected columns:
EmployeeName
Department
Salary
Rank*/

CREATE PROCEDURE THIRDHIGHESTSalary 
as
Begin
WITH CTE AS
(
SELECT EmployeeName, Department, Salary,
Dense_Rank() OVER(Partition by Department Order by Salary DESC) as Ranking
from mulazim
)
SELECT EmployeeName, Department, Salary ,Ranking from CTE
Where Ranking = 3
END
EXEC THIRDHIGHESTSalary




/*Create a stored procedure that returns highest paid employee of each department
(CTE + ROW_NUMBER() use karo)*/

CREATE PROCEDURE FirstHIGHESTSalary 
as
Begin
WITH CTE AS
(
SELECT EmployeeName, Department, Salary,
ROW_NUMBER() OVER(Partition by Department Order by Salary DESC) as Ranking
from mulazim
)
SELECT EmployeeName, Department, Salary ,Ranking from CTE
Where Ranking = 1
END
EXEC FirstHIGHESTSalary


/*Question 9 (Advanced Stored Procedure)
Create a stored procedure that calculates the total salary budget for each department and returns only those
departments whose total salary is greater than 300,000.*/

CREATE PROCEDURE TOTAL_SALARRY 
AS
BEGIN
SELECT Department, SUM(Salary) as TotalSalary from mulazim
Group by Department
Having SUM(Salary) > 300000
END

EXEC TOTAL_SALARRY

/*Question 10 (Advanced)

Task:
Create a stored procedure that returns top 2 highest paid employees in each department.*/
CREATE PROCEDURE TOP_SALARY
as
BEGIN
;WITH TOP_TWO_SALARYS 
as
(
select EmployeeName, Department, Salary,
Dense_Rank() Over(Partition By Department Order by salary Desc) Ranking
from Mulazim
)
Select EmployeeName, Department, Salary from TOP_TWO_SALARYS
Where Ranking <= 2
END

exec TOP_SALARY


/*Question 11 (Advanced SP + Parameter + Filtering)
Create a stored procedure that accepts a salary value as a parameter and returns all employees who have salary 
greater than this value and belong to a specific department.*/

CREATE PROCEDURE PARAMETER_SALARYANDDEPARTMENT
@salary INT,
@Department Varchar(50)
AS
BEGIN
SELECT EmployeeName, Department,Salary from mulazim
where Salary > @salary and Department = @Department
END 


EXEC PARAMETER_SALARYANDDEPARTMENT 21000,'IT'

/*🔥 Question 12 (Advanced – CTE + Ranking + Parameter)
Create a stored procedure that accepts a department name as parameter and returns the top 3 highest paid 
employees in that department*/

Create PROCEDURE THIRDHIGHEST
@DeptName VARCHAR(50)
as
Begin
WITH CTE AS
(
SELECT EmployeeName, Department, Salary,
Dense_Rank() OVER(Partition by Department Order by Salary DESC) as Ranking
from mulazim
where Department = @DeptName
)
SELECT EmployeeName, Department, Salary ,Ranking from CTE
Where Ranking <= 3
END
EXEC THIRDHIGHEST 'IT'




















