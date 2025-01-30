#Question-3
SELECT 
    COUNT(CASE WHEN trip_distance <= 1 THEN 1 END) AS "Up to 1 mile",
	COUNT(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 END) AS "1 to 3 miles",
	COUNT(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 END) AS "3 to 7 miles",
	COUNT(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 END) AS "7 to 10 miles",
	COUNT(CASE WHEN trip_distance > 10 THEN 1 END) AS "Over 10 miles"
FROM green_taxi_trips


#Question-4
SELECT
    lpep_pickup_datetime,
    lpep_dropoff_datetime,
    trip_distance,
    total_amount
FROM green_taxi_trips
WHERE trip_distance = (SELECT MAX(trip_distance) FROM green_taxi_trips)


#Question-5
SELECT zpu."Zone" AS "pickup_zone", 
       SUM(gtt."total_amount") AS "total_amount_sum"
FROM green_taxi_trips gtt
JOIN zones zpu ON gtt."PULocationID" = zpu."LocationID"
WHERE 
    gtt."lpep_pickup_datetime" >= '2019-10-18 00:00:00' AND
    gtt."lpep_pickup_datetime" < '2019-10-19 00:00:00' 
	
GROUP BY zpu."Zone"
HAVING SUM(gtt."total_amount") > 13000


#Question-6
SELECT zdo."Zone" AS "dropoff_zone"
FROM green_taxi_trips gtt
JOIN zones zpu ON gtt."PULocationID" = zpu."LocationID"
JOIN zones zdo ON gtt."DOLocationID" = zdo."LocationID"
WHERE 
    gtt."lpep_pickup_datetime" >= '2019-10-01 00:00:00'
    AND gtt."lpep_pickup_datetime" < '2019-11-01 00:00:00'
    AND zpu."Zone" = 'East Harlem North'
ORDER BY gtt."tip_amount" DESC
LIMIT 1;