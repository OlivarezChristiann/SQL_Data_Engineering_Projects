/*
Question: What are the top 10 in-demand skills for Data Engineers?

- Identify the top 10 most frequently requested skills for Data Engineer roles.
- Focus only on remote job postings.

Why?
This analysis identifies the skills most commonly required by employers hiring remote Data Engineers. The findings can help aspiring data engineers prioritize their learning path and develop skills that align with current industry demand.
*/

SELECT
    sd.skills,
    COUNT(*) AS job_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
USING (job_id)
INNER JOIN skills_dim AS sd
USING (skill_id)
WHERE job_title_short = 'Data Engineer'
  AND job_work_from_home = TRUE
GROUP BY sd.skills
ORDER BY job_count DESC
LIMIT 10;

/*

QUERY OUTPUT

┌────────────┬───────────┐
│   skills   │ job_count │
│  varchar   │   int64   │
├────────────┼───────────┤
│ sql        │     29221 │
│ python     │     28776 │
│ aws        │     17823 │
│ azure      │     14143 │
│ spark      │     12799 │
│ airflow    │      9996 │
│ snowflake  │      8639 │
│ databricks │      8183 │
│ java       │      7267 │
│ gcp        │      6446 │
└────────────┴───────────┘


Summary

The analysis reveals that SQL and Python are the two most in-demand skills for remote Data Engineer positions, appearing in more than 29,000 and 28,000 job postings, respectively. Cloud computing platforms—including AWS, Azure, and Google Cloud Platform (GCP)—are also among the most frequently requested skills, highlighting the growing reliance on cloud-based data infrastructure. Additionally, technologies such as Spark, Airflow, Snowflake, Databricks, and Java demonstrate the importance of big data processing, workflow orchestration, cloud data warehousing, and software development in modern data engineering roles.

Conclusion

The findings suggest that aspiring Data Engineers should prioritize developing expertise in the following technologies:

1. SQL
2. Python
3. AWS
4. Azure
5. Spark
6. Airflow
7. Snowflake
8. Databricks
9. Java
10. GCP

Building proficiency in these technologies will help candidates align their skills with current employer demand and improve their competitiveness for remote Data Engineer opportunities.

Note:
Only exact 'Data Engineer' roles are included in this analysis.
Senior, Junior, Lead, Principal, and other Data Engineer variants are excluded.


*/