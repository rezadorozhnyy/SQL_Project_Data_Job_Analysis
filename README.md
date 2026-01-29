# Introduction
Dive into the data job market as it was in 2023! Focusing on data scientist roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data science.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data science job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills to find optimal jobs.

Data hails from [SQL for Data Analytics](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

## Questions for this project:

1. What are the top-paying data scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data science?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For this deep dive into the data science job market as it was in 2023, I harnessed several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.

- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.

- **Visual Studio Code:** My go-to for database management and executing SQL queries.

- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring project tracking.

# Analysis
Each query for this project aimed at investigating specific aspects of the data science job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data scientist positions by average yearly salary. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

# What I Learned
# Conclusions