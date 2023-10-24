-- Display all available tables in the Sakila database.
use sakila;
show tables;

-- Retrieve all the data from the tables actor, film and customer.
select *
from actor, film, customer;

-- Retrieve the following columns from their respective tables:
-- 1 Titles of all films from the film table
select title
from film;

-- 2 List of languages used in films, with the column aliased as language from the language table
select name "language from the language table"
from language;

-- 3 List of first names of all employees from the staff table
select first_name
from staff;

-- Retrieve unique release years.
select distinct release_year
from film;

-- Counting records for database insights:
-- 1 Determine the number of stores that the company has.
select count(*)
from store;

-- 2 Determine the number of employees that the company has.
select count(*)
from staff;

-- 3 Determine how many films are available for rent and how many have been rented.
select count(*) "Amount of all films"
from film;

select count(*) "Amount of not available films now"
from rental
where return_date is null;


-- they both don't show good values of avaliable films now :/ 
SELECT COUNT( film_id) as "Amount of available films now"
FROM film
WHERE film_id not in 
			(select distinct film_id from inventory where inventory_id in 
											(select inventory_id from rental where return_date IS NULL));

select count(distinct film_id) as "Amount of available films now"
from inventory 
where inventory_id not in 
					(select inventory_id from rental where return_date IS NULL);

-- 4 Determine the number of distinct last names of the actors in the database.
select count(distinct last_name)
from actor;

-- Retrieve the 10 longest films.
select title, length
from film
order by length desc
limit 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT".
select *
from actor
where first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
select *
from film
where (upper(title) like '%ARMAGEDDON%') and (length > 100);

-- 7.3 Determine the number of films that include Behind the Scenes content
select count(*)
from film
where lower(special_features) like '%behind the scenes%';
