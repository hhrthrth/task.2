--ЧАСТИНА 1:
  
SELECT 
    film.title AS Назва_фільму,
    film.length AS Тривалість,
    category.name AS Категорія
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id;

  
SELECT 
    film.title AS Назва_фільму,
    rental.rental_date AS Дата_оренди
FROM 
    customer
JOIN 
    rental ON customer.customer_id = rental.customer_id
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
WHERE 
    customer.first_name = 'Vlada' AND customer.last_name = 'Kovalenko';

  
SELECT 
    film.title AS Назва_фільму,
    COUNT(rental.rental_id) AS Кількість_оренд
FROM 
    rental
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
GROUP BY 
    film.title
ORDER BY 
    Кількість_оренд DESC
LIMIT 5;

--ЧАСТИНА 2:


INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (1, 'Alice', 'Cooper', 'alice.cooper@example.com', 
        (SELECT address_id FROM address WHERE address = '123 Main St' AND city_id = 
        (SELECT city_id FROM city WHERE city = 'San Francisco')), 
        1, CURRENT_TIMESTAMP);


UPDATE address
SET address = '456 Elm St'
WHERE address_id = (SELECT address_id FROM customer WHERE first_name = 'Alice' AND last_name = 'Cooper');


DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';
