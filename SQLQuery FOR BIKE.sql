SELECT hum
FROM dbo.bike_share_yr_0
WHERE TRY_CONVERT(float, hum) IS NULL AND hum IS NOT NULL;

SELECT hum
FROM dbo.bike_share_yr_0
WHERE TRY_CONVERT(float, hum) IS NULL AND hum IS NOT NULL;


SELECT windspeed
FROM dbo.bike_share_yr_0
WHERE TRY_CONVERT(float, windspeed) IS NULL AND windspeed IS NOT NULL;


SELECT windspeed
FROM dbo.bike_share_yr_1
WHERE TRY_CONVERT(float, windspeed) IS NULL AND windspeed IS NOT NULL;

SELECT temp
FROM dbo.bike_share_yr_0
WHERE TRY_CONVERT(float, temp) IS NULL AND temp IS NOT NULL;

SELECT atemp
FROM dbo.bike_share_yr_0
WHERE TRY_CONVERT(float, atemp) IS NULL AND atemp IS NOT NULL;


ALTER TABLE dbo.bike_share_yr_1 ALTER COLUMN windspeed FLOAT;


ALTER TABLE dbo.bike_share_yr_1 ALTER COLUMN rider_type NVARCHAR(50);

/* =============================================
   1) BASIC EXPLORATION
============================================= */

-- View first 100 rows
SELECT TOP 100 *
FROM dbo.bike_share_yr_0;

-- Count rows per table
SELECT COUNT(*) AS total_rows_year_0 FROM dbo.bike_share_yr_0;
SELECT COUNT(*) AS total_rows_year_1 FROM dbo.bike_share_yr_1;

-- Distinct values
SELECT DISTINCT season FROM dbo.bike_share_yr_0;
SELECT DISTINCT weathersit FROM dbo.bike_share_yr_0;
SELECT DISTINCT rider_type FROM dbo.bike_share_yr_0;
SELECT DISTINCT hr FROM dbo.bike_share_yr_0;


/* =============================================
   2) BASIC METRICS (YEAR 0 ONLY)
============================================= */

-- Total riders
SELECT SUM(riders) AS total_riders
FROM dbo.bike_share_yr_0;

-- Riders by type
SELECT rider_type, SUM(riders) AS total_riders
FROM dbo.bike_share_yr_0
GROUP BY rider_type
ORDER BY total_riders DESC;

-- Riders by month
SELECT mnth AS month, SUM(riders) AS total_riders
FROM dbo.bike_share_yr_0
GROUP BY mnth
ORDER BY mnth;

-- Riders by hour
SELECT hr AS hour, AVG(riders) AS avg_riders
FROM dbo.bike_share_yr_0
GROUP BY hr
ORDER BY hr;

-- Weather effect
SELECT weathersit, AVG(riders) AS avg_riders
FROM dbo.bike_share_yr_0
GROUP BY weathersit
ORDER BY weathersit;

-- Temperature effect
SELECT 
    ROUND(temp * 41, 1) AS real_temp,
    AVG(riders) AS avg_riders
FROM dbo.bike_share_yr_0
GROUP BY temp
ORDER BY real_temp;


/* =============================================
   3) MERGE BOTH YEARS
============================================= */

WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT *
FROM all_data;


/* =============================================
   4) ANALYSIS ON COMBINED dataset
============================================= */

-- Riders per year
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT yr AS year, SUM(riders) AS total_riders
FROM all_data
GROUP BY yr
ORDER BY yr;

-- Riders per month
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT mnth AS month, SUM(riders) AS total_riders
FROM all_data
GROUP BY mnth
ORDER BY mnth;

-- Riders per weekday
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT weekday, AVG(riders) AS avg_riders
FROM all_data
GROUP BY weekday
ORDER BY weekday;

-- Workingday vs Weekend
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT
    CASE WHEN workingday = 1 THEN 'Working Day' ELSE 'Weekend' END AS day_type,
    AVG(riders) AS avg_riders
FROM all_data
GROUP BY workingday;

-- Daily trend
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT dteday, SUM(riders) AS total_riders
FROM all_data
GROUP BY dteday
ORDER BY dteday;

-- Hourly trend
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT hr AS hour, AVG(riders) AS avg_riders
FROM all_data
GROUP BY hr
ORDER BY hr;

-- Temperature effect (both years)
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT 
    ROUND(temp * 41, 1) AS real_temp,
    AVG(riders) AS avg_riders
FROM all_data
GROUP BY temp
ORDER BY real_temp;

-- Rider type summary
WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT rider_type, SUM(riders) AS total_riders
FROM all_data
GROUP BY rider_type
ORDER BY total_riders DESC;


/* =============================================
   5) WEATHER IMPACT
============================================= */

WITH all_data AS (
    SELECT * FROM dbo.bike_share_yr_0
    UNION ALL
    SELECT * FROM dbo.bike_share_yr_1
)
SELECT weathersit, AVG(riders) AS avg_riders
FROM all_data
GROUP BY weathersit
ORDER BY weathersit;
