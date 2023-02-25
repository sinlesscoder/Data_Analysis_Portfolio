SELECT * FROM portfolioproject..vgsales
order by year

-- MAIN FOCUS: Which specific elements in the gaming industry are more popular than others?

-- Clean out a row with NULL platform and year
-- Since not many data for anything after 2017, deleted some rows for those years to not affect the analysis

DELETE FROM portfolioproject..vgsales WHERE platform is NULL;
DELETE FROM portfolioproject..vgsales WHERE year is NULL;
DELETE FROM portfolioproject..vgsales WHERE year = 2017 or year = 2020;

-- Reset Ranking after the deletion

WITH cte AS (
    SELECT *, r = RANK() OVER(ORDER BY global_sales desc,name, platform)
    FROM portfolioproject..vgsales
)
UPDATE c 
SET rank = r 
FROM cte c;

--Checked to see any duplicate, anything with more than two of the same global_sales and name

Select a.rank, a.name, a.platform, b.rank, b.name, b.platform 
from portfolioproject..vgsales a 
join portfolioproject..vgsales b
	on a.name = b.name
	and a.rank = b.rank
	and a.platform <> b.platform

-- Amount of game by genre, publisher, platform

SELECT count(name) as #ofgame, publisher from portfolioproject..vgsales
group by publisher
order by count(name) desc

SELECT count(name), genre, year from portfolioproject..vgsales
group by genre, year
order by year, count(name) desc

SELECT count(platform) as #ofPlatform, round(sum(Global_Sales),2) as Profit, publisher from portfolioproject..vgsales
group by publisher
order by round(sum(Global_Sales),2) desc


-- Sum of sales for each platform throughout different regions (unnecessary)
SELECT platform, round(sum(NA_sales),2) as NA,round(sum(EU_sales),2) as EU,round(sum(jp_sales),2) as JP,round(sum(other_sales),2) as Others
FROM portfolioproject..vgsales
group by platform

-- Amount sold overall over the year(unnecessary)
Select year, round(sum(global_sales),2) As total_sales FROM portfolioproject..vgsales
Group by year
order by year

-- By region
Select year, round(sum(NA_sales),2) as NA,round(sum(EU_sales),2) as EU,round(sum(jp_sales),2) as JP,round(sum(other_sales),2) as Others
FROM portfolioproject..vgsales
Group by year
order by year
--Selenium
--forecast

--For each platform, which region sold most? Window function

WITH temp as (SELECT year, CASE greatest(NA_sales,eu_sales,jp_sales, other_sales)
          WHEN NA_sales THEN 'NA'
          WHEN jp_sales THEN 'JP'
          WHEN eu_sales THEN 'EU'
          WHEN other_sales THEN 'Others'
       END AS most_sales
FROM   portfolioproject..vgsales)
select year, count(case when most_sales = 'NA' then 1 end) as NA, 
count(case when most_sales = 'JP' then 1 end) as JP, 
count(case when most_sales = 'EU' then 1 end) as EU,
count(case when most_sales = 'Others' then 1 end) as Others from temp
group by year
order by year

WITH temp as (SELECT year, CASE greatest(NA_sales,eu_sales,jp_sales, other_sales)
          WHEN NA_sales THEN 'NA'
          WHEN jp_sales THEN 'JP'
          WHEN eu_sales THEN 'EU'
          WHEN other_sales THEN 'Others'
       END AS most_sales
FROM   portfolioproject..vgsales)
Select year, most_sales,count(most_sales) as amount_of_times from temp
group by year, most_sales
order by year;


-- Genre popularity by year (NEED HELP)

with temp as (Select year, genre, COUNT(genre) as stuff from portfolioproject..vgsales
group by year, genre
order by year)
select distinct year, genre, max(stuff) from temp
group by year, genre 
order by year

-- Rank function, partition by 
-- where rank = 1
Select year, genre, COUNT(genre), rank() over (order by count(genre) desc partition by year) as stuff from portfolioproject..vgsales
group by year, genre
order by year

select t.genre, t.year, x.stuff
from portfolioproject..vgsales t
join (Select year, COUNT(genre) as stuff from portfolioproject..vgsales
group by year) x
on x.year = t.year
order by x.year


Select year, genre, COUNT(genre) as stuff from portfolioproject..vgsales
group by year, genre
order by year, count(genre)


Select year, COUNT(genre) as stuff from portfolioproject..vgsales
group by year
order by year


-- Amount of games AND Profit from each Publisher top 20

Select top 20 publisher, COUNT(Name) as Games, round(sum(Global_Sales),2) as Profit FROM portfolioproject..vgsales
Group by Publisher
HAVING COUNT(Name) > 100
order by Games desc

--Profit from each publisher top 20 (unnecessary)

Select top 20 publisher, round(sum(Global_Sales),2) as Profit FROM portfolioproject..vgsales
Group by Publisher
HAVING COUNT(Name) > 100
order by sum(Global_Sales) desc

-- Genre by publisher

Select Genre, publisher, count(genre) As number from portfolioproject..vgsales
group by genre, publisher
Having count(genre) > 9
order by publisher, count(genre) desc

-- Make rank list, for every top 10's, 

-- Numbers of genre by years, largest amount of genre of the year
SELECT year, genre, count(genre) as amount 
from portfolioproject..vgsales
group by year, genre
order by year, count(genre)

-- percentage of each genre for each year using total number of produced games
