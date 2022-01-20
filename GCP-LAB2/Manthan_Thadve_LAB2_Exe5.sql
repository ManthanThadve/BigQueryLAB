SELECT
  user.id AS User_ID,
  COUNT(posts_answer.owner_user_id) AS Total_ans
FROM
  `bigquery-public-data.stackoverflow.users` AS user
JOIN
  `bigquery-public-data.stackoverflow.posts_answers` AS posts_answer
ON
  user.id = posts_answer.owner_user_id
  WHERE posts_answer.creation_date BETWEEN '2010-01-01 17:30:00' AND '2010-12-31 17:30:00'
GROUP BY
  User_ID
ORDER BY
  Total_ans DESC
LIMIT
  10


-- Find the top 10 users (the id) who answered the most questions.
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: posts_answers, users
