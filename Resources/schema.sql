-- Create min_wage Table
CREATE TABLE min_wage (
	Year INT,
	State TEXT,
	State_Minimum_Wage DECIMAL,
	State_Minimum_Wage_2020_Dollars DECIMAL,
	Federal_Minimum_Wage DECIMAL,
	Federal_Minimum_Wage_2020_Dollars DECIMAL,
	Effective_Minimum_Wage DECIMAL,
	Effective_Minimum_Wage_2020_Dollars DECIMAL,
	CPI_Average DECIMAL,
	Department_Of_Labor_Uncleaned_Data VARCHAR,
	Department_Of_Labor_Cleaned_Low_Value DECIMAL,
	Department_Of_Labor_Cleaned_Low_Value_2020_Dollars DECIMAL,
	Department_Of_Labor_Cleaned_High_Value DECIMAL,
	Department_Of_Labor_Cleaned_High_Value_2020_Dollars DECIMAL,
	Footnote VARCHAR
);