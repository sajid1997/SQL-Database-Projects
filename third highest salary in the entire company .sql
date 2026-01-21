/*Question 10 (Advanced –
Write a SQL query to find the third highest salary in the entire company.*/

;With CTE as
(
 Select EmployeeName, Salary,
 Row_Number() Over(Order by Salary Desc) AS Salary_Ranking
 From Mulazim 
)
Select  EmployeeName, Salary from CTE
Where Salary_Ranking = 3
