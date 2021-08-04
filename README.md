# Poverty and Minimum Wage

## Topic
This project analyzes if and how major economic indicators: Population, education spending, welfare spending, crime rate, unemployment rate, divorce rate, homeownership rate, effective minimum wage, average wage index, consumer price index (CPI), and inflation rate, can predict poverty rates in the USA on both the state and national level.

## Reasons for Selection
Looking at the economic situation of the USA during and coming out of COVID, it is of interest to evaluate which economic indicators most affect poverty levels and if these economic indicators can be used to predict poverty levels.

## Data Sources
(edit to include feature and link to download)
We are looking at data pulled from:
- Population & Education and Welfare Spending, usgovernmentspending.com https://www.usgovernmentspending.com/download_multi_year  
- Crime Rate, FBI Crime Data Explorer https://crime-dataexplorer.app.cloud.gov/pages/explorer/crime/crime-trend
- Unemployment Rate, Bureau of Labor Statistics https://www.bls.gov/lau/
- Divorce Rate, CDC, https://www.cdc.gov/nchs/nvss/marriage-divorce.htm
- Homeownership Rate FRED.gov (Federal Reserve Bank) https://fred.stlouisfed.org/series/USHOWN 
- Effective Minimum Wage Kaggle.com https://www.kaggle.com/lislejoem/us-minimum-wage-by-state-from-1968-to-2017
- Average Wage Index, Social Security Administration https://www.ssa.gov/oact/cola/awiseries.html
- Inflation and CPI, BLS, https://inflationdata.com/Inflation/Inflation_Rate/HistoricalInflation.aspx
- Poverty Rates, Center on Poverty and Social Policy at Columbia University https://www.povertycenter.columbia.edu/state-fact-sheets

## Research Questions
-	Can poverty levels be inferred from historical economic indicators?
-	Which economic indicator has the highest impact on poverty levels?
-	How does adjusting certain economic features affect the poverty rate?

## Communication Protocols
We have decided to use Slack as our main communication method. In the event of a technical issue or emergency, we have exchanged emails and phone numbers to stay connected. A Google Doc was created by Jose to outline our project and clarify the roles each team member will take on for each portion of the first segment deliverable.

## Technologies Used

The following technologies will be used for this project:
- Jupyter Notebook, Python, and Pandas Library for data cleaning, joining, and organizing data for models and graphs
- AWS RDS and Postgres for the database and data storage
- SQLAlchemy for database connection
- Scikit-learn's LinearRegression and DecisionTreeRegressor for machine learning models
- GitHub pages, HTML, CSS, JavaScript, Flask for webpage deployment

## Team Members
Ha Duong, Kyle Gee, Jose Orellana, Jeanette Perthel, and Taylor Takanishi

### Roles
- Square: Taylor Takanishi created the GitHub repository and its branches
- Triangle: Ha Duong spear-headed the machine learning model with Taylor Takanishi assistance
 -Jeanette Perthel and Jose Orellana collected, processed, explored the data 
- Circle: Kyle Gee established the AWS RDS database and SQL schema
- X: Jose Orellana and Jeanette Perthel collaborated on technology
- Presentation: All members of the team participated in presentation preparation

## Project Outline
-	ETL: The data was extracted from sources as CSVs, and read into Jupyter Notebook, transformed using Pandas and loaded into new CSVs `economic_features_full` and `economic_features` dataset. These datasets were exported and uploaded to GitHub along with the raw data files.
-	Amazon RDS, a PostgreSQL database is used to store the data on the cloud, so it can be accessed by all team members without needing to store it locally. A connection to the database was created using SQLAlchemy. 
-	Using the SQLAlchemy connection, data is loaded into Jupyter Notebook for machine learning models. The models created were split, trained, tested, then the trained models were saved using Pickle.
-	A Flask application is used to display data visualizations a webpage. It includes Tableau, JavaScript, HTML, and CSS.

### Data Collection, Processing, and Exploration
The datasets chosen for this project were inspired by relevant literature and research on poverty in the United States, including articles from the US census, Bureau of Labor Statistics (BLS) and the U.S. Department of Health and Human Services. Data was collected from various reliable sources, specifically from government agencies such as Social Security Administration, US census Bureau, CDC, BLS, Federal Reserve Bank (FRB), FBI. The intension of this project is to evaluate how major economic indicators (independent variables) affect poverty rates (target variable) on a national and state level. 
Data for each feature was collected individually on a state and national level.  Each state for each feature was aggregated together into a single csv for said feature. Some features were collected from multiple sources, i.e., specific years for certain features needed to be found through various sources. Datasets for each state and feature were considered based on the range of years, data format provided by each source, and general availability.  
Data processing included eliminating null values, duplicates, and identifying gaps, and to verify correspondence among the datasets. Data was evaluated for outliers to confirm datatypes were coherent. All features were merged into a single dataset which resulted in 14 columns, a little less than 3,000 rows. 
Data exploration included investigating the relationship between independent variables with the dependent variable (poverty rates). Trends, patterns, and correlations were evaluated using various plotting techniques such as: box and whiskers, line plots, scatter, heat map of correlation matrixes, and best fit line. Additionally, statistics for the dataset was evaluated using ‘.describe’ and correlation functions. Each State was evaluated for a specific feature to identify possible complication in the data. State and National data was compared side by side to find possible trends or patterns. 



