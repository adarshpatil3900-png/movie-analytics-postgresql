SELECT title, box_office
FROM movies
ORDER BY box_office DESC
LIMIT 10;

SELECT m.title, d.name
FROM movies m
JOIN directors d
ON m.director_id = d.director_id;