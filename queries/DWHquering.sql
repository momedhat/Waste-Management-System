-- Create a grouping sets query using the columns stationid, trucktype, total waste collected.
SELECT ft.stationid, dt.trucktype, sum(ft.wastecollected) AS "total waste collected"
FROM facttrips AS ft 
LEFT JOIN dimtruck AS dt
ON ft.truckid = dt.truckid
GROUP BY GROUPING SETS(ft.stationid, dt.trucktype);



-- Create a rollup query using the columns year, city, stationid, and total waste collected.
SELECT dt.year, ds.city, ft.stationid, sum(ft.wastecollected) AS "total waste collected"
FROM facttrips AS ft LEFT JOIN dimstation AS ds
ON ft.stationid = ds.stationid 
LEFT JOIN dimdate AS dt
ON ft.dateid = dt.dateid 
GROUP BY ROLLUP(dt.year, ds.city, ft.stationid)



-- Create a cube query using the columns year, city, station, average waste collected.
SELECT dt.year, ds.city, ft.stationid, avg(ft.wastecollected) AS "average waste collected"
FROM facttrips AS ft LEFT JOIN dimstation AS ds
ON ft.stationid = ds.stationid 
LEFT JOIN dimdate AS dt
ON ft.dateid = dt.dateid 
GROUP BY CUBE(dt.year, ds.city, ft.stationid)



-- Create an MQT named max_waste_per_station using the columns city, station, trucktype, max waste collected.
CREATE TABLE max_waste_per_station(city, stationid, trucktype, maxWasteCollected) AS
(
	SELECT ds.city, ft.stationid, dt.trucktype, MAX(ft.wastecollected)
	FROM facttrips AS ft
	LEFT JOIN dimstation AS ds ON ft.stationid = ds.truckid
	LEFT JOIN dimtruck AS dt ON ft.truckid = dt.truckid
	GROUP BY ds.city, ft.stationid, dt.trucktype
)
DATA INITIALLY DEFERRED
REFRESH DEFERRED
ENABLE QUERY OPTIMIZATION;


