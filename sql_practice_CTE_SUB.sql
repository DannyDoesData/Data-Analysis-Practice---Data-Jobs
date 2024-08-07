---PROBLEM: FIND THE TOP SKILLS FOR THE REMOTE JOBS

WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) as skill_count
    FROM 
        skills_job_dim a
    INNER JOIN 
        job_postings_fact b on a.job_id=b.job_id
    WHERE
        b.job_work_from_home = TRUE AND
        b.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
    LIMIT 1000
)

SELECT
    b.skill_id,
    a.skills as skill_name,
    b.skill_count
FROM 
    skills_dim a
INNER JOIN 
    remote_job_skills b on a.skill_id=b.skill_id
GROUP BY
    b.skill_id,
    skill_name,
    b.skill_count
ORDER BY b.skill_count DESC
LIMIT 5;