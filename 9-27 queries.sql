-- A list of customers who are not employees.

select * from "Customer" c
left outer join "Employee" e
on c."CustomerId" = e."EmployeeId"
where e."EmployeeId" is null;


-- A list of employee name pairs such that the person in the 1st column is 
-- the boss of the person on the right.

select
	e2."LastName" || ' ' || e2."FirstName" as "Boss",
	e1."LastName" || ' ' || e1."FirstName" as "Employee"
from "Employee" e1, "Employee" e2
where e2."EmployeeId" = e1."ReportsTo"
order by e2."LastName";




