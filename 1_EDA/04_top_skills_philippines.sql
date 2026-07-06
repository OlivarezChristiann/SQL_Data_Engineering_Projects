/*
Question: What are the most in-demand skills for Data Engineers in the Philippines?

- Identify the top 10 most frequently requested skills in Data Engineer job postings located in the Philippines.
- Focus on Data Engineer positions within the Philippine job market.

Why?
- This analysis identifies the technologies and tools most commonly required by employers hiring Data Engineers in the Philippines.
- The findings help aspiring Data Engineers prioritize skill development based on local industry demand and can be compared with the global remote market to identify similarities and differences.
*/

SELECT
    sd.skills,
    COUNT(*) AS job_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
USING (job_id)
INNER JOIN skills_dim AS sd
USING (skill_id)
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_country = 'Philippines'
GROUP BY sd.skills
ORDER BY job_count DESC
LIMIT 10;


/*

QUERY OUTPUT

┌────────────┬───────────┐
│   skills   │ job_count │
├────────────┼───────────┤
│ sql        │      2870 │
│ python     │      2403 │
│ azure      │      1535 │
│ aws        │      1235 │
│ spark      │       860 │
│ java       │       737 │
│ power bi   │       637 │
│ databricks │       636 │
│ hadoop     │       594 │
│ snowflake  │       544 │
└────────────┴───────────┘

Summary

The analysis shows that SQL and Python are the most in-demand skills for Data Engineer positions in the Philippines, appearing in 2,870 and 2,403 job postings, respectively. Cloud computing platforms, particularly Azure and AWS, are also highly sought after, reflecting the increasing adoption of cloud-based data solutions by Philippine organizations. Additionally, big data technologies such as Spark, Hadoop, Databricks, and Snowflake rank among the top requested skills, highlighting the importance of scalable data processing and cloud data warehousing. Notably, Power BI appears in the top ten, indicating that local employers also value data visualization and business intelligence skills alongside core data engineering expertise.

Conclusion

The findings suggest that aspiring Data Engineers in the Philippines should prioritize developing strong foundations in SQL and Python, followed by cloud platforms such as Azure and AWS. Learning big data technologies, including Spark, Hadoop, Databricks, and Snowflake, will further improve employability in the local job market. In addition, gaining experience with Power BI can provide a competitive advantage, as many Philippine employers value professionals who can support both data engineering and analytics initiatives.

Compared with the global remote market, the Philippine market places greater emphasis on Azure and Power BI, while technologies such as Airflow and Kafka are less prominent among the top requested skills. This suggests that aspiring Data Engineers targeting local opportunities should align their skill development with the technologies most commonly adopted by organizations in the Philippines.

*/