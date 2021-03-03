/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
WITH bacall_one AS (
    SELECT DISTINCT
        actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT
            film_id
        FROM film_actor
        WHERE actor_id = (
            SELECT
                actor_id
            FROM actor
                WHERE first_name = 'RUSSELL' AND last_name='BACALL')))
SELECT DISTINCT
    first_name || ' ' || last_name AS "Actor Name"
FROM film_actor
INNER JOIN actor USING (actor_id)
WHERE film_id IN (
    SELECT
        film_id
    FROM film_actor
    WHERE actor_id IN (SELECT actor_id FROM bacall_one)
) AND actor_id NOT IN (SELECT actor_id FROM bacall_one)
ORDER BY "Actor Name"; 
