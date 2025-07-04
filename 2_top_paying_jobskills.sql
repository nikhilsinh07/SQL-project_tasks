/* what are the skills required for top paying-jobs?
- use top 10 highest paying jobs from query 1
-add specific skills required for those roles
- why? it provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salries
*/
with top_paying_jobs as(
SELECT
job_id,
job_title,
name as company_name,
salary_year_avg
from job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
where job_location='Anywhere' AND job_title_short = 'Data Analyst' AND salary_year_avg is not null
ORDER BY salary_year_avg DESC
limit 10)

select 
top_paying_jobs.*,
skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
ORDER by salary_year_avg;