-- 1. How many copies of the film _Hunchback Impossible_ exist in the inventory system?
USE sakila;
SHOW tables;
SELECT count(inventory_id) FROM inventory
	WHERE film_id = (SELECT film_id FROM film
	WHERE title = 'Hunchback Impossible' ); 

-- 2. List all films whose length is longer than the average of all the films.

  -- AVERGAE of film.length
	SELECT avg(length) FROM film;
    
	-- main querry
    SELECT title as 'films longer than average movie'
    FROM film
		WHERE length > (SELECT avg(length) FROM film);

-- 3. Use subqueries to display all actors who appear in the film _Alone Trip_.

	-- Get film_id of 'Alone Trip'
SELECT film_id FROM film
			WHERE title = 'Alone Trip';

   -- Get actors in film_actor
SELECT * FROM film_actor;

	-- Get all actor_id from 'Alone Trip'
SELECT actor_id 
	FROM film_actor
    WHERE film_id = (SELECT film_id 
						FROM film
						WHERE title = 'Alone Trip');

	-- Get first and last name of actor_ids from 'Alone Trip'
SELECT first_name, last_name FROM actor
	WHERE actor_id in (
		SELECT actor_id 
			FROM film_actor
			WHERE film_id = (
				SELECT film_id 
					FROM film
					WHERE title = 'Alone Trip')							
    );  
      
-- 4. Sales have been lagging among young families, 
-- 		and you wish to target all family movies for a promotion. 
-- 		Identify all movies categorized as family films.

SELECT title FROM film
	WHERE film_id in (
		Select film_id FROM film_category
			WHERE category_id = (
				SELECT category_id 
					FROM category
					WHERE name = 'Family'
				)
			);
-- 5. Get name and email from customers from Canada using subqueries. 
SELECT first_name, last_name, email 
	FROM customer
	WHERE address_id in (
		SELECT address_id 
            FROM address
			WHERE city_id in 
				(SELECT city_id FROM city
					WHERE country_id in (
						SELECT country_id FROM country
							WHERE country = 'CANADA')
        )
);
-- Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information.
SELECT first_name, last_name, email
	FROM customer
		JOIN address
			ON address.address_id = customer.address_id
		JOIN city
			ON city.city_id = address.city_id
		JOIN country
			ON country.country_id = city.city_id
	WHERE country.country = 'CANADA';




-- # Optional
-- 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
-- 7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
-- 8. Customers who spent more than the average payments.