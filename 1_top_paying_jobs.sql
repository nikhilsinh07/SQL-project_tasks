/* question_ what are the top paying data analytics jobs?
1)identify the top 10 highest paying data analytics roles, remotely
2) focuses on job postings with specified salaries
3) why? highlight the top paying opportunities for data analytic, offering insight into em
*/
SELECT
job_id,
job_title,
name as company_name,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date
from job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id
where job_location='Anywhere' AND job_title_short = 'Data Analyst' AND salary_year_avg is not null
ORDER BY salary_year_avg DESC
limit 10;