### Database
Amazons RDS for PostgreSQL is used to store the database. The database includes tables for each of the features and corresponding data, as well as the final tables containing an aggregate of all features with and without NA values.  These tables were Quered to populate two new tables, `lowest_poverty_rates` containing the set of data for that states lowest poverty rate, and `highest_poverty_rates` containing the set of data for that states highest poverty rate. These were joined together in a new table, `high_low_poverty`. All tables are connected by primary/foreign key as the combination of the year and state. Using SQLAlchemy, a connection to the database was established to pull data to use for the machine learning portion of the project. 

### Machine Learning
#### Linear Regression
For the linear regression model, we used the connection string to the database and loaded in the `economic_features_full` table into a dataframe. From here the `education_million` and `welfare_million` columns were used to create `education_per_capita` and `welfare_per_capita` then dropped `education_million` and `welfare_million` columns to normalize the dataset. The features used are:`population_million`, `crime_rate`, `unemployment_rate`, `divorce_rate_per_1000_people`, `homeownership_rate`, `minimum_wage_effective`, `cpi_average`, `inflation_rate`, `avg_wage_index`, `education_per_capita`, `welfare_per_capita`, and the target variabl is `poverty_rate`. A function was created to train a linear regression model for each state. Using scikit-learn's `train_test_split`, the data was split into a 90-10 train/test ratio then trained and tested. The predicted values were then plotted for each state on a line plot containing the actual values and predicted values, with the predicted values for the testing data shown as red dots. Finally, a dataframe was created to display the coefficients, intercept, mean absolute error, mean squared error, model type, r2 score, r2 ridge score, and delta r2 for the models of each state.

(explain model choice including limitation and benefits)
(Should save the models to be used for predictive interactive portion of webpage)

#### Decision Tree Regressor
After connecting to the database via SQLAlchemy, the dataset`economic_features` was loaded. The `state` and `year` columns were dropped, as they would not be used as features in the `DecisionTreeRegressor` model. The `education_million` and `welfare_million` columns were used to create the `education_per_capita` and `welfare_per_capita` columns, then dropped. A function was then created to train a `DecisionTreeRegressor` model for every state, and the r2_score was saved and added to the `state_scores` dataframe which showed the state name and the corresponding r2_score for that states model. The models were then saved using Pickle. Next, a `DecisionTreeRegressor` was used to create a model for the entire dataset, where the score was added to the `state_scores` as `"Entire"`, and the model was saved using Pickle. These models were trained and tested using `train_test_split()`, with a training size of 0.8. A function called `display_metrics` was created to take in a state name and output its R-Squared value and the models ranked feature importance. The `DecisionTreeRegressor` worked very well for most states, but very poorly for others. Dropping column(s) would increase the accuracy for some, while worsening the score for others and a few states would have very poor scores regardless of how the model was adjusted. This led to the conclusion that Decision Tree Regressor would not be as an effective model as the Linear Regression model.

### Presentation
The results of this project will be displayed in a webpage. The page will include the analysis of the results, interactive and static graphs, interactive tables, and an interactive poverty predictor. For the interactive graphs, the user will be able to select the state(s) and feature they wish to see a historical line plot of. An example of the static graphs is a heatmap of a correlation matrix for the economic features, displaying how strong, or weak, of a relationship there is with each of the other features. For the poverty predictor, the user will pick a state, which will select the saved machine learning model for that state. They will then be able to adjust the values of the features, and these customized features will be fed into the trained machine learning model to predict the poverty rate for the users customized features.

### Recommendations for future analysis
For future analysis it is recommended that the target feature be changed to see if some features are easier to predict than others. Additionally, a forecasting model can be created based on years where each feature can have a model that can predict the feature's value based on an input year and all of the feature's predictions for that year can be fed into the machine learning model to predict the poverty rate for that year.


#### Stuff to add

##### data collection, and preprocessing
- Description of the analysis phase of the project

##### ml model
- decision-making process
- Explanation of model choice, including limitations and benefits

##### database
- provide an erd
- talk about database normalization if done and the join (part of db normalization)

##### dashboard
- storyboard on google slides (doing webpage, but slides for now)
- description of tools that will be used to create final dashboard (GitHub pages, html, css, js, etc)
