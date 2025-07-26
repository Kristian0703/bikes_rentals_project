CREATE MATERIALIZED VIEW bk.Average_Trip_Duration_by_Stations AS
SELECT 
    s_start.name AS Start_Station,
    s_end.name AS End_Station,
    ROUND(AVG(t.trip_duration_minutes)::numeric, 2) AS Avg_Trip_Duration_Minutes
FROM bk.trips t
LEFT JOIN bk.stations s_start 
    ON t.start_station_id = s_start.station_id
LEFT JOIN bk.stations s_end 
    ON t.end_station_id = s_end.station_id
GROUP BY 
    s_start.name, 
    s_end.name
ORDER BY Avg_Trip_Duration_Minutes DESC;
