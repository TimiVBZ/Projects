select * from processed_cyclist_data_cleaner pcdc 
where hours < 1

select ride_id, start_station_name, started_at, end_station_name, ended_at, hours
from processed_cyclist_data_cleaner pcdc 

Select member_casual, count(member_casual) as "number"
from processed_cyclist_data_cleaner pcdc 
group by member_casual

select member_casual, avg(minutes) as "Average minutes"
from processed_cyclist_data_cleaner pcdc 
group by member_casual 


select count(end_station_name)
from processed_cyclist_data_cleaner pcdc 

select day_of_week_D, count(started_at) as "Number of trips"
from processed_cyclist_data_cleaner pcdc 
group by day_of_week_D 
order by count(started_at) desc


select start_station_name, end_station_name,  hours
from processed_cyclist_data_cleaner pcdc 
order by start_station_name 

select day_of_week_D, sum(hours) as "Total hours", avg(hours) as "Average hours"
from processed_cyclist_data_cleaner pcdc 
group by day_of_week_D 
order by sum(hours) desc

select day_of_week_D, sum(hours) as "Total hours", avg(hours) as "Average hours"
from processed_cyclist_data_cleaner pcdc 
group by day_of_week_D 
having sum(hours) > 7000
order by sum(hours) desc

select ride_id, minutes,
CASE
	WHEN minutes > 30.00 then 'customer did more than recommended 30 minutes'
	WHEN minutes < 30.00 then 'customer did less than recommended 30 minutes'
	ELSE 'customer did the recommended 30 minutes'
END AS minutesText
from processed_cyclist_data_cleaner pcdc  

select max(minutes), min(minutes), avg(minutes), count(DISTINCT ride_id)
from processed_cyclist_data_cleaner pcdc 



