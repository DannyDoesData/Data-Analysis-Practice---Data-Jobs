--- What are the top 10 highest paying remote Business Analyst and Data Analyst Jobs?


SELECT 
    job_id,
    job_title_short,
    b.name AS company_name,
    job_title,
    CASE
        WHEN job_location='Anywhere' THEN 'Remote'
        ELSE 'On-site'
        END AS job_location,    
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM 
    job_postings_fact a
LEFT JOIN company_dim b ON a.company_id=b.company_id
WHERE 
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;

----Interesting thing happens here: 
---If I run the code with WHERE clause with job_location = 'Remote' it will show no results.
---However, if I run code the code with WHERE caluse with job_location = 'Anywhere' it shows top ten
---Why?
---Because WHERE clause runs before the SELECT statement and CASE happens within SELECT
---Therefore, when WHERE is executed there are in fact no entries with job_location = 'Remote'

        