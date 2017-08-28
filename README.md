# stm-nucleo-demo
**INCREASE EMPLOYEE PRODUCTIVITY BY OPTIMIZING AMBIENT CONDITIONS -  CLOUD APPLICATION RELEASE 2.0**

**LICENSE**

This application is distributed under the Apache License, Version 2.0.


**INTRODUCTION**

Smart organizations understand that human capital is their competitive differentiator, and that their primary goal is
to enhance the performance of their people assets. 
In a knowledge work economy, people are the engine that keep companies growing, adapting, improving and innovating.

Workplace design can be a powerful tool for supporting employee performance. 
And a collateral benefit is that what typically supports productivity also enhances employee health and wellness – it’s all interrelated.


The current application consists of three following parts:

1.	Main screen displays a gauge for temperature, humidity, and pressure respectively with an adjacent MIN/MAX value for each.

	Temperature readings from the STM board.
	Pressure readings from the STM board.
	Humidity readings from the STM board.


2.	Historical and statistical data analyses and their visualization for over a 5-year period.
	The calculation of the daily min, max, and mean for a 5-year historical data period.
	The data visualization using Google API.

3.	Interactive thermostat. 


**Heat Measures**

* a.	When temperature is between 10 and 20 degrees Celsius – Green LED remains on.  
	Traffic light indicator on Node-Red dashboard is Green
* b.	When temperature is between 21 and 24 degrees Celsius – Green LED turns off and Yellow LED turns on. 
	Traffic light indicator on Node-Red dashboard is Yellow.
* c.	When temperature is greater than or equal to 25 degrees Celsius – Green & Yellow LED off and Red LED turns on.  
	Traffic light indicator on Node-Red dashboard is Red
* d.	When temperature is greater than or equal to 25 degrees Celsius – DC motor with fan blades begins 
	to rotate and remains on until the temperature drops below 25 degrees

The "Ambient Workplace Status" light will change the color (green, yellow, red) depend on temperature selected by the user.

**Dew Point Measures**

If heating season selected and the dew point > 60F –  Bluemix sends out a request to turn on fan and displays a message “HEATING IN PROGRESS”
If cooling season selected and the dew point < 50F – Bluemix sends out a request to turn on fan and displays a message “COOLING IN PROGRESS”

**Dew Point Calculation**

Used an approximation.
1.	Let Tdp represent the dew point
2.	Let Tc represent temperature in Celsius
3.	Let b = 17.67
4.	Let c = 243.5 degrees Celsius
5.	Let h represent humidity data

1.	Calculate Gamma
b=17.67; c=243.5;
Ƴ = log(h / 100) + ((b * Tc) / (c + Tc));
2.	Calculate dew point
Tdp = ((c * Ƴ) / (b – Ƴ));

**EQUIPMENT REQUIRED**

*	Main board NUCLEO F401RE
*	Wi-Fi module
*	Temp sensor
*	Humidity sensor
*	Pressure sensor
*	Fan blade
*	1 x led green
*	1 x led yellow
*	1 x led red


**IMPLEMENTATION**

The IBM Bluemix used as a Node Red application container. 

1. Login with your IBM Bluemix credentials.

2. In the IBM Bluemix create “Internet of Things Platform Starter” application which based on the “IBM Watson IoT platform”. 
   By default it is creating DevOps IBM Bluemix service and the instance to access to the Node-Red Javascript editor.

3. Into the Node-Red Javascript editor necessary to import "dev-kits-st-nucleo-dashboard-0.2.json" file content and deploy.

The “Analyses” block used to accumulate and generate statistics and then transmit the aggregated data 
to the Web server through the web sockets. In order to accumulate and get the average for a period of time 
the “aggregator” node was added to the list of the nodes in the Node Red editor. 
It was included from the IBM Bluemix DevOps services. 

4. Open the “package.json” file in the “Eclipse Orion Web IDE” and add "node-red-contrib-aggregator":"1.0.4" and 
the "node-red-node-mysql":"0.0.16" node (this node will be used for the MySQL connector) to the end of “dependencies” list. 

5. Import the "fe" folder with the icons into the "images" folder and then rebuild and deploy the applicaton.
After deployment necessary to restart IBM Bluemix application.

Alternatively it can be done from the local computer by cloning the code using Git and then after modification 
commit and push it to the main repository.

The HTTP request/response nodes used to render HTML page. 
Web server on the GET request is rendering HTML page which is loading CSS and Javascript parts.

In the Javascript part there are two web socket listeners: 

a.	For the main data (Temperature, Humidity, and Pressure).
b.	For the aggregated data (minimum, maximum value for a defined period of time (1 minute for demo only)).

6. In order to the IBM IoT node (event receiver) was able to receive events necessary to add the unique API key and token 
into the "IBM IOT" node configuration. The API key and token can be found in the environment variables in the Cloud Foundry Application.
In order to check if the device is connected you can open the IBM Watson IOT platform service and click on the “Devices” tab.

7. The Google API key must added into the environment variables of the application (DevOps service -> Runtime)

With the current implementation if the temperature will be above the threshold 25.8 then the warning message will be displayed.

8. The next step is to create a device in the Watson IOT platform service.

The steps are here:

*a.	Lunch “Watson IOT platform service”.
*b.	Click on the “Devices” tab.
*c.	Click “Add Device” button.
*d.	Create device type.
*e.	Enter unique device id.
*f.	Enter optional parameters if necessary.
*g.	Click Finish.

The generated token will be used for the device configuration to connect to the IBM Bluemix Watson IOT service.
The device "id" and device "type" parameters additionally will be used to send the remote commands to the device.
The “IBM IOT event receiver” used to listen and transmit the main data to the Web server through web sockets. 

9. In order to store the historical data used a MySQL database.  

Steps to store data:

a.	Create a database “mhwdata”.
b.	Create  a table “wdata” using SQL script “wdata.sql”
c.	The provided “Montreal Weather Data.csv” file should be loaded into the MySQL database using the script named “load_csv.sql”.

10. In the IBM Bluemix Node Red application you should update the “mysql” node with your credentials.

The demo of the application is here:
https://stm-nucleo-demo.mybluemix.net/sensors

The "screenshots" folder contains the the screenshots of the web pages. 



