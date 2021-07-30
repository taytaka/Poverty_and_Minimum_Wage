-- Creating ave_wage_indexing
-- contains file average_wage_indexing_1951-2020.csv
CREATE TABLE ave_wage_indexing (
	"Year" INT,
	AWI VARCHAR,
	Annual_change VARCHAR,
	PRIMARY KEY ("Year")
);

-- Creating table cpi_inflation_rate
-- contains file CPI_inflation_rate_yearly_1914-2021_1984base.csv
CREATE TABLE cpi_inflation_rate (
	"Year" INT,
	CPI_Average DECIMAL,
	InflationRate VARCHAR,
	PRIMARY KEY ("Year")
);

-- Creating table crime_rate
-- Contains file crime_rate.csv
CREATE TABLE crime_rate (
	"year" INT,
	"state" TEXT,
	crime_rate DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating final dataset table that contains all economic features
-- Contains file dataset.csv

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
	inflation_rate DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating final dataset that has all economic features with NA values dropped
-- Contains file dataset_na_dropped.csv
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
	inflation_rate DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating divorce_rate table
-- Contains file divorce_rate_per_1000_people.csv
CREATE TABLE divorce_rate (
	"Year" INT,
	Divorce_rate_per_1000_people DECIMAL,
	PRIMARY KEY ("Year")
);

-- Creating table homeownership_rate
-- Contains file homeownership_rate.csv
CREATE TABLE homeownership_rate (
	homeownership_rate DECIMAL,
	"state" VARCHAR,
	"year" INT,
	PRIMARY KEY ("year", "state")
);

-- Creating table min_wage_effective
-- Contains file miimum_wage_effective_1968-2020.csv
CREATE TABLE min_wage_effective (
	"year" INT,
	"state" VARCHAR,
	minimum_wage_effective DECIMAL,
	minimum_wage_2020_nominal DECIMAL,
	CPI_Average DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating table poverty_rates
-- Contains file poverty_rates_1967-2014.csv
CREATE TABLE poverty_rates (
	"year" INT,
	poverty_rate DECIMAL,
	"state" VARCHAR,
	PRIMARY KEY ("year", "state")
);

-- Creating table unemployment_rate
-- Contains file unemployment_rate.csv
CREATE TABLE unemployment_rate (
	unemployment_rate DECIMAL,
	"state" VARCHAR,
	"year" INT,
	PRIMARY KEY ("year", "state")
);

-- Creating table welfare_education
-- Contains file welfare_education_1970-2026.csv
CREATE TABLE welfare_education (
	"year" INT,
	"state" VARCHAR,
	population_million DECIMAL,
	education_million DECIMAL,
	welfare_million DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating table lowest_poverty_rates
CREATE TABLE lowest_poverty_rates (
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
	inflation_rate DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL,
	PRIMARY KEY ("year", "state")
);

-- Creating table highest_poverty_rates
CREATE TABLE highest_poverty_rates (
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
	inflation_rate DECIMAL,
	avg_wage_index DECIMAL,
	poverty_rate DECIMAL,
	PRIMARY KEY ("year", "state")
);


