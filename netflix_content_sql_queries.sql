
-- Netflix Content Data Analysis SQL Queries

-- 1. Total titles and split by type
select type, count(*) as total_titles  
from netflix_dataset 
group by type;

-- 2. Top 10 most watched Titles
select title, type, primary_genre, views_30d  
from netflix_dataset 
order by views_30d desc 
limit 10;

-- 3. Average IMDb rating by genre
select primary_genre, 
	count(*) as total_count, 
    avg(imdb_rating) as avg_imdb_rating 
from netflix_dataset 
group by primary_genre 
order by avg_imdb_rating;

-- 4. Total views by genre (Top 10)
select primary_genre, 
	sum(views_30d) as total_views 
from netflix_dataset 
group by primary_genre 
order by total_views desc 
limit 10;

-- 5. Original vs Non-Original performance
select 
	case when is_original = 1 then 'Original' else 'Non Original' end as original_flag, 
    count(*) as total_titles,
    avg(views_30d) as avg_views,
    avg(completion_rate_pct) as avg_completion_rate 
from netflix_dataset 
group by original_flag;

-- 6. Titles added in last 3 years
select title, type, date_added, views_30d
from netflix_dataset 
where date_added >= date_sub(curdate(), interval 3 year)
order by date_added desc;

-- 7. Average completion by age rating
select age_rating, 
	count(*) as titles,
    avg(completion_rate_pct) as avg_completion_rate
from netflix_dataset 
group by age_rating 
order by avg_completion_rate desc;

-- 8. Year-wise title additions (based on date_added)
select year(date_added) as year_added, 
	count(*) as titles_added 
from netflix_dataset 
group by year(date_added) 
order by year_added;

-- 9. Top 5 countries by total views
select country, 
	sum(views_30d) as total_views,
	count(*) as titles 
from netflix_dataset 
group by country 
order by total_views desc 
limit 5;

-- 10. Kids-friendly library size
select count(*) as kids_titles 
from netflix_dataset 
where age_rating in ('G', 'PG', 'TV-Y', 'TV-Y7', 'TV-G', 'TV-PG');

-- 11. Top titles within each genre (Top 3 by views per genre)
WITH ranked AS (
	select title,
    	primary_genre, 
    	views_30d,
    	row_number() over (partition by primary_genre order by views_30d desc) as rn 
    from netflix_dataset
)
select * from ranked 
where rn <= 3 
order by primary_genre, views_30d desc;

-- 12. Genre share of total views (percentage)
with total as (
  select sum(views_30d) as total_views from netflix_dataset
)
select 
    primary_genre,
    sum(views_30d) as genre_views,
    ROUND(sum(views_30d) / (select total_views from total) * 100, 2) as genre_share_pct
from netflix_dataset
group by primary_genre
order by genre_views desc;

-- 13. Decade-wise counts and avg ratings
select 
    (release_year div 10) * 10 as release_decade,
    count(*) as titles,
    avg(imdb_rating) as avg_imdb,
    avg(user_rating) as avg_user
from netflix_dataset
group by release_decade
order by release_decade;

-- 14. Heavy hitters: titles contributing to top 20% of views
with sorted as (
  select 
    content_id, title, views_30d,
    sum(views_30d) OVER () as total_views,
    sum(views_30d) OVER (order by views_30d desc) as running_views
  from netflix_dataset
)
select *
from sorted
where running_views <= total_views * 0.2
order by views_30d desc;

-- 15. Original uplift: compare Originals and Non-originals within each genre
select 
    primary_genre,
    avg(case when is_original = 1 then views_30d end) as avg_views_original,
    avg(case when is_original = 0 then views_30d end) as avg_views_non_original
from netflix_dataset
group by primary_genre
having count(*) > 10;

-- 16. Hidden gems: high rating but below-median views
with stats as (
  select 
    median(views_30d) OVER () as median_views
  from netflix_dataset
  limit 1
)
select 
    title, primary_genre, imdb_rating, views_30d
from netflix_dataset, stats
where imdb_rating >= 8.5
  and views_30d < stats.median_views
order by imdb_rating desc;

-- 17. Country-genre performance matrix (average views)
select country, primary_genre, avg(views_30d) as avg_views
from netflix_dataset
group by country, primary_genre
having count(*) >= 5
order by country, avg_views desc;

--18. Rolling average views by release year
with yearly as (
  select release_year,
         avg(views_30d) as avg_views
  from netflix_dataset
  group by release_year
)
select 
    release_year,
    avg_views,
    avg(avg_views) OVER (order by release_year ROWS between 2 PRECEDING and current row) as rolling_avg_3yr
from yearly
order by release_year;


