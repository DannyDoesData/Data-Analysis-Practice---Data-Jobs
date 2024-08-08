--- What are the most optimal skills to learn for Data and Business Analyst in the UK?
--- Aka High demand + High pay 

---Preparing the CTEs

WITH skills_demand AS 
(
    SELECT 
        b.skill_id,
        c.skills,
        COUNT(b.job_id) AS demand_count
    FROM job_postings_fact  a
    INNER JOIN skills_job_dim b ON a.job_id=b.job_id
    INNER JOIN skills_dim c ON b.skill_id=c.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'United Kingdom' AND
        salary_year_avg IS NOT NULL
    GROUP BY 
        c.skills, 
        b.skill_id

)
, average_salary AS
(
    SELECT 
        a.job_title_short,
        b.skill_id,
        c.skills,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM job_postings_fact  a
    INNER JOIN skills_job_dim b ON a.job_id=b.job_id
    INNER JOIN skills_dim c ON b.skill_id=c.skill_id
    WHERE
        job_location = 'United Kingdom' AND
        salary_year_avg IS NOT NULL
    GROUP BY 
        a.job_title_short,
        c.skills, 
        b.skill_id
)


 --- Data Analyst

-- SELECT 
--     skills_demand.skill_id,
--     skills_demand.skills,
--     skills_demand.demand_count,
--     average_salary.avg_salary
-- FROM skills_demand
-- INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
-- WHERE 
--     job_title_short = 'Data Analyst'
-- ORDER BY
--     skills_demand.demand_count DESC,
--     average_salary.avg_salary DESC
-- LIMIT 25

--- Business Analyst 

-- SELECT 
--     skills_demand.skill_id,
--     skills_demand.skills,
--     skills_demand.demand_count,
--     average_salary.avg_salary
-- FROM skills_demand
-- INNER JOIN average_salary ON skills_demand.skill_id=average_salary.skill_id
-- WHERE 
--     job_title_short = 'Business Analyst'
-- ORDER BY
--     skills_demand.demand_count DESC,
--     average_salary.avg_salary DESC
-- LIMIT 25


---- Simplified queries without CTE 

--Data Analyst UK

SELECT 
    c.skill_id,
    c.skills,
    COUNT(b.job_id) as demand_count,
    ROUND((AVG(a.salary_year_avg)),0) AS avg_salary
FROM job_postings_fact a
INNER JOIN skills_job_dim b on a.job_id=b.job_id
INNER JOIN skills_dim c on b.skill_id=c.skill_id
WHERE
    a.job_title_short = 'Data Analyst' AND
    a.salary_year_avg IS NOT NULL AND
    a.job_location = 'United Kingdom'
GROUP BY
    c.skill_id,
    c.skills
ORDER BY 
    demand_count DESC,
    avg_salary DESC 

--Business Analyst UK

SELECT 
    c.skill_id,
    c.skills,
    COUNT(b.job_id) as demand_count,
    ROUND((AVG(a.salary_year_avg)),0) AS avg_salary
FROM job_postings_fact a
INNER JOIN skills_job_dim b on a.job_id=b.job_id
INNER JOIN skills_dim c on b.skill_id=c.skill_id
WHERE
    a.job_title_short = 'Business Analyst' AND
    a.salary_year_avg IS NOT NULL AND
    a.job_location = 'United Kingdom'
GROUP BY
    c.skill_id,
    c.skills
ORDER BY 
    demand_count DESC,
    avg_salary DESC 
