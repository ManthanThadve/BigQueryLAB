WITH
  ranking AS (
  SELECT
    EXTRACT(YEAR FROM Release_Date) AS year,
    Movie_Title,
    Production_Budget AS budget,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM Release_Date) ORDER BY Production_Budget DESC ) AS Rank
  FROM
    `nttdata-c4e-bde.uc1_4.top_4000_movies_data`
  WHERE
    Release_Date BETWEEN '2016-01-01'
    AND '2020-12-31'
  ORDER BY
    year DESC)
SELECT * FROM ranking
WHERE
  Rank <=10



-- Given the shared file top_4000_movies_data.csv
-- 1. Create a BigQuery table “Movie”
-- 2. Find the top 10 highest budget films, year by year, from 2016 to 2020.
  