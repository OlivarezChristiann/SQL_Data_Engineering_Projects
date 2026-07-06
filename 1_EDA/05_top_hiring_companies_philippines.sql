/*
Question: Which companies are hiring the most Data Engineers in the Philippines?

- Identify the companies with the highest number of Data Engineer job postings in the Philippines.
- Focus on organizations actively recruiting Data Engineers.

Why?
- This analysis highlights the employers with the greatest demand for Data Engineers in the Philippine job market.
- The findings help aspiring Data Engineers identify potential employers, prioritize job applications, and research the technologies and career opportunities offered by these companies.
*/

SELECT
    cd.name AS company_name,
    COUNT(*) AS job_count
FROM job_postings_fact AS jpf
INNER JOIN company_dim AS cd
USING (company_id)
WHERE jpf.job_title_short = 'Data Engineer'
  AND jpf.job_country = 'Philippines'
GROUP BY cd.name
ORDER BY job_count DESC
LIMIT 10;


/*

QUERY OUTPUT

┌─────────────────────────────────────────┬───────────┐
│              company_name               │ job_count │
├─────────────────────────────────────────┼───────────┤
│ beBee Careers                           │       157 │
│ IBM                                     │       123 │
│ ING                                     │        66 │
│ Thinking Machines Data Science          │        64 │
│ First Datacorp                          │        63 │
│ A7 Recruitment                          │        59 │
│ First Circle                            │        57 │
│ Arch Global Services (Philippines) Inc. │        50 │
│ Collabera Digital                       │        42 │
│ Confidential                            │        36 │
└─────────────────────────────────────────┴───────────┘

Summary

The analysis identifies the organizations with the highest number of Data Engineer job postings in the Philippines. beBee Careers recorded the largest number of postings, followed by IBM and ING. Other organizations with significant hiring activity include Thinking Machines Data Science, First Datacorp, First Circle, Arch Global Services (Philippines) Inc., and Collabera Digital.

The results indicate that employment opportunities for Data Engineers are concentrated across multinational technology companies, financial institutions, data consulting firms, and recruitment platforms. This diversity reflects the growing demand for data engineering expertise across multiple industries in the Philippine job market.

Conclusion

Aspiring Data Engineers should consider these organizations when exploring career opportunities in the Philippines, as they demonstrate consistent hiring activity for Data Engineer roles. Researching these companies can provide valuable insights into the technical skills, tools, and qualifications commonly required by employers.

It is also important to note that some entries, such as **beBee Careers**, function as job posting or recruitment platforms rather than direct employers, while **Confidential** represents anonymous job postings. Therefore, the results should be interpreted as identifying the primary sources of Data Engineer job opportunities rather than exclusively the largest hiring companies.

*/