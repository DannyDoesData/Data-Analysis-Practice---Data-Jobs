--What are the top Data and Business Analyst skills based on salary in the UK?

--Data Analyst 

SELECT 
    c.skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact  a
INNER JOIN skills_job_dim b ON a.job_id=b.job_id
INNER JOIN skills_dim c ON b.skill_id=c.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    c.skills
ORDER BY
    avg_salary DESC
LIMIT 25

-- Summary:

-- Specialized Technical Skills Command Premium Salaries: Expertise in niche tools like Shell, Flow, Looker, and SAS leads to the highest earnings, reflecting the value placed on specialized technical knowledge in scripting, automation, and advanced data analysis.

-- Programming and Cloud Expertise are Highly Valued: Skills in programming languages (e.g., Express, Go, Python) and cloud platforms (e.g., Azure, Databricks) significantly boost earning potential, emphasizing the importance of development and cloud processing capabilities.

-- Foundational Tools Remain Important but Less Lucrative: While essential tools like SQL, Excel, and Tableau are foundational for data analysts, they typically offer lower salaries compared to more specialized or niche skills due to their broad application and generalist nature.



--Business Analyst

SELECT 
    c.skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact  a
INNER JOIN skills_job_dim b ON a.job_id=b.job_id
INNER JOIN skills_dim c ON b.skill_id=c.skill_id
WHERE
    job_title_short = 'Business Analyst' AND
    job_location = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    c.skills
ORDER BY
    avg_salary DESC
LIMIT 25

-- Summary :

-- Integration Tools Command Top Salaries: Proficiency in SSIS (SQL Server Integration Services) leads the list with the highest average salary, highlighting the value of expertise in data integration and ETL processes for Business Analysts.

-- Data Analytics and Visualization Skills are Equally Valued: Skills in tools like Alteryx, Power BI, Qlik, SQL, and Tableau are all highly valued, each offering the same competitive average salary. This indicates that a strong foundation in data analytics and visualization is crucial for maximizing earning potential in this field.

-- Versatility in Data Tools Enhances Market Value: Business Analysts who are versatile in multiple analytics and visualization platforms, such as Power BI, Tableau, and SQL, are well-positioned to command competitive salaries across various roles and industries.