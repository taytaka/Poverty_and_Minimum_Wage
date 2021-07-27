DROP TABLE min_wage;
-- Create min_wage Table
CREATE TABLE min_wage (
	"Year" INT,
	"State" TEXT,
	"State_Minimum_Wage" DECIMAL,
	"State_Minimum_Wage_2020_Dollars" DECIMAL,
	"Federal_Minimum_Wage" DECIMAL,
	"Federal_Minimum_Wage_2020_Dollars" DECIMAL,
	"Effective_Minimum_Wage" DECIMAL,
	"Effective_Minimum_Wage_2020_Dollars" DECIMAL,
	"CPI_Average" DECIMAL,
	"Department_Of_Labor_Uncleaned_Data" VARCHAR,
	"Department_Of_Labor_Cleaned_Low_Value" DECIMAL,
	"Department_Of_Labor_Cleaned_Low_Value_2020_Dollars" VARCHAR,
	"Department_Of_Labor_Cleaned_High_Value" VARCHAR,
	"Department_Of_Labor_Cleaned_High_Value_2020_Dollars" VARCHAR,
	"Footnote" VARCHAR
);

select * from min_wage;

-- Creating unemployment_rate table
CREATE TABLE unemp_rate (
	unemployment_rate DECIMAL,
	"state" VARCHAR,
	"year" INT
);

SELECT * FROM unemp_rate;

CREATE TABLE min_wage_effective (
	"year" INT,
	"state" VARCHAR,
	minimum_wage_effective DECIMAL,
	minimum_wage_2020_nominal DECIMAL,
	CPI_Average DECIMAL
);

SELECT * FROM min_wage_effective;

-- Creating final dataset table

CREATE TABLE economic_features (
	"year" INT,
	"state" VARCHAR,
	population_million DECIMAL,
	education_million DECIMAL,
	welfare_million DECIMAL,
	crime_rate DECIMAL,
	unemployment_rate DECIMAL,
	divorce_rate_per_1000_people DECIMAL,
	homeownership_rate DECIMAL,
	minimum_wage_effective DECIMAL,
	CPI_Average DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL
);

CREATE TABLE economic_features_full (
	"year" INT,
	"state" VARCHAR,
	population_million DECIMAL,
	education_million DECIMAL,
	welfare_million DECIMAL,
	crime_rate DECIMAL,
	unemployment_rate DECIMAL,
	divorce_rate_per_1000_people DECIMAL,
	homeownership_rate DECIMAL,
	minimum_wage_effective DECIMAL,
	CPI_Average DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL
);

SELECT * FROM economic_features_full;

