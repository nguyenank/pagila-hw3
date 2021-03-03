/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT
    first_name||' '||last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN (
SELECT
    film_id
FROM (
SELECT
    film_id,
    UNNEST(special_features) AS special_feature
FROM
    film) AS subquery
WHERE special_feature = 'Behind the Scenes') AS subquery
USING (film_id);
