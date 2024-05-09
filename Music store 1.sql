--Q1: Who is the seniormost employee based on job title?

--1st Method:

select * from employee
order by hire_date asc
limit 1

--2nd Method:

select * from employee
order by levels desc
limit 1

--Q2: Which Country has most invoices?

select count(*), billing_country
from invoice
group by billing_country
order by billing_country desc
limit 1

--Q3: What are top 3 values of Total invoices

select total from invoice
order by total desc
limit 3

--Q4: Which city has the best customer ? We would like to throw a promotional Music festival in the city 
--we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
--Return both the city name and sum of all invoice total.

select billing_city, sum(total)as total from invoice
group by billing_city
order  by total desc
limit 1

--Q5: Who is the best customer? The customer who has spent the most money will be declared best customer. 
--Write a query that returns the person who has spent the most money.

select customer.customer_id, sum(invoice.total) as total, customer.first_name, customer.last_name 
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1