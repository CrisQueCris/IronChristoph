-- # Lab | SQL Joins on multiple tables
USE sakila;
-- Querry 1 Write a query to display for each store its store ID, city, and country.

SELECT store.store_id, city.city, country.country
FROM store
	JOIN address
		ON store.address_id = address.address_id
	JOIN city
		ON address.city_id = city.city_id
	JOIN country
		ON city.country_id = country.country_id;

-- Querry 2 Write a query to display how much business, in dollars, each store brought in.

SELECT store.store_id, sum(payment.amount) AS business_in_dollars
FROM store
	JOIN staff
		ON store.store_id = staff.store_id
	JOIN payment
		ON payment.staff_id = staff.staff_id
GROUP BY store_id;

-- Querry 3 What is the average running time(length) of films by category?
CREATE OR REPLACE VIEW  av_runtime_cat AS
SELECT round(avg(film.length), 2) AS av_length, category.name
FROM film
	JOIN film_category
		ON film.film_id = film_category.film_id
	JOIN category
		ON category.category_id = film_category.category_id
GROUP BY category.category_id
ORDER BY av_length ASC;

-- Querry 4 Which film categories are longest(length)? (Hint: You can rely on question 3 output.)

SELECT * FROM av_runtime_cat
ORDER BY av_length DESC
LIMIT 10;


-- Querry 5 Display the most frequently(number of times) rented movies in descending order.

SELECT film.title, COUNT(rental.rental_id) AS nr_rented
FROM film
	JOIN inventory
		ON inventory.film_id = film.film_id
	JOIN rental
		ON rental.inventory_id = inventory.inventory_id
  GROUP BY film.film_id
  ORDER BY nr_rented DESC
  LIMIT 5;


-- Querry 6 List the top five genres in gross revenue in descending order.

SELECT category.name AS genre, sum(payment.amount) AS gross_revenue
FROM category
	JOIN film_category
		ON category.category_id = film_category.category_id
    JOIN inventory
		ON inventory.film_id = film_category.film_id    
	JOIN rental
		ON rental.inventory_id = inventory.inventory_id	
  	JOIN payment
		ON payment.rental_id = rental.rental_id
  GROUP BY category.category_id
  ORDER BY amount
  LIMIT 5;
        
-- Querry 7 Is "Academy Dinosaur" available for rent from Store 1?

SELECT film.title, film.film_id, inventory.inventory_id, store.store_id, max(rental.return_date)
FROM film
	JOIN inventory
		ON inventory.film_id = film.film_id
	JOIN store
		ON store.store_id = inventory.store_id
	JOIN rental
		ON rental.inventory_id = inventory.inventory_id
WHERE film.title = 'Academy Dinosaur' AND store.store_id = '1'
GROUP BY inventory_id; 
	
