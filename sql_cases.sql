SELECT
    COUNT(job_id) as number_of_jobs,
    CASE
        WHEN job_location='Anywhere' then 'Remote'
        WHEN job_location='New York, NY' then 'Local'
        ELSE 'On-site'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short='Data Analyst'
GROUP BY
    location_category
ORDER BY 
    number_of_jobs DESC;