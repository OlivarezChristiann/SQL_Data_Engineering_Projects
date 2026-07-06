/*
Question: What are the highest-paying skills for Data Engineers?

- Calculate the median salary for each skill required in Data Engineer positions.
- Focus on remote positions with specified salaries.
- Include skill demand to identify both compensation and popularity.
- Exclude skills with fewer than 100 job postings to improve the reliability of the salary estimates.

Why?
- Identifies the skills associated with the highest median salaries while also showing how frequently they appear in remote Data Engineer job postings.
- Using the median instead of the average minimizes the influence of extremely high or low salaries, providing a more representative measure of compensation.
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(*) AS demand_count
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
ORDER BY median_salary DESC
LIMIT 25;

/*

QUERY OUTPUT

┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ terraform  │      184000.0 │         3248 │
│ golang     │      184000.0 │          912 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │___
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ css        │      150000.0 │          262 │
│ node       │      150000.0 │          179 │
│ ruby       │      150000.0 │          736 │
│ airflow    │      150000.0 │         9996 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘

Summary

The analysis shows that several specialized technologies are associated with the highest median salaries for remote Data Engineer positions. Rust ranks first with a median salary of $210,000, followed by Terraform and Golang at $184,000. While some high-paying skills, such as Rust and Neo4j, appear in relatively few job postings, others—including Terraform, Kubernetes, and Airflow—combine strong compensation with substantial market demand.

The results also highlight that infrastructure and cloud-native technologies (Terraform, Kubernetes, Ansible), backend programming languages (Rust, Golang), and modern data engineering tools (Airflow, GraphQL, MongoDB) are highly valued by employers offering competitive salaries.

Conclusion

Although niche skills such as Rust and Neo4j command the highest median salaries, they are required in fewer job postings. In contrast, skills like Terraform, Kubernetes, and Airflow offer an attractive balance between high compensation and strong employer demand, making them valuable investments for aspiring Data Engineers.

These findings suggest that professionals seeking higher-paying Data Engineer roles should develop expertise in cloud infrastructure, container orchestration, workflow automation, and modern backend technologies alongside core data engineering skills.

*/