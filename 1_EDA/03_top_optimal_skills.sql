/*
Question: What are the most optimal skills for Data Engineers—balancing both demand and salary?

- Create a ranking score that combines median salary and skill demand.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Exclude skills with fewer than 100 job postings to improve reliability.

Why?
- This analysis identifies skills that provide the best balance between high compensation and strong market demand.
- Applying the natural logarithm (LN) to demand reduces the influence of extremely common skills, preventing demand alone from dominating the ranking while still rewarding widely requested skills.
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(*) AS demand_count,
    ROUND(LN(COUNT(*)), 2) AS ln_demand,
    ROUND(MEDIAN(jpf.salary_year_avg) * LN(COUNT(*)) / 1000000, 2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
USING (job_id)
INNER JOIN skills_dim AS sd
USING (skill_id)
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_work_from_home = TRUE
  AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING COUNT(*) > 100
ORDER BY optimal_score DESC
LIMIT 25;


/*
/*

QUERY OUTPUT

┌────────────┬───────────────┬──────────────┬───────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand │ optimal_score │
├────────────┼───────────────┼──────────────┼───────────┼───────────────┤
│ terraform  │      184000.0 │          193 │      5.26 │          0.97 │
│ python     │      135000.0 │         1133 │      7.03 │          0.95 │
│ sql        │      130000.0 │         1128 │      7.03 │          0.91 │
│ aws        │      137320.0 │          783 │      6.66 │          0.91 │
│ airflow    │      150000.0 │          386 │      5.96 │          0.89 │
│ spark      │      140000.0 │          503 │      6.22 │          0.87 │
│ snowflake  │      135500.0 │          438 │      6.08 │          0.82 │
│ kafka      │      145000.0 │          292 │      5.68 │          0.82 │
│ azure      │      128000.0 │          475 │      6.16 │          0.79 │
│ java       │      135000.0 │          303 │      5.71 │          0.77 │
│ ...        │          ...  │          ... │       ... │           ... │
└────────────┴───────────────┴──────────────┴───────────┴───────────────┘

Summary

The analysis combines median salary and market demand into a single optimal score to identify the most valuable skills for remote Data Engineer positions. By applying the natural logarithm (LN) to demand, the ranking reduces the influence of extremely common skills while still rewarding technologies that appear frequently in job postings.

Terraform ranks first with the highest optimal score (0.97), driven by its combination of a high median salary ($184,000) and solid market demand. Python and SQL follow closely, demonstrating that foundational programming and database skills remain both highly compensated and consistently requested by employers. Cloud platforms (AWS and Azure), workflow orchestration tools (Airflow), big data frameworks (Spark and Kafka), and modern cloud data warehouse technologies (Snowflake) also rank among the most valuable skills.

Conclusion

The findings suggest that the most strategic skills for aspiring Data Engineers are those that balance strong salary potential with sustained employer demand. Rather than focusing solely on niche, high-paying technologies or only the most common skills, professionals should prioritize technologies that consistently perform well across both dimensions.

Based on this analysis, the strongest skills to invest in are:

1. Terraform
2. Python
3. SQL
4. AWS
5. Airflow
6. Spark
7. Snowflake
8. Kafka
9. Azure
10. Java

These technologies provide an excellent combination of earning potential and job opportunities, making them valuable priorities for career development in remote Data Engineering roles.

*/

*/