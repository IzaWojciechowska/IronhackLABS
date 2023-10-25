use sakila;

-- Challenge 1
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

select max(length) as max_duration, min(length) as min_duration
from film;

-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
-- Hint: Look for floor and round functions.

select concat(floor(avg(length)/60),'h ',floor(avg(length)%60),'min')
from film;

-- 2.1 Calculate the number of days that the company has been operating.
-- Hint: To do this, use the rental table, and the DATEDIFF() function to
-- subtract the earliest date in the rental_date column from the latest date.

select DATEDIFF(max(rental_date), min(rental_date)) as number_of_days_that_the_company_has_been_operating
from rental;

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. 
-- Return 20 rows of results.

select *, monthname(rental_date) as month_of_rental, dayname(rental_date) as day_of_rental
from rental
order by rental_date
limit 20;

-- 3. You need to ensure that customers can easily access information about the movie collection. 
-- To achieve this, retrieve the film titles and their rental duration. 
-- If any rental duration value is NULL, replace it with the string 'Not Available'. 
-- Sort the results of the film title in ascending order.
-- Please note that even if there are currently no null values in the rental duration column, 
-- the query should still be written to handle such cases in the future.
-- Hint: Look for the IFNULL() function.

select title as film_title, ifnull(length,'Not Available') as duration
from film
order by film_title asc;

-- Challenge 2
-- Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
-- 1.1 The total number of films that have been released.

select count(*)
from film;

-- 1.2 The number of films for each rating.

select rating, count(film_id) as number_of_films
from film
group by rating;

-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
-- This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.

select rating, count(film_id) as number_of_films
from film
group by rating
order by number_of_films desc;

-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
-- Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.

select rating, round(avg(length),2) as mean_duration
from film
group by rating
order by mean_duration desc;

-- 2.2 Identify which ratings have a mean duration of over two hours in order to help select 
-- films for customers who prefer longer movies.

select rating, round(avg(length),2) as mean_duration
from film
group by rating
having mean_duration > 120;

