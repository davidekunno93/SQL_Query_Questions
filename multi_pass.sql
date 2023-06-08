SELECT *
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id;


SELECT title, film.film_id
FROM film_actor
INNER JOIN film
ON film.film_id = film_actor.film_id;

SELECT first_name, last_name, title
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;
INNER JOIN film
ON film.film_id = film_actor.film_id;

-- sub-queries
-- query on the subset data return from an earlier query

-- 1st Query
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < -15000
ORDER BY SUM(amount);

-- 2nd Query
SELECT * from customer

SELECT first_name, last_name, email
FROM customer;

-- sub-queries in WHERE, FROM and rarely SELECtT

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) < -15000
    ORDER BY SUM(amount)
)

-- this is supposed to be a sub-query method 2
SELECT first_name, last_name
FROM (
    SELECT title, first_name, last_name
    FROM film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film_actor
    ON film.film_id = film_actor.film_id
) AS multi
WHERE title LIKE 'Chea%';


