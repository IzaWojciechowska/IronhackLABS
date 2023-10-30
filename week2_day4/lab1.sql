-- In this lab, you will be using the Sakila database of movie rentals.
use sakila;

-- Instructions
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select c.name as category, count(fc.film_id) as amount_of_films
from category c
join  film_category fc on c.category_id = fc.category_id
group by c.name;

-- 2. Display the total amount rung up by each staff member in August of 2005.

select s.staff_id, s.first_name, s.last_name, sum(p.amount)
from staff s
join payment p on s.staff_id = p.staff_id
where year(p.payment_date) = 2005 and month(p.payment_date) = 8
group by s.staff_id;

-- 3. Which actor has appeared in the most films?

select a.actor_id, a.first_name, a.last_name, count(fa.film_id)
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id
order by count(fa.film_id) desc
limit 1;

-- 4. Most active customer (the customer that has rented the most number of films)

select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as number_of_rented_films
from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id
order by count(r.rental_id) desc
limit 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
join address a on s.address_id = a.address_id
group by s.first_name, s.last_name, a.address;

-- 6. List each film and the number of actors who are listed for that film.

select f.title as film_title, count(fa.actor_id) as number_of_actors
from film f
join film_actor fa on f.film_id = fa.film_id
group by f.title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_payment
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name asc;

-- 8. List the titles of films per category.

select c.category_id, c.name as name_of_vategory, f.title as film_title
from category c 
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
order by c.category_id;


