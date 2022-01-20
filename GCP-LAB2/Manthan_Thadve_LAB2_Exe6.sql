WITH StackAnsweredPosts AS(
SELECT 
posts_answers.owner_user_id AS id_user,
FROM
`bigquery-public-data.stackoverflow.stackoverflow_posts` stack_posts
JOIN 
`bigquery-public-data.stackoverflow.posts_answers` posts_answers
ON stack_posts.accepted_answer_id=posts_answers.id
WHERE 
stack_posts.accepted_answer_id IS NOT NULL
AND stack_posts.creation_date BETWEEN '2010-01-01 17:30:00' AND '2010-12-31 17:30:00'
)
SELECT user.id AS User_ID ,COUNT(*) AS count FROM StackAnsweredPosts AS SAP
JOIN `bigquery-public-data.stackoverflow.users` AS user
ON user.id= SAP.id_user
GROUP BY user.id
ORDER BY count DESC
LIMIT 10






-- Find the top 10 StackOverflow users (the id) by accepted responses on 2010 posts
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: stackoverflow_posts, posts_answers, users
