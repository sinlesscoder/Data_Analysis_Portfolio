# Ali Ahmed - Data Analysis Portfolio

# About
I'm Ali! Recent graduate, obtaining a Bachelor of Art (B.A) degree from New York University, with major in Economics. Currently seeking Data Analyst opportunities as I to hone my skills in various programming languages (SQL, Python). Self-taught SQL using w3schools and datalemur.

This repository serves as a showcase of my skills, a place to share my projects, and a way to track my progress in Data Analytics and Data Science-related topics. 

# Portfolio Projects

For this project, I worked on a dataset of video game sales found on kaggle, where I graph the trend of different element of video games over the range of time period. I wanted to do this particular project because I love games myself, and was interested to see how was the game like from 1980s and how the trend changed overtime. 

I begin with data cleaning, where I removed all data from 2016 to 2020, since they were not enough information to show the flow of the market. I've also deleted any rows with NULL value for either platform and/or year column. After removing the datas, I used WITH, RANK(), and window function to reset a column for ranking. 

Then, to see if there is any duplicate game names and global_sales, I decided to use join function, joining the table to itself to see if anything is equal.

After finish up cleaning the data, I asked a question for the dataset: 
How many times did one region had the most sales for each different games over the each year?

To query this, I used a with function to make a temporary table with a case statement to add a count each time a region tops the sale for the game. To visualize the result, I used public tableau linked below:
https://public.tableau.com/app/profile/ali.ahmed3520 
![Screenshot_2](https://user-images.githubusercontent.com/121634275/222937327-78618396-1999-4760-b16e-e26af601746d.png)
![Screenshot_1](https://user-images.githubusercontent.com/121634275/222937328-91f689d1-e8c5-4514-bdd0-8aeff67c5186.png)
![Screenshot_3](https://user-images.githubusercontent.com/121634275/222937566-13220c64-4931-4f90-b54c-86f57561f534.png)
