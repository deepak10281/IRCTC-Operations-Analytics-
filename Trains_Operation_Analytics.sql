# 1. BASIC DATA CHECKS
-- ============================================================
 
-- Total records
SELECT COUNT(*) AS total_trains 
FROM data;
 
-- Null checks
SELECT
    SUM(`Train No`              IS NULL)                                          AS null_train_no,
    SUM(`Train Name`            IS NULL OR `Train Name`            = '')          AS null_train_name,
    SUM(`Source Station`        IS NULL OR `Source Station`        = '')          AS null_source,
    SUM(`Departure Time`        IS NULL OR `Departure Time`        = '')          AS null_departure,
    SUM(`Arrival Time`          IS NULL OR `Arrival Time`          = '')          AS null_arrival,
    SUM(`Distance (km)`         IS NULL)                                          AS null_distance,
    SUM(`Destination Station`   IS NULL OR `Destination Station`   = '')          AS null_destination,
    SUM(`Days of Week`          IS NULL OR `Days of Week`          = '')          AS null_days,
    SUM(`Classes`               IS NULL OR `Classes`               = '')          AS null_classes,
    SUM(`Intermediate Stops`    IS NULL OR `Intermediate Stops`    = '')          AS null_stops
FROM data;
 
-- Duplicate trains
SELECT `Train No`, COUNT(*) AS cnt
FROM data
GROUP BY `Train No`
HAVING COUNT(*) > 1;
-- ============================================================
-- 2. HUB ANALYSIS
-- ============================================================
 
SELECT
    station,
    SUM(originating)               AS originating,
    SUM(terminating)               AS terminating,
    SUM(originating + terminating) AS hub_score
FROM (
    SELECT `Source Station` AS station, COUNT(*) AS originating, 0 AS terminating
    FROM data GROUP BY `Source Station`
 
    UNION ALL
 
    SELECT `Destination Station`, 0, COUNT(*)
    FROM data GROUP BY `Destination Station`
) t
GROUP BY station
ORDER BY hub_score DESC
LIMIT 20;
 
-- Top routes
SELECT
    `Source Station`,
    `Destination Station`,
    COUNT(*)                        AS num_trains,
    ROUND(AVG(`Distance (km)`), 1)  AS avg_distance
FROM data
GROUP BY `Source Station`, `Destination Station`
ORDER BY num_trains DESC
LIMIT 20;
 
-- ============================================================
-- 3. ROUTE ANALYSIS
-- ============================================================
 
SELECT
    CASE
        WHEN `Distance (km)` < 100  THEN 'Short'
        WHEN `Distance (km)` < 500  THEN 'Medium'
        WHEN `Distance (km)` < 1500 THEN 'Long'
        ELSE 'Very Long'
    END AS route_type,
    COUNT(*)                        AS train_count,
    ROUND(AVG(`Distance (km)`), 1)  AS avg_distance
FROM data
GROUP BY route_type;
 
-- Longest routes
SELECT `Train No`, `Train Name`, `Distance (km)`
FROM data
ORDER BY `Distance (km)` DESC
LIMIT 10;
 
-- Shortest routes
SELECT `Train No`, `Train Name`, `Distance (km)`
FROM data
WHERE `Distance (km)` > 0
ORDER BY `Distance (km)` ASC
LIMIT 10;
 
-- ============================================================
-- 4. SERVICE FREQUENCY
-- ============================================================
 
SELECT
    CASE
        WHEN `Days of Week` LIKE '%MON%'
         AND `Days of Week` LIKE '%TUE%'
         AND `Days of Week` LIKE '%WED%'
         AND `Days of Week` LIKE '%THU%'
         AND `Days of Week` LIKE '%FRI%'
         AND `Days of Week` LIKE '%SAT%'
         AND `Days of Week` LIKE '%SUN%' THEN 'Daily'
        WHEN `Days of Week` LIKE '%SAT%'
          OR `Days of Week` LIKE '%SUN%' THEN 'Weekend Included'
        ELSE 'Weekday Only'
    END AS service_type,
    COUNT(*) AS train_count
