with average_salary as (
select 
skills_dim.skill_id,
skills_dim.skills,
avg(salary_year_avg) as Avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst' AND
salary_year_avg is not null
GROUP BY skills_dim.skill_id
limit 10), skills_demand as (
    select 
    skills_dim.skill_id,
    skills_dim.skills,
count(skills_job_dim.job_id) as Skill_demand_count
from job_postings_fact
INNER JOIN skills_job_dim on skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
where job_title_short = 'Data Analyst' AND
salary_year_avg is not null
GROUP BY skills_dim.skill_id
limit 10
)

select
skills_demand.skill_id,
skills_demand.skills,
skill_demand_count,
Avg_salary
from skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
order by skill_demand_count desc;