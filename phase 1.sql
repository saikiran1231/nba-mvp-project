--answe for the first question
WITH ranked AS (
  SELECT
    season,
    player_name,
    pts,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY pts DESC) AS rn
  FROM all_seasons
)
SELECT season, player_name, pts
FROM ranked
WHERE rn = 1
ORDER BY season;

--second question answer

WITH ranked AS (
  SELECT
    season,
    player_name,
    pts,
    ts_pct,
    usg_pct,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY pts DESC) AS rn
  FROM all_seasons
)
SELECT
  season,
  player_name,
  pts,
  ts_pct,
  usg_pct
FROM ranked
WHERE rn = 1
ORDER BY season;

--answer three

-- Top 10 scorers per season
WITH ranked AS (
  SELECT
    season,
    player_name,
    team_abbreviation,
    pts,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY pts DESC) AS rk
  FROM all_seasons
)
SELECT season, rk, player_name, team_abbreviation, pts
FROM ranked
WHERE rk <= 10
ORDER BY season, rk;

-- efficiency of top scores
-- Efficiency of top scorers (TS% vs USG%)
WITH ranked AS (
  SELECT
    season,
    player_name,
    pts,
    ts_pct,
    usg_pct,
    ROW_NUMBER() OVER (PARTITION BY season ORDER BY pts DESC) AS rk
  FROM all_seasons
)
SELECT
  season,
  player_name,
  pts,
  ts_pct,
  usg_pct
FROM ranked
WHERE rk <= 5
ORDER BY season, rk;


