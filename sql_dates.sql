-- SELECT
--     job_title as title,
--     job_location as location,
--     job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as date_time, 
--     EXTRACT(MONTH FROM job_posted_date) AS date_month
-- FROM job_postings_fact
-- LIMIT 5


-- SELECT 
--     COUNT(job_id),
--     EXTRACT(MONTH FROM job_posted_date) as date_month
-- FROM 
--     job_postings_fact
-- GROUP BY 
--     date_month
-- ORDER BY 
--     COUNT(job_id) DESC;