FROM data
GROUP BY service_type;
 
-- Day-wise trains
SELECT 'Monday'    AS day, COUNT(*) AS train_count FROM data WHERE `Days of Week` LIKE '%MON%'
UNION ALL
SELECT 'Tuesday',   COUNT(*) FROM data WHERE `Days of Week` LIKE '%TUE%'
UNION ALL
SELECT 'Wednesday', COUNT(*) FROM data WHERE `Days of Week` LIKE '%WED%'
UNION ALL
SELECT 'Thursday',  COUNT(*) FROM data WHERE `Days of Week` LIKE '%THU%'
UNION ALL
SELECT 'Friday',    COUNT(*) FROM data WHERE `Days of Week` LIKE '%FRI%'
UNION ALL
SELECT 'Saturday',  COUNT(*) FROM data WHERE `Days of Week` LIKE '%SAT%'
UNION ALL
SELECT 'Sunday',    COUNT(*) FROM data WHERE `Days of Week` LIKE '%SUN%'
ORDER BY train_count DESC;
 
-- ============================================================
-- 5. CLASS ANALYSIS
-- ============================================================
 
SELECT *
FROM (
    SELECT '1A' AS class_type, COUNT(*) AS total FROM data WHERE `Classes` LIKE '%1A%'
    UNION ALL
    SELECT '2A', COUNT(*) FROM data WHERE `Classes` LIKE '%2A%'
    UNION ALL
    SELECT '3A', COUNT(*) FROM data WHERE `Classes` LIKE '%3A%'
    UNION ALL
    SELECT 'SL', COUNT(*) FROM data WHERE `Classes` LIKE '%SL%'
    UNION ALL
    SELECT 'CC', COUNT(*) FROM data WHERE `Classes` LIKE '%CC%'
    UNION ALL
    SELECT 'GN', COUNT(*) FROM data WHERE `Classes` LIKE '%GN%'
) t
ORDER BY total DESC;
 
-- Average classes per train
SELECT ROUND(AVG(
    (`Classes` LIKE '%1A%') +
    (`Classes` LIKE '%2A%') +
    (`Classes` LIKE '%3A%') +
    (`Classes` LIKE '%SL%') +
    (`Classes` LIKE '%CC%') +
    (`Classes` LIKE '%GN%')
), 2) AS avg_classes
FROM data;
 
-- ============================================================
-- 6. DEPARTURE TIME ANALYSIS
-- ============================================================
 
SELECT
    CASE
        WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 4  AND 7  THEN 'Early Morning'
        WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 8  AND 11 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 12 AND 15 THEN 'Afternoon'
        WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 16 AND 19 THEN 'Evening'
        WHEN HOUR(STR_TO_DATE(`Departure Time`, '%H:%i')) BETWEEN 20 AND 23 THEN 'Night'
        ELSE 'Late Night'
    END AS time_slot,
    COUNT(*) AS train_count
FROM data
GROUP BY time_slot
ORDER BY train_count DESC;
 
-- ============================================================
-- 7. STOP ANALYSIS
-- ============================================================
 
SELECT
    `Train No`,
    `Train Name`,
    `Stop Count`
FROM data
ORDER BY `Stop Count` DESC
LIMIT 20;
 
-- ============================================================
-- 8. FINAL SUMMARY VIEW
-- ============================================================
 
SELECT
    `Train No`,
    `Train Name`,
    `Source Station`,
    `Destination Station`,
    `Distance (km)`,
    CASE
        WHEN `Distance (km)` < 100  THEN 'Short'
        WHEN `Distance (km)` < 500  THEN 'Medium'
        WHEN `Distance (km)` < 1500 THEN 'Long'
        ELSE 'Very Long'
    END AS route_type,
    CASE
        WHEN `Classes` LIKE '%1A%' OR `Classes` LIKE '%2A%' THEN 'Premium'
        WHEN `Classes` LIKE '%3A%'                          THEN 'AC'
        WHEN `Classes` LIKE '%SL%'                         THEN 'Sleeper'
        ELSE 'General'
    END AS service_tier
FROM data;