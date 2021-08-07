-- Creating final dataset table that contains all economic features and all rows of data
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


-- Creating features table
CREATE TABLE features_table (
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
	PRIMARY KEY ("year", "state"),
	FOREIGN KEY ("year", "state") REFERENCES economic_features_full
);

-- Creating target table
CREATE TABLE target_table (
	"year" INT,
	"state" VARCHAR,
	poverty_rate DECIMAL,
	PRIMARY KEY ("year", "state"),
	FOREIGN KEY ("year", "state") REFERENCES economic_features_full
);

-- Creating table to be used
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
	PRIMARY KEY ("year", "state"),
	FOREIGN KEY ("year", "state") REFERENCES features_table,
	FOREIGN KEY ("year", "state") REFERENCES target_table
);

CREATE TABLE high_low_poverty (
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
	PRIMARY KEY ("year", "state"),
	FOREIGN KEY ("year", "state") REFERENCES economic_features
);


-----------------------------------
-----------------------------------
-- populating features_table from economic_features_full
INSERT INTO features_table ("year", "state", population_million, education_million, welfare_million, crime_rate, unemployment_rate, 
							divorce_rate_per_1000_people, homeownership_rate, minimum_wage_effective, CPI_Average, inflation_rate, avg_wage_index)
SELECT "year", "state", population_million, education_million, welfare_million, crime_rate, unemployment_rate, divorce_rate_per_1000_people,
	homeownership_rate, minimum_wage_effective, CPI_Average, inflation_rate, avg_wage_index
FROM economic_features_full;

-- populating target_table from economic_features_full
INSERT INTO target_table ("year",  "state", poverty_rate)
SELECT "year",  "state", poverty_rate
FROM economic_features_full;

-- populating economic_features by joining features_table and target_table
INSERT INTO economic_features
SELECT ft."year", ft."state", ft.population_million, ft.education_million, ft.welfare_million, ft.crime_rate, ft.unemployment_rate, 
	ft.divorce_rate_per_1000_people, ft.homeownership_rate, ft.minimum_wage_effective, ft.CPI_Average, ft.inflation_rate, ft.avg_wage_index, tt.poverty_rate 
	FROM features_table as ft
FULL JOIN target_table as tt
ON ft.year = tt.year AND ft.state = tt.state
WHERE ft."year" IS NOT NULL AND ft."state" IS NOT NULL AND ft.population_million IS NOT NULL AND ft.education_million IS NOT NULL 
	AND ft.welfare_million IS NOT NULL AND ft.crime_rate IS NOT NULL AND ft.unemployment_rate IS NOT NULL AND ft.divorce_rate_per_1000_people IS NOT NULL 
	AND ft.homeownership_rate IS NOT NULL AND ft.minimum_wage_effective IS NOT NULL AND ft.CPI_Average IS NOT NULL AND ft.inflation_rate IS NOT NULL 
	AND ft.avg_wage_index IS NOT NULL AND tt.poverty_rate IS NOT NULL
;

-- populating high_low_poverty table from highest and lowest poverty levels for each state contained in economic_features table
INSERT INTO high_low_poverty
(SELECT DISTINCT ON ("state") 
    ft."year", ft."state", ft.population_million, ft.education_million, ft.welfare_million, ft.crime_rate, ft.unemployment_rate, 
 	ft.divorce_rate_per_1000_people, ft.homeownership_rate, ft.minimum_wage_effective, ft.CPI_Average, ft.inflation_rate, ft.avg_wage_index, ft.poverty_rate
FROM economic_features as ft 
ORDER BY "state", ft.poverty_rate DESC)
UNION
(SELECT DISTINCT ON ("state") 
    ft."year", ft."state", ft.population_million, ft.education_million, ft.welfare_million, ft.crime_rate, ft.unemployment_rate, 
 	ft.divorce_rate_per_1000_people, ft.homeownership_rate, ft.minimum_wage_effective, ft.CPI_Average, ft.inflation_rate, ft.avg_wage_index, ft.poverty_rate
FROM economic_features as ft 
ORDER BY "state", ft.poverty_rate ASC)
ORDER BY "state";





