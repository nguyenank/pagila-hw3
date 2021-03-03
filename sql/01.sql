/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */

SELECT
   title
FROM (
    SELECT
        title,
        UNNEST(special_features) AS special_feature
    FROM film
    WHERE rating = 'G') as subquery
WHERE special_feature = 'Trailers'
ORDER BY title DESC
;
