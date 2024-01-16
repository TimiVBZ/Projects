-- 1.	Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

select FirstName, LastName, CustomerId, Country 
from Customer
Where Country <> 'USA';

-- 2.	Provide a query only showing the Customers from Brazil.

select * from Customer
Where Country = 'Brazil';

-- 3.	Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

select concat(FirstName, ' ', LastName) as 'Full Name', InvoiceId, InvoiceDate, BillingCountry
from Customer c
Inner join Invoice i on c.CustomerId = i.CustomerId;

-- 4.	Provide a query showing only the Employees who are Sales Agents.

select * from Employee
where Title = 'Sales Support Agent';

-- 5.	Provide a query showing a unique list of billing countries from the Invoice table.

select Distinct(BillingCountry)from Invoice
order by BillingCountry ASC;

-- 6.	Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
/*Come back to this*/
select * from Employee;
select * from Invoice;
select * from Customer;

-- 7.	Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

-- 8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as 'Year', sum(Total)  from Invoice
group by left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4);

-- 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(*) from InvoiceLine
where InvoiceId = 37;

-- 10.	Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
select InvoiceLineId, InvoiceId from InvoiceLine
group by InvoiceLineId;

-- 11.	Provide a query that includes the track name with each invoice line item.
select * from InvoiceLine ivl
Inner join Track t on ivl.TrackId = t.TrackId;

-- 12.	Provide a query that includes the purchased track name AND artist name with each invoice line item.

select * from InvoiceLine ivl
Inner join Track t on ivl.TrackId = t.TrackId
Inner join Album a on t.AlbumId = a.AlbumId
Inner join Artist ar on a.ArtistId = ar.ArtistId;

-- 13.	Provide a query that shows the number of invoices per country.

select BillingCountry, count(InvoiceId) as Count from Invoice
group by BillingCountry
order by Count;

-- 14.	Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
select Name, count(TrackId) from Playlist p
Inner join PlayListTrack pt on p.PlaylistId = pt.PlaylistId
group by Name;

-- 15.	Provide a query that shows all the Tracks but displays no IDs. The resultant table should include the Album name, Media type and Genre.

select t.Name, a.Title as 'Album', m.Name as 'Media Type', g.Name as 'Genre' from Track as t
Inner join Album as a on t.AlbumId = a.AlbumId
Inner join MediaType as m on t.MediaTypeId = m.MediaTypeId
Inner join Genre as g on t.GenreId = g.GenreId;

-- 16.	Provide a query that shows all Invoices but includes the number of invoice line items.
select i.InvoiceId, count(il.InvoiceLineId) as 'Number of Invoice line items' from Invoice as i
Inner join InvoiceLine as il on i.InvoiceId = il.InvoiceId
group by InvoiceId;

-- 17.	Provide a query that shows total sales made by each sales agent.

select e.EmployeeId, concat(e.FirstName, ' ', e.LastName) as 'Full Name', sum(i.Total) as 'total' from Employee as e
Inner join Customer as c on e.EmployeeId = c.SupportRepId
Inner join Invoice as i on c.CustomerId = i.CustomerId
group by e.EmployeeId;

-- 18.	Provide a query that shows the total sales per country. Which country's customers spent the most?

select BillingCountry, sum(Total) as 'Total' from invoice
group by BillingCountry
order by sum(Total) DESC;

-- 19.	Which sales agent made the most in sales in 2009?

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as 'Year', concat(e.FirstName, ' ', e.LastName) as 'Agent', sum(i.Total) as 'total' from invoice as i
inner join Customer as c on i.CustomerId = c.CustomerId 
inner join Employee e on c.SupportRepId = e.EmployeeId
where left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) = 2009
group by Year, Agent
order by total DESC;

-- 20.	Which sales agent made the most in sales in 2010?

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as 'Year', concat(e.FirstName, ' ', e.LastName) as 'Agent', sum(i.Total) as 'total' from invoice as i
inner join Customer as c on i.CustomerId = c.CustomerId 
inner join Employee e on c.SupportRepId = e.EmployeeId
where left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) = 2010
group by Year, Agent
order by total DESC;

-- 21.	Which sales agent made the most in sales over all?

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as 'Year', concat(e.FirstName, ' ', e.LastName) as 'Agent', sum(i.Total) as 'total' from invoice as i
inner join Customer as c on i.CustomerId = c.CustomerId 
inner join Employee e on c.SupportRepId = e.EmployeeId
group by Year, Agent
order by total DESC;

-- 22.	Provide a query that shows the most purchased track of 2013.

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as Year, t.Name as Track_name, count(t.Name) as count from Invoice as i
inner join InvoiceLine as il on i.InvoiceId = il.InvoiceId
inner join Track as t on il.TrackId = t.TrackId
where left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) = 2013
group by Year, Track_name
order by count DESC;

-- 23.	Provide a query that shows the top 5 most purchased tracks over all.

select left(STR_TO_DATE(InvoiceDate, '%Y-%m-%d'),4) as Year, t.Name as Track_name, count(t.Name) as count from Invoice as i
inner join InvoiceLine as il on i.InvoiceId = il.InvoiceId
inner join Track as t on il.TrackId = t.TrackId
group by Year, Track_name
order by count DESC
Limit 5;

-- 24.	Provide a query that shows the top 3 best selling artists.

Select a.Name, sum(t.UnitPrice) as total_ from Artist as a
inner join Album as al on a.ArtistId = al.ArtistId
inner join Track as t on al.AlbumId = t.AlbumId
group by a.Name
order by total_ DESC
Limit 3;
