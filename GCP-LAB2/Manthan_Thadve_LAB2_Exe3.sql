SELECT
  PARSE_DATE("%Y%m%d",
    date) AS Date,
  h.page.pagePath AS PagePath,
  SUM(totals.visits) AS Counter
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST(hits) AS h
GROUP BY
  Date,
  PagePath
ORDER BY Date,Counter DESC 


-- Find how many times a page it was visited in July 2017. Group by date the result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_201707* (wildcard)
