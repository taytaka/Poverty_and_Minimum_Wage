# Poverty and Minimum Wage

## Topic
This project analyzes if and how major economic indicators: population, education spending, welfare spending, crime rate, unemployment rate, divorce rate, homeownership rate, effective minimum wage, average wage index, consumer price index (CPI), and inflation rate, can predict poverty rates in the United States on both the state and national level.

## Reasons for Selection
Looking at the economic situation of the US during and coming out of COVID, it is of interest to evaluate which economic indicators most affect poverty levels and if these economic indicators can be used to predict poverty rates.

## Data Sources
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
- Can poverty levels be inferred from historical economic indicators?
- Which economic indicator has the highest impact on poverty levels?
- How does adjusting certain economic indicators affect the poverty rate?

## Communication Protocols
We used Slack as our main communication method. In the event of a technical issue or emergency, we exchanged emails and phone numbers to stay connected. A Google Doc was created to outline our project and clarify the roles each team member will take on for each portion of the first segment deliverable.

## Team Members
Ha Duong, Kyle Gee, Jose Orellana, Jeanette Perthel, and Taylor Takanishi

### Roles
- Square: Taylor Takanishi created the GitHub repository and its branches
- Triangle: Ha Duong spear-headed the machine learning model with Taylor Takanishi assistance
- Jeanette Perthel and Jose Orellana collected, processed, explored the data 
- Ha Duong and Jeanette Perthal collaborated on the web page and visualizations
- Circle: Kyle Gee established the AWS RDS database and SQL schema
- X: All members of the team participated in the selection of technologies and tools used in this project. Each role provided input for machine learning, data cleaning and analysis, database storage, web page and dashboards
- Project outline: Jose Orellana created the initial outline for the project
- Presentation: All members of the team participated in presentation preparation 

## Technologies Used
The following technologies will be used for this project:
- Jupyter Notebook, Python, and Pandas Library for data cleaning, joining, and organizing data for models and graphs
- AWS RDS and Postgres for the database and data storage
- SQLAlchemy for database connection
- Scikit-learn's LinearRegression and DecisionTreeRegressor for machine learning models
- GitHub pages, HTML, CSS, JavaScript, Flask for webpage deployment

## Project Outline
- ETL: The data was extracted from sources such as CSVs, and read into Jupyter Notebook, transformed using Pandas and loaded into new CSVs `economic_features_full` and `economic_features` datasets. These datasets were exported and uploaded to GitHub along with the raw data files.
- Amazon RDS and a PostgreSQL database were used to store the data on the cloud so that the database can be accessed by all team members without needing to store it locally. A connection to the database was created using SQLAlchemy. 
- Using the SQLAlchemy connection, data is loaded into Jupyter Notebook for machine learning models. The models created were split, trained, tested and the trained models were saved using Python pickle module.
- Machine learning models were used to predict poverty levels
- A Flask application is used to display data visualizations a webpage. It includes Tableau, JavaScript, HTML, and CSS.


## Data Collection, Exploration, and Processing
The datasets chosen for this project were inspired by relevant literature and research on poverty in the United States, including articles from the US census, Bureau of Labor Statistics (BLS) and the U.S. Department of Health and Human Services. Data was collected from various reliable sources, specifically from government agencies such as Social Security Administration, US Census Bureau, CDC, BLS, Federal Reserve Bank (FRB), and the FBI. The intention of this project is to evaluate how major economic indicators (independent variables) affect poverty rates (target variable) on a national and state level. 

Data for each feature was collected individually on a state and national level.  A single CSV file was aggregated from data from each state for each feature. Some features were collected from multiple sources, because specific years for certain features needed to be found through various sources. Datasets for each state and feature were considered based on the range of years, data format provided by each source, and general availability.  

Data processing included eliminating null values, duplicates, identifying gaps, and verifying correspondence among the datasets. Data was evaluated for outliers to confirm datatypes were coherent. All features were merged into a single dataset which resulted in 14 columns and a little less than 3,000 rows. 

Data exploration included investigating the relationship between independent variables with the dependent variable (poverty rate). Trends, patterns, and correlations were evaluated using various plotting techniques such as: box and whiskers, line plots, scatter, heat map of correlation matrixes, and best fit line. Additionally, statistics for the dataset was evaluated using ‘.describe’ and correlation functions. Each state was evaluated for a specific feature to identify possible complications in the data. State and national data was compared to find possible trends or patterns. 


## Database
Amazons RDS for PostgreSQL is used to store the database. The database includes tables for each of the features and corresponding data, as well as the final tables containing an aggregate of all features with and without NA values.  These tables were queried to populate two new tables, `lowest_poverty_rates` containing the set of data for that state's lowest poverty rate, and `highest_poverty_rates` containing the set of data for that state's highest poverty rate. These were joined together in a new table, `high_low_poverty`. All tables are connected by primary/foreign key as the combination of the year and state. Using SQLAlchemy, a connection to the database was established to pull data to use for the machine learning portion of the project. 


## Machine Learning
<Explanation of model choice, including limitations and benefits -- Remove later>
### Decision Making Process
Since the objective of this project is to evaluate how various economic factors affect poverty levels where the poverty rate is continuous variable, we chose to use linear regression and decision tree regressor techniques to model the relationship between these variables. The independent variables, or features, were the economic measures used to predict the model: population, education spending, welfare spending, crime rate, unemployment rate, divorce rate, homeownership rate, effective minimum wage, average wage index, consumer price index (CPI), and inflation rate. The dependent variable was the outcome or poverty rate that the models were attempting to predict using the independent variables as inputs.

