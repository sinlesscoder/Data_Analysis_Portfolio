# Ali Ahmed - Data Analysis Portfolio

## Table of Contents

- [About](#about)
- [SQL Project](#sql-project)
  - [Visualization](#visualization)  
  - [Conclusion](#conclusion)  
- [Python Project](#python-project)


# About
I'm Ali! Recent graduate, obtaining a Bachelor of Art (B.A) degree from New York University, with major in Economics. Currently seeking Data Analyst opportunities as I to hone my skills in various programming languages (SQL, Python). Self-taught SQL using w3schools and datalemur.

This repository serves as a showcase of my skills, a place to share my projects, and a way to track my progress in Data Analytics and Data Science-related topics. 

This is an access to my [Public Tableau account](https://public.tableau.com/app/profile/ali.ahmed3520/viz/vgsales_16778898900110/Dashboard1)

# SQL Project

For my first project, I worked on a dataset of video game sales found on Kaggle, where I graph the trend of different elements of video games over the range of period. I wanted to do this particular project because I love games myself, and was interested to see what was the game like in the 1980s and how the trend changed over time. 

You can access the SQL code in this repository by clicking [here](https://github.com/sinlesscoder/Data_Analysis_Portfolio/blob/main/SQLQueryvgsales.sql).

I begin with data cleaning, where I removed all data from 2016 to 2020 since they were not enough information to show the flow of the market. I've also deleted any rows with a NULL values for either platform and/or year column. After removing the data, I used WITH, RANK(), and the window function to reset a column for ranking. 

Then, to see if there are any duplicate game names and global_sales, I decided to use the join function, joining the table to itself to see if anything is equal.

After finishing up cleaning the data, I asked several questions for the dataset, and answer them by querying the data 
How many times did one region have the most sales for each different game over each year?

Visualization 
-
My first question is, how many times did one region have the most sales for each different game over each year?

To query this, I used a function to make a temporary table with a case statement to add a count each time a region tops the sale for the game. 

![Screenshot_2](https://user-images.githubusercontent.com/121634275/222937327-78618396-1999-4760-b16e-e26af601746d.png)
-

I approached this question because I wanted to know which region is the biggest market over the years. Looking at the graph, Japan had the most sales in the 1980s. After around 1995, sales in North America drastically surpassed the market in Japan. I assume this was the case because popular publishers started off in Japan as their first entry to the industry, then later in 1995, they spread their business across the world, and North America generally has the biggest market, the number of top sales will be at NA. Another thing to note here is that newer publishers around the world entered the gaming industry, which would affect also the total sales.

Now that we know North America has the largest market, now we want to know what is the top publisher in general, and the metric here is the amount of total profit.

![Screenshot_1](https://user-images.githubusercontent.com/121634275/222937328-91f689d1-e8c5-4514-bdd0-8aeff67c5186.png)
-
Here, I have decided to list the top 20 publishers by their profit using the TOP and COUNT functions on SQL. I was curious about the number of games the top publishers have produced in total since I wanted to know if the quantity mattered in gaining much profit. In the bar graph, the most company has greater profit if they have greater quantity. However, it was not the case for one publisher, Nintendo. It has fewer games than publishers like Electronic Art and Activision but has a greater profit. The quantity of the games usually corresponds to the profit, but not always.

Now I am interested in seeing what types of games are popular.

![Screenshot_3](https://user-images.githubusercontent.com/121634275/222937566-13220c64-4931-4f90-b54c-86f57561f534.png)

For querying this using SQL, I have used a Subquery, rank(), and PARTITION BY (window function) to query the number of games for different Genres. The queried data shows the amount of time a genre was ranked as one most produced amount during each year. According to the pie chart, Action Genre seems to be ranked one the most amount of time, so I would assume the genre is the most popular in general. Then I was curious about the actual total profit by all the existing genres.

![Screenshot_4](https://user-images.githubusercontent.com/121634275/224179294-b920cb8c-30f7-4650-9614-24a4be0124d6.png)

For querying, used the SUM function on SQL. After seeing the visualization of the data, you see some genres did not appear on the pie chart. Those genre has never reached rank one in production in any given year, however, the genre, Misc, has higher profit than genres like Fighting, one that appeared to have topped in production amount.

Conclusion
-

In conclusion, the main focus is to identify which specific elements in the gaming industry are more popular than others. The code cleans the data by deleting rows with NULL values in the platform and year columns, and deleting rows for years 2017 and 2020 since there isn't enough data for those years. The code then resets the ranking after the deletion to update the rank of the remaining rows. It checks for duplicates by identifying any rows with more than two of the same global sales and name.

The code then examines the amount of games by genre, publisher, and platform, selecting the top 50. It also sums up the sales for each platform throughout different regions. The code then analyzes the total amount of sales for each year and by region. The next query examines for each platform, which region sold the most using a window function. The code then identifies the most produced genre by year and examines the amount of games and profit from each publisher, selecting the top 20 publishers that have produced more than 100 games. It also identifies the number of genres by publisher and genre by years, selecting the largest amount of genre for each year. Lastly, the code identifies the total amount of profit for each genre.

# Python Project
For my second project, I have worked on Python using Jupyter Notebook, where I initially used Selenium to scrape data of headset details from Amazon.com, and put them into an Excel file. After extracting and converting them into an excel file, I have cleaned the data, and then saves the cleaned data to the same Excel file.

After finishing, I have asked several questions that would show patterns in the data, and answer them using visualization with Matplotlib.

You can access the code in this repository by clicking [here](https://github.com/sinlesscoder/Data_Analysis_Portfolio/blob/main/Amazon%20Selenium.ipynb)

