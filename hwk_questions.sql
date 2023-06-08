-- 1. List all customers who live in Texas (use JOINs)
    SELECT customer_id, first_name, last_name, address, district
    FROM customer
    INNER JOIN address
    ON customer.address_id = address.address_id
    WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
    SELECT customer.customer_id, first_name, last_name, amount
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
    WHERE amount > 6.99
    ORDER BY amount DESC;


-- 3. Show all customers names who have made payments over $175(use subqueries)
    SELECT customer_id, first_name, last_name
    FROM customer
    WHERE customer_id IN (
        SELECT customer_id
        FROM payment
        WHERE amount > 175
        ORDER BY amount DESC
    )


-- 4. List all customers that live in Nepal (use the city table)
    SELECT customer_id, first_name, last_name, country
    FROM customer
    INNER JOIN address
    ON customer.address_id = address.address_id
    INNER JOIN city
    ON address.city_id = city.city_id
    INNER JOIN country
    ON city.country_id = country.country_id
    WHERE country = 'Nepal';
    -- Kevin Schuler 


-- 5. Which staff member had the most transactions?
    SELECT staff_id, COUNT(payment_id)
    FROM payment
    GROUP BY staff_id
    ORDER BY COUNT(payment_id) DESC;

    SELECT staff_id, first_name, last_name
    FROM staff
    WHERE staff_id = 2;
    -- Jon Stephens had the most transactions


-- 6. How many movies of each rating are there?
    SELECT rating, COUNT(film_id)
    FROM film
    GROUP BY rating
    ORDER BY COUNT(film_id) DESC;
    -- PG-13: 223, NC-17: 209, R: 196, PG: 194, G: 178


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
    SELECT customer_id, first_name, last_name
    FROM customer
    WHERE customer_id IN(
        SELECT customer_id
        FROM payment
        WHERE amount > 6.99
    )


-- 8.How many free rentals did our store give away?
    SELECT COUNT(payment_id)
    FROM payment
    WHERE amount <= 0;
    -- 14,569 uncharged rentals