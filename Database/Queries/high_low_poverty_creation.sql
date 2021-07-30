-----------------------------
-- Creating high_low_poverty table 
-----------------------------
CREATE TABLE high_low_poverty AS
	(
	SELECT * FROM lowest_poverty_rates
	UNION
	SELECT * FROM highest_poverty_rates
	ORDER BY "state"
)
;