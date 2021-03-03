/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */
SELECT
    special_feature,
    SUM(amount) as profit
FROM (
SELECT
    amount,
    UNNEST(special_features) as special_feature
FROM payment p
JOIN rental r
    ON p.rental_id=r.rental_id
JOIN inventory i
    ON r.inventory_id=i.inventory_id
JOIN film f
    ON i.film_id=f.film_id) AS subquery
GROUP BY special_feature
ORDER BY special_feature;
