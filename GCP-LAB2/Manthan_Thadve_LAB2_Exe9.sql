SELECT
  repo_name,
  D.new_path AS file,
  committer.date AS date,
  LAG(commit,1,"No Commit") OVER(PARTITION BY repo_name ORDER BY committer.date) AS Previous_commit,
  commit,
  LEAD(commit,1,"No Commit") OVER(PARTITION BY repo_name ORDER BY committer.date) AS Next_commit
FROM
  `bigquery-public-data.github_repos.sample_commits`,
  UNNEST(difference) AS D
  WHERE D.new_path LIKE 'kernel/acct%.c'


-- Find for each commit on Github on a .c file of the Linux kernel, the previous and the next commit.
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: sample_commits
