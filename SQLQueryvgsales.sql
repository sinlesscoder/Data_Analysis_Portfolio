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

--Check to see any duplicate, anything with more than two of the same global_sales and name

Select a.rank, a.name, a.platform, b.rank, b.name, b.platform 
from portfolioproject..vgsales a 
join portfolioproject..vgsales b
	on a.name = b.name
	and a.rank = b.rank
	and a.platform <> b.platform

-- Amount of game by genre, publisher, platform top 50

SELECT * FROM (
SELECT round(sum(Global_Sales),2) as Profit, count(name) as #ofgame, publisher,
rank() OVER (ORDER BY round(sum(Global_Sales),2) DESC) AS n
from portfolioproject..vgsales
group by publisher) as x
where n <= 50

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

-- Most produced genre by year

SELECT *
  FROM (SELECT year, genre, 
  rank() over (partition by year order by count(genre) desc) as stuff 
  from portfolioproject..vgsales
  group by year, genre) a
WHERE stuff = 1

-- Amount of games AND Profit from each Publisher top 20

Select top 20 publisher, COUNT(Name) as Games, round(sum(Global_Sales),2) as Profit FROM portfolioproject..vgsales
Group by Publisher
HAVING COUNT(Name) > 100
order by Games desc

-- Genre by publisher

Select Genre, publisher, count(genre) As number from portfolioproject..vgsales
group by genre, publisher
Having count(genre) > 9
order by publisher, count(genre) desc

-- Numbers of genre by years, largest amount of genre of the year

SELECT year, genre, count(genre) as amount 
from portfolioproject..vgsales
group by year, genre
order by year, count(genre)

--Total amount of profit for each genre

SELECT genre, round(SUM(global_sales),2) as TotalSales 
  from portfolioproject..vgsales
  group by genre
  order by round(SUM(global_sales),2) desc
