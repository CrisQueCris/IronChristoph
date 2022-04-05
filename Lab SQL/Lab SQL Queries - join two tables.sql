USE sakila;
-- Query 1 Which actor has appeared in the most films?

SELECT actor.first_name, actor.last_name, film_actor.actor_id, film_id 
FROM film_actor 
JOIN actor 
ON film_actor.actor_id = actor.actor_id
GROUP BY actor_id
ORDER BY film_id DESC
LIMIT 1;

-- Query 2 Most active customer (the customer that has rented the most number of films)

SELECT customer.first_name, customer.last_name, count(payment.payment_id) AS nr_transactions, 
sum(payment.amount) AS sum_of_amount
FROM customer 
	JOIN payment 
		ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY nr_transactions DESC, sum_of_amount DESC
LIMIT 1;

-- Query 3 List number of films per category (ohne GROUP BY)
SELECT category.name, count(film_category.film_id) AS number_of_films 
FROM category 
	JOIN film_category 
		ON category.category_id = film_category.category_id
	GROUP BY category.category_id
	ORDER BY number_of_films DESC;

-- Query 4 Display the first and last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address 
from staff 
join address
on staff.address_id = address.address_id; 

-- Query 5 Display the total amount rung up by each staff member in August of 2005.
SELECT staff.first_name, staff.last_name, sum(payment.amount) AS total_amount -- , payment.payment_date
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01%' AND '2005-08-31%'
-- ORDER BY payment.payment_date
GROUP BY staff.staff_id;

-- Querry 6 List each film and the number of actors who are listed for that film.
SELECT film.title as film_title, count(film_actor.actor_id) as number_of_actors 
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id 
GROUP BY film.film_id
ORDER BY number_of_actors DESC;

-- Querry 7 Using the tables payment and customer and the JOIN command, 
-- list the total paid by each customer. List the customers alphabetically by last name.

SELECT sum(payment.amount) as total_payment, customer.last_name as customer_surname 
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id 
ORDER BY customer_surname;

-- Optional: Which is the most rented film? The answer is Bucket Brotherhood 
-- This query might require using more than one join statement. Give it a try.
SELECT rental_id, inventory_id FROM rental;
SELECT inventory_id, film_id FROM inventory;
SELECT film_id, title FROM film;

SELECT count(rental.rental_id) as number_rented, film.title
FROM rental
	JOIN inventory 
		ON rental.inventory_id = inventory.inventory_id
	JOIN film
		ON film.film_id = inventory.film_id
GROUP BY film.title
ORDER BY number_rented DESC
LIMIT 1;
