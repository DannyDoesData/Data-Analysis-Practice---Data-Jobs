---What skills are required for these top-paying roels? 

WITH top_paying_jobs_uk AS (
    SELECT 
        job_id,
        job_title_short,
        b.name AS company_name,
        job_title,
        salary_year_avg
    FROM 
        job_postings_fact a
    LEFT JOIN company_dim b ON a.company_id=b.company_id
    WHERE 
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
        job_location = 'United Kingdom' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    a.*,
    c.skills

FROM top_paying_jobs_uk a
INNER JOIN skills_job_dim b ON a.job_id=b.job_id
INNER JOIN skills_dim c ON b.skill_id=c.skill_id
ORDER BY 
    a.salary_year_avg DESC;



-- The top skills mentioned in the dataset are:

-- 1.Excel (5 mentions)
-- 2.Python (5 mentions)
-- 3.Tableau (3 mentions)
-- 4.SQL (3 mentions)
-- 5.R (2 mentions)
-- 6.Power BI (2 mentions)
-- 7.SAS (2 mentions)
-- 8.Jupyter (2 mentions)
-- 9.Other skills mentioned include Flow, Looker, Shell, Go, Git, Unify, Express, Azure, Databricks, SAP, Typescript, and VBA, each appearing once.

-- [
--   {
--     "job_id": 1401033,
--     "job_title_short": "Data Analyst",
--     "company_name": "Deutsche Bank",
--     "job_title": "Market Data Lead Analyst",
--     "salary_year_avg": "180000.0",
--     "skills": "excel"
--   },
--   {
--     "job_id": 1813715,
--     "job_title_short": "Data Analyst",
--     "company_name": "Shell",
--     "job_title": "Data Architect - Trading and Supply",
--     "salary_year_avg": "156500.0",
--     "skills": "shell"
--   },
--   {
--     "job_id": 1813715,
--     "job_title_short": "Data Analyst",
--     "company_name": "Shell",
--     "job_title": "Data Architect - Trading and Supply",
--     "salary_year_avg": "156500.0",
--     "skills": "express"
--   },
--   {
--     "job_id": 1813715,
--     "job_title_short": "Data Analyst",
--     "company_name": "Shell",
--     "job_title": "Data Architect - Trading and Supply",
--     "salary_year_avg": "156500.0",
--     "skills": "excel"
--   },
--   {
--     "job_id": 1813715,
--     "job_title_short": "Data Analyst",
--     "company_name": "Shell",
--     "job_title": "Data Architect - Trading and Supply",
--     "salary_year_avg": "156500.0",
--     "skills": "flow"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "sql"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "python"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "jupyter"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "tableau"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "power bi"
--   },
--   {
--     "job_id": 694461,
--     "job_title_short": "Data Analyst",
--     "company_name": "Hasbro",
--     "job_title": "Sr Data Analyst",
--     "salary_year_avg": "118140.0",
--     "skills": "looker"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "sql"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "python"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "sas"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "excel"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "tableau"
--   },
--   {
--     "job_id": 377642,
--     "job_title_short": "Data Analyst",
--     "company_name": "esure Group",
--     "job_title": "Fraud Data Analyst",
--     "salary_year_avg": "109000.0",
--     "skills": "sas"
--   },
--   {
--     "job_id": 1315562,
--     "job_title_short": "Data Analyst",
--     "company_name": "Syngenta Group",
--     "job_title": "Project Data Analyst - Operational Excellence",
--     "salary_year_avg": "105000.0",
--     "skills": "tableau"
--   },
--   {
--     "job_id": 150907,
--     "job_title_short": "Data Analyst",
--     "company_name": "Flagship Pioneering, Inc.",
--     "job_title": "Senior Scientist, Computational Biology",
--     "salary_year_avg": "89100.0",
--     "skills": "python"
--   },
--   {
--     "job_id": 150907,
--     "job_title_short": "Data Analyst",
--     "company_name": "Flagship Pioneering, Inc.",
--     "job_title": "Senior Scientist, Computational Biology",
--     "salary_year_avg": "89100.0",
--     "skills": "go"
--   },
--   {
--     "job_id": 150907,
--     "job_title_short": "Data Analyst",
--     "company_name": "Flagship Pioneering, Inc.",
--     "job_title": "Senior Scientist, Computational Biology",
--     "salary_year_avg": "89100.0",
--     "skills": "jupyter"
--   },
--   {
--     "job_id": 150907,
--     "job_title_short": "Data Analyst",
--     "company_name": "Flagship Pioneering, Inc.",
--     "job_title": "Senior Scientist, Computational Biology",
--     "salary_year_avg": "89100.0",
--     "skills": "git"
--   },
--   {
--     "job_id": 150907,
--     "job_title_short": "Data Analyst",
--     "company_name": "Flagship Pioneering, Inc.",
--     "job_title": "Senior Scientist, Computational Biology",
--     "salary_year_avg": "89100.0",
--     "skills": "unify"
--   },
--   {
--     "job_id": 985232,
--     "job_title_short": "Data Analyst",
--     "company_name": "Campari Group",
--     "job_title": "Global IT Data Analytics Solutions Expert",
--     "salary_year_avg": "86400.0",
--     "skills": "python"
--   },
--   {
--     "job_id": 985232,
--     "job_title_short": "Data Analyst",
--     "company_name": "Campari Group",
--     "job_title": "Global IT Data Analytics Solutions Expert",
--     "salary_year_avg": "86400.0",
--     "skills": "r"
--   },
--   {
--     "job_id": 985232,
--     "job_title_short": "Data Analyst",
--     "company_name": "Campari Group",
--     "job_title": "Global IT Data Analytics Solutions Expert",
--     "salary_year_avg": "86400.0",
--     "skills": "azure"
--   },
--   {
--     "job_id": 985232,
--     "job_title_short": "Data Analyst",
--     "company_name": "Campari Group",
--     "job_title": "Global IT Data Analytics Solutions Expert",
--     "salary_year_avg": "86400.0",
--     "skills": "databricks"
--   },
--   {
--     "job_id": 985232,
--     "job_title_short": "Data Analyst",
--     "company_name": "Campari Group",
--     "job_title": "Global IT Data Analytics Solutions Expert",
--     "salary_year_avg": "86400.0",
--     "skills": "sap"
--   },
--   {
--     "job_id": 227038,
--     "job_title_short": "Data Analyst",
--     "company_name": "Nominet",
--     "job_title": "Data Analyst",
--     "salary_year_avg": "77017.5",
--     "skills": "sql"
--   },
--   {
--     "job_id": 227038,
--     "job_title_short": "Data Analyst",
--     "company_name": "Nominet",
--     "job_title": "Data Analyst",
--     "salary_year_avg": "77017.5",
--     "skills": "python"
--   },
--   {
--     "job_id": 227038,
--     "job_title_short": "Data Analyst",
--     "company_name": "Nominet",
--     "job_title": "Data Analyst",
--     "salary_year_avg": "77017.5",
--     "skills": "r"
--   },
--   {
--     "job_id": 1059513,
--     "job_title_short": "Data Analyst",
--     "company_name": "Informa Group Plc.",
--     "job_title": "Data Analyst - Customer Services",
--     "salary_year_avg": "75550.0",
--     "skills": "typescript"
--   },
--   {
--     "job_id": 1059513,
--     "job_title_short": "Data Analyst",
--     "company_name": "Informa Group Plc.",
--     "job_title": "Data Analyst - Customer Services",
--     "salary_year_avg": "75550.0",
--     "skills": "vba"
--   },
--   {
--     "job_id": 1059513,
--     "job_title_short": "Data Analyst",
--     "company_name": "Informa Group Plc.",
--     "job_title": "Data Analyst - Customer Services",
--     "salary_year_avg": "75550.0",
--     "skills": "excel"
--   },
--   {
--     "job_id": 1059513,
--     "job_title_short": "Data Analyst",
--     "company_name": "Informa Group Plc.",
--     "job_title": "Data Analyst - Customer Services",
--     "salary_year_avg": "75550.0",
--     "skills": "power bi"
--   },
--   {
--     "job_id": 1059513,
--     "job_title_short": "Data Analyst",
--     "company_name": "Informa Group Plc.",
--     "job_title": "Data Analyst - Customer Services",
--     "salary_year_avg": "75550.0",
--     "skills": "notion"
--   },
--   {
--     "job_id": 453109,
--     "job_title_short": "Data Analyst",
--     "company_name": "CHANEL",
--     "job_title": "Global Mobility Data Analyst",
--     "salary_year_avg": "75067.5",
--     "skills": "excel"
--   }
-- ]
