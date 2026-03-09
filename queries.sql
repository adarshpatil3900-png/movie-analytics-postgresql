-- Movie Analytics SQL Queries
-- Basic and Advanced Queries for Database Analysis


-- 1. View all movies
SELECT * FROM movies;


-- 2. View all directors
SELECT * FROM directors;


-- 3. View all actors
SELECT * FROM actors;


-- 4. Movies released after 2020
SELECT title, release_year
FROM movies
WHERE release_year > 2020;


-- 5. Top 5 highest grossing movies
SELECT title, box_office
FROM movies
ORDER BY box_office DESC
LIMIT 5;


-- 6. Movies with budget greater than $100M
SELECT title, budget
FROM movies
WHERE budget > 100000000;


-- 7. Average movie budget
SELECT AVG(budget) AS average_budget
FROM movies;


-- 8. Total box office collection
SELECT SUM(box_office) AS total_box_office
FROM movies;


-- 9. Total number of movies
SELECT COUNT(*) AS total_movies
FROM movies;


-- 10. Movies with their directors
SELECT m.title, d.name AS director
FROM movies m
JOIN directors d
ON m.director_id = d.director_id;


-- 11. Movies directed by Christopher Nolan
SELECT m.title, m.release_year
FROM movies m
JOIN directors d
ON m.director_id = d.director_id
WHERE d.name = 'Christopher Nolan';


-- 12. Movies with their actors
SELECT m.title, a.name AS actor
FROM movies m
JOIN movie_cast mc ON m.movie_id = mc.movie_id
JOIN actors a ON mc.actor_id = a.actor_id;


-- 13. Number of movies per director
SELECT d.name, COUNT(m.movie_id) AS movie_count
FROM directors d
JOIN movies m
ON d.director_id = m.director_id
GROUP BY d.name;


-- 14. Highest budget movie
SELECT title, budget
FROM movies
ORDER BY budget DESC
LIMIT 1;


-- 15. Movies released between 2015 and 2023
SELECT title, release_year
FROM movies
WHERE release_year BETWEEN 2015 AND 2023;


-- 16. Profit of each movie
SELECT title, (box_office - budget) AS profit
FROM movies
ORDER BY profit DESC;


-- 17. Average box office per director
SELECT d.name, AVG(m.box_office) AS avg_box_office
FROM directors d
JOIN movies m
ON d.director_id = m.director_id
GROUP BY d.name
ORDER BY avg_box_office DESC;


-- 18. Actor who appeared in the most movies
SELECT a.name, COUNT(mc.movie_id) AS movie_count
FROM actors a
JOIN movie_cast mc
ON a.actor_id = mc.actor_id
GROUP BY a.name
ORDER BY movie_count DESC
LIMIT 1;


-- 19. Movies that made more than double their budget
SELECT title, budget, box_office
FROM movies
WHERE box_office > budget * 2;


-- 20. Rank movies by box office collection
SELECT title, box_office,
RANK() OVER (ORDER BY box_office DESC) AS box_office_rank
FROM movies;