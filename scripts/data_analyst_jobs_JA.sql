-- 1. 1793--
SELECT COUNT(*) 
FROM data_analyst_jobs;

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

SELECT location AS state,
	ROUND(AVG(star_rating), 2) AS avg_rating
	FROM data_analyst_jobs
	WHERE location IS NOT NULL
	AND star_rating IS NOT NULL
	GROUP BY state
	ORDER BY avg_rating DESC;

-- 7. 881 --
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- 8. 230 --
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9. 41 --

SELECT company, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE (star_rating IS NOT NULL AND company IS NOT NULL AND review_count > 5000)
GROUP BY company;

select distinct count (company), round(AVG(star_rating),2)
from data_analyst_jobs
where review_count >5000
and company IS NOT NULL AND star_rating IS NOT NULL;


SELECT company, round(avg(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

select company, sum(review_count) as total_reviews, avg(star_rating) as avg_rating
 from data_analyst_jobs 
 group by company
 having sum(review_count)>5000


-- 10. General Motors, Unilever, Microsoft, NIKE,American Express, Kaiser 4.2 --
SELECT company, avg(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

SELECT DISTINCT (company), 
	AVG(star_rating) AS avg_star, 
	SUM(review_count)AS sum_review
FROM data_analyst_jobs
WHERE company IS NOT NULL
	AND star_rating IS NOT NULL
GROUP BY company
HAVING SUM(review_count)>5000
ORDER BY avg_star DESC;



-- 11. 754 --
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE lower(title) LIKE '%analyst%';

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

SELECT domain,COUNT(title) AS jobs
FROM data_analyst_jobs
WHERE LOWER(skill) LIKE LOWER('%SQL%') 
	AND days_since_posting > 21 
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY jobs DESC;

SELECT domain, COUNT(domain)
FROM data_analyst_jobs 
WHERE (domain IS NOT NULL
	   AND skill = 'SQL'
	   AND days_since_posting > 21)
GROUP BY domain
ORDER BY count DESC LIMIT 4;


SELECT title, 
	domain, 
	days_since_posting,
	COUNT(days_since_posting) OVER(PARTITION BY domain) AS hard_to_fill
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL 
ORDER BY hard_to_fill DESC;



SELECT *
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%' AND days_since_posting > 21 AND domain <> '[null]';