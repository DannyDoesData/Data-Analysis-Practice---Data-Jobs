--Whar are most in-demand skills for Data and Business Analyst?

---Most in-demand skills for Data Analyst

SELECT 
    c.skills,
    COUNT(b.job_id) AS demand_count
FROM job_postings_fact  a
INNER JOIN skills_job_dim b ON a.job_id=b.job_id
INNER JOIN skills_dim c ON b.skill_id=c.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'United Kingdom'
GROUP BY 
    c.skills
ORDER BY
    demand_count DESC
LIMIT 5

-- The top 5 in-demand skills for UK Data Analyst in 2023 were:
-- 1. SQL
-- 2. Excel
-- 3. Power BI
-- 4. Python
-- 5. Tableau

---Most in-demand skills for Business Analyst

SELECT 
    c.skills,
    COUNT(b.job_id) AS demand_count
FROM job_postings_fact  a
INNER JOIN skills_job_dim b ON a.job_id=b.job_id
INNER JOIN skills_dim c ON b.skill_id=c.skill_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'United Kingdom'
GROUP BY 
    c.skills
ORDER BY
    demand_count DESC
LIMIT 5

-- The top 5 in-demand skills for UK Business Analyst in 2023 were:
-- 1. SQL
-- 2. Excel
-- 3. Power BI
-- 4. SAS
-- 5. Python

--The top 3 in-demand skills for UK Business and Data Analysts were the same in 2023. Python is valued a tad bit less, dropping from 4th to 5th place 
--SAS technology seems to be much more relevant than Tableau replacing it at 4th place. 