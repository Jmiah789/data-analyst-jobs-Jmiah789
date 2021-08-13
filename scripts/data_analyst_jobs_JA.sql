-- 1. 1793--
select count(*) 
from data_analyst_jobs;

-- 2. ExxonMobil --
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 3. 21, 27 --
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

-- 4. 3 --
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

-- 5. 151 --
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 6. NE --
SELECT location AS state, avg(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY data_analyst_jobs.location
ORDER BY avg_rating DESC;

-- 7. 881 --
SELECT DISTINCT title
FROM data_analyst_jobs;

-- 8. 230 --
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9. 41 --
SELECT company, avg(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

-- 10. General Motors, 4.2 --
SELECT company, avg(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

-- 11. 754 --
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

-- 12. 4, Tableau --
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE '%analyst%' AND LOWER(title) NOT LIKE '%analytics%';

-- BONUS Internet and Software 62, Banks and Financial Services 61, Consulting and Business Services 57, Health Care 52 --

SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND days_since_posting > 21 AND domain <> '[null]'
GROUP BY domain
ORDER BY COUNT(title) DESC;


SELECT *
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND days_since_posting > 21 AND domain <> '[null]';