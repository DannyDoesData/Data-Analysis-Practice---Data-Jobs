# Introduction

📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/SQL%20Practice%20Project%20Data%20Jobs/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' journey of learning and landing a decent job in the current market

This project sources inspiration and most importantly the data to work with from famous DataNerd Luke Barousse.

**Go check out his youtube channel if you are interested in Data [Youtube](https://www.youtube.com/@LukeBarousse)**

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data & business analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data & business analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst and business analyst positions in the UK job market market. Here’s how I approached each question:

### 1. Top Paying Data & Business analyst Jobs
To identify the highest-paying roles, I filtered data analyst and business analyst positions by average yearly salary and location, focusing on the jobs within the UK. This query highlights the highest-paying opportunities in the field.

```sql
SELECT 
    job_id,
    job_title_short,
    b.name AS company_name,
    job_title,
    CASE
        WHEN job_location='Unite Kingdom' THEN 'UK'
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
    job_location = 'United Kingdom' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;

----Interesting thing happens here: 
---If I run the code with WHERE clause with job_location = 'UK' it will show no results.
---However, if I run code the code with WHERE caluse with job_location = 'United Kingdom' it shows the results.
---Why?
---Because WHERE clause runs before the SELECT statement and CASE happens within SELECT
---Therefore, when WHERE is executed there are in fact no entries with job_location = 'UK'
```

### Here's the breakdown of the top data analyst jobs in 2023:

**Top Salary:** Deutsche Bank offers the highest-paying role at £180,000, significantly above the average for similar positions.

**Salary Range:** The salaries for data analyst roles range from £75,000 to £180,000, with most positions being full-time and on-site, indicating a wide range of compensation levels in the field.

**Industry Focus:** Financial institutions and tech-driven companies dominate the list of top-paying data analyst roles, highlighting the demand for data analysis expertise in these sectors.


![Top Paying Roles](/q1.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts & business analysts within the UK. Unfortunaly no Business Analyst positions made it to top 10 :( ; 

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql

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

```
### Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst & business analyst jobs in 2023:

**Excel and Python** are the most commonly sought-after skills, highlighting their importance in data analysis and related roles.

**Tableau and SQL** are also frequently required, indicating a strong demand for skills in data visualization and database management.

**Power BI and SAS** show a significant need for expertise in business intelligence and statistical analysis tools.

**Jupyter** suggests that skills in interactive computing environments are valued.

There is a diverse range of additional skills mentioned, pointing to the varied technical requirements across different job roles.

However, the data for the UK job market was quite limited within this dataset. Looking at global results the top skills are:

1. SQL
2. Python
3. Tableau

![Top Paying Skills](/q2.png)
*Bar graph visualizing the highest paying skills for the top 10 paying jobs for data analysts (Since BAs did not make it to the top 10);


### 3. In-Demand Skills for Data & Business Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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

 
```
### Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- **Programming** and **Visualization Tools** like **Python**, **Tableau**, and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| Skills   | Demand Count |
|----------|--------------|     
| SQL      | 867          |
| Excel    | 776          |
| Power BI | 557          |
| Python   | 455          |
| Tableau  | 361          |

*Table of the demand for the top 5 skills in data analyst job postings within the UK*




| Skills   | Demand Count |
|----------|--------------|     
| SQL      | 84           |
| Excel    | 63           |
| Power BI | 50           |
| SAS      | 40           |
| Python   | 31           |

*Table of the demand for the top 5 skills in business analyst job postings within the UK*

***Interesting note***

The top 3 in-demand skills for UK Business and Data Analysts were the same in 2023.
Therefore, learning and practising these essentials can open multiple doors in the UK job market



### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

**For Data Analyst**
```sql
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
```
### Here's a breakdown of the results for top paying skills for Data Analysts:

**Specialized Technical Skills Command Premium Salaries**: Expertise in niche tools like Shell, Flow, Looker, and SAS leads to the highest earnings, reflecting the value placed on specialized technical knowledge in scripting, automation, and advanced data analysis.

**Programming and Cloud Expertise are Highly Valued**: Skills in programming languages (e.g., Express, Go, Python) and cloud platforms (e.g., Azure, Databricks) significantly boost earning potential, emphasizing the importance of development and cloud processing capabilities.

**Foundational Tools Remain Important but Less Lucrative**: While essential tools like SQL, Excel, and Tableau are foundational for data analysts, they typically offer lower salaries compared to more specialized or niche skills due to their broad application and generalist nature.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| shell	        |  156500            |
| flow	        |  156500            |
| looker	    |  118140            |
| sas	        |  109000            |
| express	    |  104757            |
| jupyter	    |  103620            |   
| unify	        |  89100             |
| git	        |  89100             |   
| sap	        |  86400             |
| azure	        |  86400             |


*Table of the average salary for the top 10 paying skills for data analysts in the UK job market*


**For Business Analyst**


```sql
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
```

### Here's a breakdown of the results for top paying skills for Business Analysts:

**Integration Tools Command Top Salaries**: Proficiency in SSIS (SQL Server Integration Services) leads the list with the highest average salary, highlighting the value of expertise in data integration and ETL processes for Business Analysts.

**Data Analytics and Visualization Skills are Equally Valued**: Skills in tools like Alteryx, Power BI, Qlik, SQL, and Tableau are all highly valued, each offering the same competitive average salary. This indicates that a strong foundation in data analytics and visualization is crucial for maximizing earning potential in this field.

**Versatility in Data Tools Enhances Market Value** Business Analysts who are versatile in multiple analytics and visualization platforms, such as Power BI, Tableau, and SQL, are well-positioned to command competitive salaries across various roles and industries.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| ssis	        |  73500             |
| alteryx	    |  57600             |
| power bi	    |  57600             |
| qlik	        |  57600             |
| sql	        |  57600             |
| tableau	    |  10357600620       |   

*Table of the average salary for the top 6 (since data for BAs is rather limited) paying skills for business analysts in the UK job market*




### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

**For Data Analyst**
```sql
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

```

| Skill ID | Skills     | Demand Count | Average Salary ($) |
|----------|------------|--------------|-------------------:|
| 8        | Excel      | 11           |            82492   |
| 234      | python     | 8            |            83968   |
| 97       | sql        | 8            |            65818   |
| 80       | tableau    | 5            |            78428   |
| 74       | power bi   | 3            |            74563   |


*Table of the most optimal skills for data analyst sorted by demand and salary*


### Here's a breakdown of the most optimal skills for Data Analysts in 2023: 

**Excel and Python Lead in Demand**: Excel is the most in-demand skill with 11 mentions, followed by Python and SQL with 8 mentions each. This indicates that these skills are critical for data analysts.

**Python Offers the Highest Average Salary:** While Excel is the most in-demand skill, Python offers a slightly higher average salary of $83,968, indicating that expertise in Python may be more valued monetarily compared to other skills on the list.

**Data Visualization Tools are Valued:** Tableau and Power BI, both popular data visualization tools, are also in demand, with Tableau offering a higher average salary ($78,428) compared to Power BI ($74,563). This suggests that proficiency in these tools can enhance a data analyst's earning potential.

**For Business Analyst**

```sql

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
```
| Skill ID | Skills     | Average Salary ($) |
|----------|------------|-------------------:|
| 8        | ssis       |           73500    |
| 234      | sql        |           57600    |
| 97       | tableau    |           57600    |
| 80       | power bi   |           57600    |
| 74       | qlik       |           57600    |

*Table of the most optimal skills for business analyst sorted by demand and salary*

### Here's a breakdown of the most optimal skills for Data Analysts in 2023: 

**SSIS Commands the Highest Salary**: Among the listed skills, SSIS (SQL Server Integration Services) offers the highest average salary at $73,500, indicating that expertise in this skill is particularly valued in the market.

**Equal Valuation for Other Skills**: SQL, Tableau, Power BI, and Qlik all have the same average salary of $57,600, suggesting that these skills are similarly valued by employers, with no distinct salary advantage among them.

**Focus on ETL and BI Tools**: The prominence of SSIS (an ETL tool) and business intelligence tools like Tableau, Power BI, and Qlik in the list underscores the importance of data integration and visualization skills for business analysts in today's job market.

# What I Learned

Throughout this adventure, I've practiced my SQL toolkit with various challenges:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level CTE maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

**Top-Paying Data Analyst Jobs**: The highest-paying data analyst roles are primarily offered by financial institutions and tech-driven companies, with salaries ranging significantly, from around $75,000 to $180,000 annually. Notably, Deutsche Bank offers the top salary at $180,000, making it a standout employer in the field.

**Most Sought-After Skills for Top Salaries**: Excel and Python are the most demanded skills for top-paying data analyst roles. Python, in particular, is associated with a higher average salary compared to Excel, underscoring its critical role in high-paying positions.

**In-Demand Skills**: SQL and Excel are the most in-demand skills across the data and business analyst job market in the UK. Their foundational role in data processing and analysis makes them essential for securing a job in this field. However, tools like Tableau and Power BI are also increasingly important, particularly in roles that emphasize data visualization.

**Specialized Skills Command Higher Salaries**: While general skills like SQL and Excel are in high demand, specialized skills such as SSIS, SAS, and Shell command higher salaries. This highlights the value of niche expertise in increasing earning potential.

**Optimal Skills for Job Market Success**: For data and business analysts, Python, Tableau, and Power BI are identified as optimal skills to learn due to their balance of demand and salary potential. In contrast, business analysts should focus on mastering SSIS and business intelligence tools like Power BI and Qlik to enhance their market value.their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data and business analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
