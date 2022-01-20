SELECT
  l.name AS Language_name,
  COUNT(l.name) AS Counter
FROM
  `bigquery-public-data.github_repos.languages`,
  UNNEST(LANGUAGE) AS l
GROUP BY Language_name
ORDER BY Counter DESC
LIMIT 1



-- Find the most popular programming language
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: languages
