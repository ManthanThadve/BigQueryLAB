WITH
  t1 AS (
  SELECT
    repo_name,
    l.name AS language_name
  FROM
    `bigquery-public-data.github_repos.languages`,
    UNNEST(LANGUAGE) AS l
  WHERE
    l.name = "Java" )
SELECT
  t2.committer.name,
  COUNT(COMMIT) AS commit_Count
FROM
  t1
INNER JOIN
  `bigquery-public-data.github_repos.sample_commits` AS t2
ON
  t1.repo_name = t2.repo_name
GROUP BY
  1
ORDER BY
  commit_Count DESC
LIMIT
  10



-- Find the top 10 committers in 2016 on Github repositories that uses the Java language
-- Public Dataset: bigquery-public-data.github_repos
-- Tables involved: languages, sample_commits
