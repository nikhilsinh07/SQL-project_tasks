CREATE DATABASE db_course_conversions

CREATE TABLE student_engagement (
  student_id int DEFAULT NULL,
  date_watched date DEFAULT NULL
) 
select *
from student_purchases

CREATE TABLE student_info (
  student_id int NOT NULL,
  date_registered date DEFAULT NULL,
  PRIMARY KEY (student_id)
)

with student_data as(
select 
student_engagement.student_id,
student_info.date_registered,
student_engagement.date_watched as first_date_watched,
student_purchases.date_purchased as first_date_purchased,
(student_engagement.date_watched - student_info.date_registered) AS date_diff_reg_watch,
(student_purchases.date_purchased - student_info.date_registered ) AS date_diff_watch_purch
from student_engagement
left join student_info on student_info.student_id = student_engagement.student_id
left join student_purchases on student_purchases.student_id = student_engagement.student_id
)
--task3---
select
sum(date_diff_reg_watch) as reg_watch_sum,
count(date_diff_reg_watch) as reg_watch_count,
sum(date_diff_reg_watch)/count(date_diff_reg_watch) as av_reg_watch,
sum(date_diff_watch_purch) as watch_purch_sum,
count(date_diff_watch_purch) as watch_purch_count,
sum(date_diff_watch_purch)/count(date_diff_watch_purch) as av_watch_purch
from student_data


--Task 2--

SELECT 
  COUNT(*) filter(WHERE 
  first_date_purchased IS NOT NULL
  AND first_date_purchased >= first_date_watched)AS students_purchased_after_or_on_watch_day,
   COUNT(distinct student_id) FILTER (
    WHERE first_date_watched IS NOT NULL
  ) AS students_who_watched_lecture,
  100*(( COUNT(*) filter(WHERE 
  first_date_purchased IS NOT NULL
  AND first_date_purchased >= first_date_watched))/ COUNT(distinct student_id) FILTER (
    WHERE first_date_watched IS NOT NULL
  ) )as convertion_rate
FROM student_data
