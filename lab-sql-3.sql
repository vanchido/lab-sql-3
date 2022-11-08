use sakila;

select count(distinct last_name) as distinct_lastname from sakila.actor;

select count(distinct language_id) as different_languages from sakila.film;

select count(*) as PG_13_rated from sakila.film where rating = 'PG-13';

select * from sakila.film as sf 
where sf.release_year = '2006'
order by sf.length desc
limit 10;

select datediff(now(),min(create_date)) as operating_days from sakila.customer;

select *,
extract(month from cast(rental_date as date)) as 'month',
weekday(cast(rental_date as date)) as 'weekday'
from sakila.rental
limit 20;

select *,
date_format(convert(rental_date,date), '%M') as 'month',
dayname(cast(rental_date as date)) as 'weekday'
from sakila.rental
limit 20;

select *,
date_format(convert(rental_date,date), '%M') as 'month',
dayname(cast(rental_date as date)) as 'weekday',
case
	when dayname(cast(rental_date as date)) = 'Saturday' then 'weekend'
    when dayname(cast(rental_date as date)) = 'Sunday' then 'weekend'
else 'workday'
end as 'day_type'
from sakila.rental;

select adddate(max(convert(rental_date,date)), interval -1 month) as 'last_month_activity'
from sakila.rental;

select count(*) from sakila.rental
where rental_date > '2006-01-14';