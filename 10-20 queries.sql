-- Insert into your table all the records from Track that have a composer.
insert into "JacobT"
select * from "Track"
where "Composer" is not null;


-- Delete all instances of the song "Good Golly Miss Molly".
delete from "JacobT" 
where "Name" = 'Good Golly Miss Molly';


-- Update the UnitPrice to $50 for all songs composed by the Foo Fighters.
update "JacobT"
set "UnitPrice" = 50
where "Composer" = 'Foo Fighters';


-- Select employee names and their manager name
SELECT e."FirstName", boss."FirstName" 
FROM "Employee" e
full outer join "Employee" boss ON e."ReportsTo" = boss."EmployeeId";


-- Avg total value of invoices billed to Germany
select avg("Total") from "Invoice" i
where "BillingCountry" = 'Germany';


-- Who is the 15th Artist in the database, sorted alphabetically?
SELECT * 
FROM "Artist" a  
ORDER BY "Name" 
ASC LIMIT 1 OFFSET 14;


-- Which Composer has written the most Tracks in the database? (excluding null)
SELECT "Composer", COUNT(*) AS num_tracks
FROM "Track"
WHERE "Composer" is not null
GROUP BY "Composer"
ORDER BY "num_tracks" DESC
LIMIT 1;


-- List the 3 Track names that are also names of both Albums and Artists. Hint: intersect
select t."Name"
from "Track" t
join "Album" ON t."AlbumId" = Album."AlbumId"
join "Artist" ON Album."ArtistId" = Artist."ArtistId" 
where t."Name" = Album."Title" AND Album."Title" = Artist."Name"
LIMIT 3;


-- There is only one Track in the "Pop" genre longer than the average Track in the 
-- "Rock" genre. What is its name?
SELECT "Name"
FROM "Track" t
WHERE "GenreId" = (
    SELECT "GenreId"
    FROM "Genre" g
    where "Name" = 'Pop'
) AND "Milliseconds" > (
    SELECT AVG("Milliseconds")
    FROM "Track"
    JOIN "Genre" ON t."GenreId" = g."GenreId"
    WHERE g."Name" = 'Rock'
)
LIMIT 1;


-- Write a query to show how many other employees each Employee has reporting to them. 
-- Make sure the result set includes the Employees with zero subordinates.
select e1."LastName" || ', ' || e1."FirstName" AS employee_name, COUNT(e2."EmployeeId") AS num_subordinates
from "Employee" e1
left join "Employee" e2 ON e1."EmployeeId" = e2."ReportsTo"
group by e1."EmployeeId"
order by "num_subordinates" DESC;


-- For each customer who has spent over $45 across all their invoices, 
-- show their total amount spent and the number of days between their first and last purchase.
select c."CustomerId", SUM(i."Total") AS total_spent, 
    (MAX(i."InvoiceDate") - MIN(i."InvoiceDate")) AS days_between_purchase
from "Customer" c
join "Invoice" i ON c."CustomerId" = i."CustomerId"
group by c."CustomerId" 
having SUM(i."Total") > 45
order by "total_spent" DESC;


-- List the 3 Track names that are also names of both Albums and Artists
select "Name" from "Track"
intersect
select "Title" from "Album"
intersect
select "Name" from "Artist";


