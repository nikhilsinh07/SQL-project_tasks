select 
skills,
avg(salary_year_avg) as Avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst' AND
salary_year_avg is not null
GROUP BY skills
ORDER BY Avg_salary DESC
limit 10;