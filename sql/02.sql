/*
 * Count the number of movies that contain each type of special feature.
 */
SELECT
    special_features,
    COUNT(special_features)
FROM (
SELECT
    title,
    UNNEST(special_features) AS special_features
FROM film) AS subquery
GROUP BY special_features
ORDER BY special_features;