### Model Choice & Benefits
We also evaluated and prototyped the logistics and deep learning models, ultimately selecting linear regression and decision tree regressor as the most applicable models to perform the predictive regression analysis to meet the project objective for the following reasons: 

- Linear regression demonstrates the linear relationship between the dependent variable and independent variables and produces the "line of best fit" that represents the dataset. It also indicates the significant relationships and strength of impacts of the multiple independent variables on a dependent variable.
- Decision tree regressor model supports both classification and regression problems. Decision tree algorithms are particularly useful for complex datasets and has the added advantages of requiring less data cleaning, non-linearity does not affect the model's performance and the number of hyper-parameters to be tuned is minimal.

#### Multiple Linear Regression
For the linear regression model, we used the connection string to the database and loaded in the `economic_features_full` table into a dataframe. From here, the `education_million` and `welfare_million` columns were used to create `education_per_capita` and `welfare_per_capita` columns and then the `education_million` and `welfare_million` columns were dropped to normalize the dataset. The features used are:`population_million`, `crime_rate`, `unemployment_rate`, `divorce_rate_per_1000_people`, `homeownership_rate`, `minimum_wage_effective`, `cpi_average`, `inflation_rate`, `avg_wage_index`, `education_per_capita`, `welfare_per_capita`, and the target variable is `poverty_rate`. A function was created to train a linear regression model for each state. Using scikit-learn's `train_test_split`, the data was split into a 90-10 train/test ratio then trained and tested. The predicted values were then plotted for each state on a line plot containing the actual values and predicted values, with the predicted values for the testing data shown as red dots. Finally, a dataframe was created to display the coefficients, intercept, mean absolute error, mean squared error, model type, R2 score, R2 ridge score, and delta R2 for the models of each state.

(explain model choice including limitation and benefits)
(Should save the models to be used for predictive interactive portion of webpage)
(Do we still have the dataframe with all of the info listed in the last sentence above? If not, that should be deleted)

#### Decision Tree Regressor
After connecting to the database via SQLAlchemy, the dataset `economic_features` was loaded. The `state` and `year` columns were dropped, as they would not be used as features in the `DecisionTreeRegressor` model. The `education_million` and `welfare_million` columns were used to create the `education_per_capita` and `welfare_per_capita` columns, then dropped. A function was then created to train a `DecisionTreeRegressor` model for every state, and the r2_score was saved and added to the `state_scores` dataframe which showed the state name and the corresponding r2_score for that state's model. The models were then saved using Pickle. 

Next, a `DecisionTreeRegressor` was used to create a model for the entire dataset, where the score was added to the `state_scores` as `"Entire"`, and the model was saved using Pickle. These models were trained and tested using `train_test_split()`, with a training size of 0.8. A function called `display_metrics` was created to take in a state name and output its R-Squared value and the models ranked feature importance. The `DecisionTreeRegressor` worked very well for most states, but very poorly for others. Dropping column(s) would increase the accuracy for some, while worsening the score for others and a few states would have very poor scores regardless of how the model was adjusted. This led to the conclusion that decision tree regressor would not be as effective model as the linear regression model.

### Limitations
- Linear regression assumes that there is linearity between the dependent and independent variables which is not always reflected in the real world.
- The datasets sourced were missing data for some states which required additional data sourcing.
- The number of rows were limited for each state. We addressed this limitation by aggregating the data for all states and national into one dataset.

### Recommendations For Future Analysis
For future analysis it is recommended that the target feature be changed to see if some features are easier to predict than others. Additionally, a forecasting model can be created based on years where each feature can have a model that can predict the feature's value based on an input year and all of the feature's predictions for that year can be fed into the machine learning model to predict the poverty rate for that year.


## Analysis
Because of the nature of the data, it is difficult to look at all of the data together and find correlations. Each state has its own laws and regulations concerning most of the features, which was found to greatly impact the correlation between states, economic indicators, and poverty rate. The best way to look at our data is found in `Data_Preprocessing/Exploratory_Analysis/Exploratory_plotting_dataset.ipynb` and `Data_Preprocessing/Exploratory_Analysis/Exploratory_Data_Analysis_Initial.ipynb`. To compare the importance of the features, scatter plots were created with a line of best fit to clearly show correlation between a feature and state. Each state had a different "best" feature (the feature which was most closely related to poverty rate), which meant the machine learning model will need to be trained separately on each state individually so the most accurate prediction is made.


## Presentation and Visualization
The results of this project will be displayed in a webpage. The page will include the analysis of the results, interactive and static graphs, interactive tables, and an interactive poverty predictor. For the interactive graphs, the user will be able to select the state(s) and feature(s) they wish to see a historical line plot of. An example of the static graphs is a heatmap of a correlation matrix for the economic features, displaying how strong, or weak, of a relationship there is with each of the other features. For the poverty predictor, the user will pick a state, which will select the saved machine learning model for that state. They will then be able to adjust the values of the features, and these customized features will be fed into the trained machine learning model to predict the poverty rate for the users customized features.


## Dashboard
The dashboard has been storyboarded on Google Slides. Please see link for the storyboard. A PDF printout of the slides is also available in the Resources folder. https://docs.google.com/presentation/d/1k4L55AXTQFh2Fi2KP3iuTtuOt3RAzvSBZ7cHQ-Q94Ok/edit?usp=sharing
