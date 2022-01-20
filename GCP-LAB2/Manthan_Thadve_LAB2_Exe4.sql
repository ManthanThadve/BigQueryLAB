WITH
  pairs AS (
  SELECT
    geoNetwork.country AS country,
    device.operatingSystem AS OS,
    device.browser AS Browser,
    RANK() OVER (PARTITION BY geoNetwork.country ORDER BY (COUNT(device.browser)+COUNT(device.operatingSystem))) AS rank
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`
  WHERE
    device.isMobile = TRUE
    AND NOT geoNetwork.country IN ('(not set)')
    AND NOT device.browser IN ('(not set)')
    AND NOT device.operatingSystem IN ('(not set)')
  GROUP BY
    country,
    OS,
    Browser
  ORDER BY
    country)
SELECT country,
        ARRAY_AGG(STRUCT(OS,
                        Browser,
                        rank)) AS country_rank
FROM pairs
WHERE rank<=3
GROUP BY country
ORDER BY country


-- 1. Find the first 3 most used pairs of OS and Browser from mobile devices for each
-- available country on 1st August 2017
-- 2. Produce a new table with the query result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_20170801