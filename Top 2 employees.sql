

with CTE
AS
(
 SELECT E.EmployeeName, E.DepartmentName,
 DENSE_RANK() Over(Partition By E.DepartmentName) as Ranking 
 from Employees E
 inner join Attendances A On A.EmployeeID=E.EmployeeID
 
),
Total_count
as
(
 Select  E.DepartmentName, count(*) as highest_Present_count
 from Attendances A
 where A.Status = 'Present'
 Group by E.DepartmentName
)


Select E.EmployeeName, q.DepartmentName, highest_Present_count from CTE q
inner join Total_count t on q.DepartmentName = T.DepartmentName
where Ranking = 2 
