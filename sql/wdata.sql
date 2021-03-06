CREATE TABLE wdata (
    id INT NOT NULL AUTO_INCREMENT,
	wdate DATE NOT NULL,
	wyear INT NOT NULL,
	wmonth TINYINT NOT NULL,
	wday TINYINT NOT NULL,	
	data_quality VARCHAR(25),	
	max_temp DECIMAL(10 , 2 ),
	max_temp_flag DECIMAL(10 , 2 ),
	min_temp DECIMAL(10 , 2 ),
	min_temp_flag DECIMAL(10 , 2 ),
	mean_temp DECIMAL(10 , 2 ),
	mean_temp_flag DECIMAL(10 , 2 ),
	heat_deg_days DECIMAL(10 , 2 ),
	heat_deg_days_flag DECIMAL(10 , 2 ),
	cool_deg_days DECIMAL(10 , 2 ),
	cool_deg_days_flag DECIMAL(10 , 2 ),
	total_rain DECIMAL(10 , 2 ),
	total_rain_flag DECIMAL(10 , 2 ),
	total_snow DECIMAL(10 , 2 ),
	total_snow_flag DECIMAL(10 , 2 ),
	total_precip DECIMAL(10 , 2 ),
	total_precip_flag DECIMAL(10 , 2 ),
	snow_on_grnd DECIMAL(10 , 2 ),
	snow_on_grnd_flag DECIMAL(10 , 2 ),
	dir_of_max_gust  VARCHAR(25),
	dir_of_max_gust_flag VARCHAR(25),
	spd_of_max_gust VARCHAR(25),
	spd_of_max_gust_flag VARCHAR(25),
    PRIMARY KEY (id)
);
