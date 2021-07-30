------------------------------------
-- inserting data into lowest_poverty_rates table
------------------------------------

-- Reading in lowest poverty rate data for National
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'National'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Alabama
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Alabama'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Alaska
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Alaska'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Arizona
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Arizona'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Arkansas
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Arkansas'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for California
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'California'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Colorado
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Colorado'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Connecticut
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Connecticut'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Delaware
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Delaware'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Florida
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Florida'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Georgia
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Georgia'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Hawaii
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Hawaii'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Idaho
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Idaho'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Illinois
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Illinois'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Indiana
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Indiana'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Iowa
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Iowa'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Kansas
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Kansas'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Kentucky
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Kentucky'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Louisiana
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Louisiana'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Maine
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Maine'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Maryland
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Maryland'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Massachusetts
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Massachusetts'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Michigan
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Michigan'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Minnesota
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Minnesota'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Mississippi
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Mississippi'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Missouri
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Missouri'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Montana
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Montana'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Nebraska
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Nebraska'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Nevada
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Nevada'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for New Hampshire
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Hampshire'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for New Jersey
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Jersey'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for New Mexico
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Mexico'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for New York
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New York'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for North Carolina
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'North Carolina'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for North Dakota
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'North Dakota'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Ohio
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Ohio'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Oklahoma
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Oklahoma'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Oregon
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Oregon'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Pennsylvania
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Pennsylvania'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Rhode Island
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Rhode Island'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for South Carolina
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'South Carolina'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for South Dakota
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'South Dakota'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Tennessee
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Tennessee'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Texas
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Texas'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Utah
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Utah'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Vermont
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Vermont'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Virginia
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Virginia'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Washington
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Washington'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for West Virginia
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'West Virginia'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Wisconsin
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Wisconsin'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;

-- Reading in lowest poverty rate data for Wyoming
INSERT INTO lowest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Wyoming'
ORDER BY e.poverty_rate
FETCH FIRST ROW ONLY;



------------------------------------
-- inserting data into highest_poverty_rates table
------------------------------------

-- Reading in highest poverty rate data for National
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'National'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Alabama
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Alabama'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Alaska
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Alaska'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Arizona
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Arizona'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Arkansas
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Arkansas'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for California
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'California'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Colorado
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Colorado'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Connecticut
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Connecticut'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Delaware
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Delaware'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Florida
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Florida'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Georgia
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Georgia'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Hawaii
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Hawaii'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Idaho
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Idaho'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Illinois
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Illinois'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Indiana
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Indiana'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Iowa
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Iowa'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Kansas
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Kansas'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Kentucky
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Kentucky'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Louisiana
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Louisiana'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Maine
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Maine'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Maryland
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Maryland'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Massachusetts
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Massachusetts'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Michigan
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Michigan'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Minnesota
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Minnesota'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Mississippi
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Mississippi'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Missouri
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Missouri'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Montana
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Montana'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Nebraska
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Nebraska'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Nevada
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Nevada'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for New Hampshire
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Hampshire'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for New Jersey
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Jersey'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for New Mexico
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New Mexico'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for New York
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'New York'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for North Carolina
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'North Carolina'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for North Dakota
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'North Dakota'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Ohio
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Ohio'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Oklahoma
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Oklahoma'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Oregon
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Oregon'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Pennsylvania
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Pennsylvania'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Rhode Island
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Rhode Island'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for South Carolina
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'South Carolina'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for South Dakota
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'South Dakota'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Tennessee
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Tennessee'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Texas
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Texas'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Utah
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Utah'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Vermont
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Vermont'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Virginia
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Virginia'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Washington
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Washington'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for West Virginia
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'West Virginia'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Wisconsin
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Wisconsin'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

-- Reading in highest poverty rate data for Wyoming
INSERT INTO highest_poverty_rates
SELECT * FROM economic_features AS e
WHERE e.state = 'Wyoming'
ORDER BY e.poverty_rate DESC
FETCH FIRST ROW ONLY;

