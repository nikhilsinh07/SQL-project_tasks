select 
skills,
count(skills_job_dim.job_id) as Skill_demand
from job_postings_fact
INNER JOIN skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY Skill_demand desc
limit 5;