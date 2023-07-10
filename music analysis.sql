use music_data_db;
show tables;


-- write the query to find the address and state in the dataset:

select address,state from  employee;



-- finf the senior most emplyee:


select * from employee;
select title,first_name,last_name ,levels from employee order by levels desc limit 1;



-- country with most invoice:


select * from invoice;
select count(*)as c,billing_country from invoice  group by billing_country order by c desc;



-- top three values of total invoices:


select total as c from invoice order by c desc limit 3;



-- Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals:

select * from customer;
 select * from invoice;
 select billing_city ,sum(total)from invoice group by billing_city order by  sum(total) desc limit 1;
 
 
-- Write a query that returns the person who has spent the most money:

select customer_id, first_name, last_name ,sum(total)from customer  join invoice 
on customer.customer_id= invoice.invoice_id 
group by customer.customer_id 
order by sum(total) desc;


-- Write query to return the email, first name, last name, & Genre of all Rock Music listeners.Return your list ordered alphabetically by email starting with A:

select  distinct  email , first_name, last_name from customer  join invoice 
on customer.customer_id= invoice.customer_id 
join invoiceline on invoice.invoice_id= invoiceline.invoice_id 
join track on track.track_id= invoiceline.track_id 
join genre on genre.genre_id= track.genre_id 
group by genre.name like 'rock'
order by  email;



-- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first:

select name,miliseconds
from  track where miliseconds > (select avg (miliseconds) as final_track from track )
order by  miliseconds desc;


-- We want to find out the most popular music Genre for each country. We determine the most popular genre as the genres 
-- with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum
--  number of purchases is shared return all Genres:


select count(*) as purchases_per_genre, customer.country, genre.name, genre.genre_id
		from invoice_line
		join invoice on invoice.invoice_id = invoice_line.invoice_id
		join customer on  customer.customer_id = invoice.customer_id
		join track on  track.track_id = invoice_line.track_id
	    join genre on genre.genre_id = track.genre_id
		group by 2,3,4
order by 2),

country AS (SELECT MAX(purchases_per_genre)
max_genre_per_country AS max_genre_number, country FROM sales_per_country GROUP BY 2 ORDER BY 2)

SELECT sales_per_country.* 
FROM sales_per_country
JOIN max_genre_per_country ON sales_per_country.country = max_genre_per_country.country
WHERE sales_per_country.purchases_per_genre = max_genre_per_country.max_genre_number;



-- Write a query that returns the Artist name and total track count of the top 10 rock bands:


select  artist.artist_id, artist.name,count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join  genre on genre.genre_id = track.genre_id
where  genre.name like 'Rock'
group by  artist.artist_id
order by number_of_songs desc
LIMIT 32;
