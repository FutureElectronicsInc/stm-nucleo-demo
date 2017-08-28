LOAD DATA INFILE 'D:\IBM Bluemix\projects\weather data\Montreal Weather Data January 2013 - July 2017-new.csv'
INTO TABLE wdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@wdate,wyear,wmonth,wday,	data_quality,max_temp,max_temp_flag,min_temp,
min_temp_flag,mean_temp,mean_temp_flag,heat_deg_days,heat_deg_days_flag,
cool_deg_days,cool_deg_days_flag,total_rain,total_rain_flag,total_snow,
total_snow_flag,total_precip,total_precip_flag,snow_on_grnd,snow_on_grnd_flag,
dir_of_max_gust,dir_of_max_gust_flag,spd_of_max_gust,spd_of_max_gust_flag)
SET wdate = STR_TO_DATE(@wdate, '%d/%m/%Y');