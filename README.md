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

There isn't much reason to why I chose headset for my unique dataset, but I was having issue with my previous one, so I wanted a new one. I decided to use Selenium to take all headset details on amazon and have them all in excel file. categorized them with their name, asin number (something like ID), price, average rating, and amount of rating.

You can access the code in this repository by clicking [here](https://github.com/sinlesscoder/Data_Analysis_Portfolio/blob/main/Amazon%20Selenium.ipynb)

Visualization<a name="section2"></a>
-
Question 1: What is the distribution of headset prices in the dataset?
-
To answer this question, I have decided to use a histogram with matplotlib since they help show the distribution of variables.

![download](https://user-images.githubusercontent.com/121634275/229909574-0a2fa00a-7c42-4ae4-984b-58aeef8d3b6b.png)

Based on the histogram, the dataset is positively skewed with most headsets priced under 50 USD, as shown by the histogram plotted using the given code. On average, the value of the headset is around 50 USD, then drastically drops in the amount as price increases. From range 50 to 100, the amount of product is reduced by over 50 percent, then about 70 percent from 120 to 170. Then there is a small increase in the amount at the price around 350 to 420.

Question 2: Is there a correlation between price and rating?
-
![download (1)](https://user-images.githubusercontent.com/121634275/229909573-eb600509-f8c1-473b-b847-98e6073fb0fb.png)

Among the product under the price of 60 USD, I wanted to see the correlation between rating and each price interval. Decided to use scatterplot for this particular question since it can show which rating the pricetag generally had. According to the plot, most of the headsets are rated above 4.0, but there aren't much correlation in the range of 4.0 to 5.0. From this result, there is not much correlation between price and rating.

Question 3: How many headsets fall under each rating category?
-
![download (3)](https://user-images.githubusercontent.com/121634275/229909569-c5cbee67-2c48-4c85-9cb7-2069f44dfa1a.png)

I decided to use bar graph with matplotlib, since that would accurately differentiate between different rating. Based on the graph, the amount of ratings rises to max from rating of 4.0, then stays constant until 4.7, then decreasing again. This bar graph's count explains the lack of correlation from previous graph, since the count for each rating is the same in the interval.

Question 4: How would the unique feature some headset have would differ from others?
-
![download (5)](https://user-images.githubusercontent.com/121634275/230694266-f9afdd43-09a1-4497-aa90-3a8cde3806e2.png)

Initally, I checked the top 50 most common words from the product title, also known as the name column, and manually chose which featured words to use, since some can just be words like "the". After choosing, adding new columns corresponding to that featured word, and marked 1 in each row of the column if the "Name" column contains the word, and 0 otherwise. Then finally after adding the new columns, I have made arrays with all the numbers in Rating column that had featured column as "1" in the same row. Named the arrays with corresponding featured name, and made a boxplot using matplotlib. According to the above boxplot result, Microphone seems to have the largest outliar, and have more wider range in rating.

![download (6)](https://user-images.githubusercontent.com/121634275/230694307-7fc56121-62d8-4967-aed8-c92f3d4b61fa.png)

I decided to zoom into the box part of the graph to better see the difference. From here you see all of their medium rating is 4.3. Gaming and Wired have a very similar middle 50%, being the box in the graph, range of data, as well as the outliar look visually same, so I assume most gaming headset is also wired. Microphone seems to have wider range of rating compared to other feature, then we would think because there are more microphone headset than others.

![download (8)](https://user-images.githubusercontent.com/121634275/230705857-92ba0f66-1fcf-4508-9e4d-36ca9a453ab3.png)

Conclusion
-

