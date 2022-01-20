SELECT
  visitId,
  visitStartTime,
  h.page.pagePath AS pagePath,
  h.page.pageTitle AS pageTitle
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`,
  UNNEST (hits) AS h
WHERE
  date = "20170801"


-- Show a flat result of the pages visited on 1st August 2017
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_20170801
