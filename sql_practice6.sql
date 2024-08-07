-- CREATE TABLE january_jobs as 
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date)=1;

-- CREATE TABLE february_jobs as 
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date)=2;


-- CREATE TABLE march_jobs as 
--     SELECT *
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date)=3;

-- SELECT 
--     job_posted_date
-- FROM
--     march_jobs
-- LIMIT 10 