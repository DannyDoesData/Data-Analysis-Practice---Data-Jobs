
-- THIS IS SUBQUERY


-- SELECT *
-- FROM (
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date)=1

-- ) AS january_postings; 


-- THIS IS CTE 


-- WITH january_jobs as 
-- (
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date)=1

-- )

-- SELECT * FROM january_jobs

----Subquery practice

-- SELECT 
--     name AS company_name
-- FROM 
--     company_dim
-- WHERE company_id IN 
-- (   SELECT
--         company_id
--     FROM
--         job_postings_fact
--     WHERE
--         job_no_degree_mention = true 
-- )


------CTE practice 

WITH company_job_count AS (
SELECT
    company_id,
    COUNT(*) as job_count
FROM 
    job_postings_fact
GROUP BY 
    company_id
)

SELECT
    a.name as company_name,
    b.job_count
FROM 
    company_dim a 
LEFT JOIN 
    company_job_count b  ON a.company_id=b.company_id
ORDER BY 
    b.job_count DESC;