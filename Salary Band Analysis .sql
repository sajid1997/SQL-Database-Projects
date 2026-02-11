Q1 — Salary Band Analysis

/*Create salary bands using a CASE expression:
< 30,000 → Low
30,000–70,000 → Medium
70,000 → High*/

select
case 
when salary < 30000 then 'Low'
when salary < 70000 then 'Medium'
else 'High'
end as Band,
count(*) as counted
from Mulazim
group by 
case 
when salary < 30000 then 'Low'
when salary < 70000 then 'Medium'
else 'High'
END;
