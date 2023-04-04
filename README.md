# Ali Ahmed - Data Analysis Portfolio

## Table of Contents

- [About](#about)
- [Exploration - SQL Project](#exploration---sql-project)
  - [Visualization](#visualization)  
  - [Conclusion](#conclusion)  
- [Python Panda Project](#python-panda-project)
  - [Visualization](#section2)  


# About
I'm Ali! Recent graduate, obtaining a Bachelor of Art (B.A) degree from New York University, with major in Economics. Currently seeking Data Analyst opportunities as I to hone my skills in various programming languages (SQL, Python). Self-taught SQL using w3schools and datalemur.

This repository serves as a showcase of my skills, a place to share my projects, and a way to track my progress in Data Analytics and Data Science-related topics. 

This is an access to my [Public Tableau account](https://public.tableau.com/app/profile/ali.ahmed3520/viz/vgsales_16778898900110/Dashboard1)

# Exploration - SQL Project

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
In conclusion, this project on video game sales was a great way to learn and practice using SQL for data cleaning and querying. By removing unnecessary data and using various SQL functions, I was able to answer questions about regional sales, top publishers, and popular genres in the industry. Through visualization, I was able to gain insights into the trends and changes in the video game market over time. Overall, this project not only allowed me to improve my SQL skills but also provided me with a better understanding of the video game industry.

# Python Panda Project
For my second project, I have worked on Python using Jupyter Notebook, where I initially used Selenium to scrape data of headset details from Amazon.com, and put them into an Excel file. After extracting and converting them into an excel file, I have cleaned the data, and then saves the cleaned data to the same Excel file.

After finishing, I have asked several questions that would show patterns in the data, and answer them using visualization with Matplotlib.

You can access the code in this repository by clicking [here](https://github.com/sinlesscoder/Data_Analysis_Portfolio/blob/main/Amazon%20Selenium.ipynb)

Visualization<a name="section2"></a>
-
Question 1: What is the distribution of headset prices in the dataset?
-
To answer this question, I have decided to use a histogram with matplotlib since they are helpful for showing distribution of variable.  
![download](https://user-images.githubusercontent.com/121634275/229909574-0a2fa00a-7c42-4ae4-984b-58aeef8d3b6b.png)

Based on the histogram, dataset is positively skewed with most headsets priced under 50 USD, as shown by the histogram plotted using the given code. In average, the value of headset is around 50 USD, then drastically drops in the amount as price increases.

Question 2: Is there a correlation between price and rating?
-
![download (1)](https://user-images.githubusercontent.com/121634275/229909573-eb600509-f8c1-473b-b847-98e6073fb0fb.png)

Question 3: How do the ratings of the headsets vary by price range?
-
![download (2)](https://user-images.githubusercontent.com/121634275/229909572-2e29bfad-a278-435f-ae8b-e1d85e6b3462.png)

Question 4: How many headsets fall under each rating category?
-
![download (3)](https://user-images.githubusercontent.com/121634275/229909569-c5cbee67-2c48-4c85-9cb7-2069f44dfa1a.png)

Question 5: How many headsets fall under each price category?
-
![download (4)](https://user-images.githubusercontent.com/121634275/229909567-36a85900-eded-41cc-8c72-2a125191d8c1.png)
