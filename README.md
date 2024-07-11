# Movies-Recommendation-System-
Aim :
The goal of this project is to create an efficient movie suggestion system that helps cater to the specific needs of the users.

Files Included:
create.sql: This contains CREATE queries for creating tables
load.sql: This contains INSERT queries for loading the data onto the created tables
readme.txt: This provides an overview of the project


Overview:
A dataset 'the movies dataset' was downloaded from kaggle, that consisted of 7 tables, out of which 2 were for a smaller set of data.
Out of the 7, 3 tables were chosen to form the basis for decomposition.
All 3 tables had messy data that needed cleaning and normalizing. 
Those tasks were performed in python using various libraries.

dataset source - https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset

Post decomposition into BCNF, all the tables were created in PostGRESQL and the data was loaded.
To optimize query processing, indexes were built.

To make the interface more accessible and smooth, front-end development was done to create a website using Flask.
