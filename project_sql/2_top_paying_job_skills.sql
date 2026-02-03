/*
Question: What skills are required for the top-paying data scientist jobs?
- Use the top 10 highest-paying Data Scientist jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain sills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*

RESULTS JSON

[
  {
    "job_id": 177779,
    "job_title": "Data Scientist",
    "salary_year_avg": "960000.0",
    "company_name": "East River Electric Power Cooperative, Inc.",
    "skills": "python"
  },
  {
    "job_id": 177779,
    "job_title": "Data Scientist",
    "salary_year_avg": "960000.0",
    "company_name": "East River Electric Power Cooperative, Inc.",
    "skills": "java"
  },
  {
    "job_id": 177779,
    "job_title": "Data Scientist",
    "salary_year_avg": "960000.0",
    "company_name": "East River Electric Power Cooperative, Inc.",
    "skills": "r"
  },
  {
    "job_id": 177779,
    "job_title": "Data Scientist",
    "salary_year_avg": "960000.0",
    "company_name": "East River Electric Power Cooperative, Inc.",
    "skills": "c++"
  },
  {
    "job_id": 551617,
    "job_title": "Geographic Information Systems Analyst - GIS Analyst",
    "salary_year_avg": "585000.0",
    "company_name": "ReServe",
    "skills": "excel"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "company_name": "Selby Jennings",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "company_name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 1455311,
    "job_title": "Data Scientist (L5) - Member Product",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "sql"
  },
  {
    "job_id": 1455311,
    "job_title": "Data Scientist (L5) - Member Product",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "python"
  },
  {
    "job_id": 1455311,
    "job_title": "Data Scientist (L5) - Member Product",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "r"
  },
  {
    "job_id": 1300865,
    "job_title": "Data Scientist (L5) - Messaging",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "sql"
  },
  {
    "job_id": 1300865,
    "job_title": "Data Scientist (L5) - Messaging",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "python"
  },
  {
    "job_id": 1300865,
    "job_title": "Data Scientist (L5) - Messaging",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "r"
  },
  {
    "job_id": 1300865,
    "job_title": "Data Scientist (L5) - Messaging",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "spark"
  },
  {
    "job_id": 1300865,
    "job_title": "Data Scientist (L5) - Messaging",
    "salary_year_avg": "450000.0",
    "company_name": "Netflix",
    "skills": "excel"
  },
  {
    "job_id": 727439,
    "job_title": "Director Data Science",
    "salary_year_avg": "375000.0",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "skills": "sql"
  },
  {
    "job_id": 727439,
    "job_title": "Director Data Science",
    "salary_year_avg": "375000.0",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "skills": "python"
  },
  {
    "job_id": 727439,
    "job_title": "Director Data Science",
    "salary_year_avg": "375000.0",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "skills": "r"
  },
  {
    "job_id": 727439,
    "job_title": "Director Data Science",
    "salary_year_avg": "375000.0",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "skills": "aws"
  },
  {
    "job_id": 727439,
    "job_title": "Director Data Science",
    "salary_year_avg": "375000.0",
    "company_name": "Blue Cross and Blue Shield of Minnesota",
    "skills": "spark"
  },
  {
    "job_id": 1100370,
    "job_title": "Data Science Director, Adoption & Enterprise",
    "salary_year_avg": "375000.0",
    "company_name": "Asana",
    "skills": "python"
  },
  {
    "job_id": 1100370,
    "job_title": "Data Science Director, Adoption & Enterprise",
    "salary_year_avg": "375000.0",
    "company_name": "Asana",
    "skills": "scala"
  },
  {
    "job_id": 1100370,
    "job_title": "Data Science Director, Adoption & Enterprise",
    "salary_year_avg": "375000.0",
    "company_name": "Asana",
    "skills": "r"
  },
  {
    "job_id": 1100370,
    "job_title": "Data Science Director, Adoption & Enterprise",
    "salary_year_avg": "375000.0",
    "company_name": "Asana",
    "skills": "asana"
  },
  {
    "job_id": 1284983,
    "job_title": "Director Data Science, AI Infra",
    "salary_year_avg": "375000.0",
    "company_name": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 1284983,
    "job_title": "Director Data Science, AI Infra",
    "salary_year_avg": "375000.0",
    "company_name": "Meta",
    "skills": "python"
  },
  {
    "job_id": 1284983,
    "job_title": "Director Data Science, AI Infra",
    "salary_year_avg": "375000.0",
    "company_name": "Meta",
    "skills": "r"
  },
  {
    "job_id": 1284983,
    "job_title": "Director Data Science, AI Infra",
    "salary_year_avg": "375000.0",
    "company_name": "Meta",
    "skills": "sas"
  },
  {
    "job_id": 1284983,
    "job_title": "Director Data Science, AI Infra",
    "salary_year_avg": "375000.0",
    "company_name": "Meta",
    "skills": "sas"
  }
]

*/