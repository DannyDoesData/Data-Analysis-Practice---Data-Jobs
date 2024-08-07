WITH first_quart AS (
SELECT 
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
FROM 
    january_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
FROM 
    february_jobs

UNION

SELECT 
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
FROM 
    march_jobs
)

SELECT *
FROM first_quart
WHERE salary_year_avg > 70000
ORDER BY salary_year_avg DESC;