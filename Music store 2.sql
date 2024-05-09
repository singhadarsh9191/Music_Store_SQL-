--Q1: Write a query to return the email, first name, last name & Genre of all Rock music listener. Return your list ordered
-- alphabetically by email starting with A.

select customer.email, customer.first_name, customer.last_name, genre.name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
order by customer.email asc


-- Q2: Let's invite the artist who have written the most rock music in our Dataset. Write a query that returns the
-- Artist name and the total track count of the top 10 rock bands.

select artist.artist_id, artist.name, count(artist.artist_id) as Track_count from artist
join album on artist.artist_id = album.artist_id
join track on album.album_id = track.album_id
join genre on track.genre_id = genre.genre_id
where genre.name = 'Rock'
group by artist.artist_id 
order by Track_count desc
limit 10;

--Q3: Return all the track name that have a song length longer than the average song length. Return the Name
-- and millisecond for each track. Order by the song length with the longest song listed first.

select name, milliseconds from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc
