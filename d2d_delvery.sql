IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'd2d_delivery')
  BEGIN
    CREATE DATABASE d2d_delivery
  END
  GO
     USE d2d_delivery
  GO

/* https://stackoverflow.com/a/23293136 */


DROP TABLE IF EXISTS DeliveryFactTable;
DROP TABLE IF EXISTS RestaurantDimensionTable;
DROP TABLE IF EXISTS CustomerDimensionTable;
DROP TABLE IF EXISTS DriverDimensionTable;
DROP TABLE IF EXISTS LocationDimensionTable;
DROP TABLE IF EXISTS OrderDimensionTable;
DROP TABLE IF EXISTS PaymentDimensionTable;




CREATE TABLE  RestaurantDimensionTable( 
  RES_ID INT NOT NULL,
  RES_NAME varchar(100) NOT NULL,
  RES_TEL varchar(100) NOT NULL,
  RES_CATEGORY varchar(100) NOT NULL,
  
  PRIMARY KEY (RES_ID) 
);

CREATE TABLE CustomerDimensionTable( 
  CUST_ID INT NOT NULL,
  CUST_NAME varchar(100) NOT NULL,
  CUST_TEL varchar(100) NOT NULL,
  CUST_PWORD varchar(100) NOT NULL,
  
  PRIMARY KEY (CUST_ID)
);

CREATE TABLE DriverDimensionTable( 
  DRIVER_ID INT NOT NULL,
  DRIVER_NAME varchar(100) NOT NULL,
  DRIVER_TEL varchar(100) NOT NULL,
  DRIVER_IC_NUM varchar(100) NOT NULL,
  DRIVER_CAR_BRAND varchar(100) NOT NULL,
  DRIVER_CAR_NUMPLATE varchar(100) NOT NULL,
  
  PRIMARY KEY (DRIVER_ID)
);

CREATE TABLE LocationDimensionTable( 
  LOCATION_ID INT NOT NULL,
  STATE varchar(100) NOT NULL,
  CITY varchar(100) NOT NULL,
  ZIP INT NOT NULL,
  STREET varchar(100) NOT NULL,
  
  PRIMARY KEY (LOCATION_ID)
);

CREATE TABLE OrderDimensionTable( 
  ORDER_ID INT NOT NULL,
  ORDER_YEAR INT NOT NULL,
  ORDER_MONTH INT NOT NULL,
  ORDER_DAY INT NOT NULL,
  ORDER_TIME TIME NOT NULL,
  
  PRIMARY KEY (ORDER_ID)
);

CREATE TABLE PaymentDimensionTable( 
  PAYMENT_ID INT NOT NULL,
  PROMO_CODE varchar(5) NOT NULL,
  PAYMENT_METHOD varchar(100) NOT NULL,
  PAYMENT_AMOUNT FLOAT(2) NOT NULL,
  
  PRIMARY KEY (PAYMENT_ID)
);


CREATE TABLE DeliveryFactTable( 
  RES_ID INT NOT NULL,
  ORDER_ID INT NOT NULL,
  CUST_ID INT NOT NULL,
  DRIVER_ID INT NOT NULL,
  PAYMENT_ID INT NOT NULL,
  CUST_LOCATION_ID INT NOT NULL,
  RES_LOCATION_ID INT NOT NULL,
  
  ORDER_STATUS varchar(50) NOT NULL,
  ORDER_AMT FLOAT(2) NOT NULL,
  
  DELIVERY_ID INT NOT NULL,
  DELIVERY_QUANTITY INT NOT NULL,
  DELIVERY_REVENUE FLOAT(2) NOT NULL,
  DELIVERY_PICKUPTIME datetime NOT NULL,
  DELIVERY_ARRIVALTIME datetime NOT NULL,
  
  PRIMARY KEY (DELIVERY_ID),
  FOREIGN KEY (RES_ID) REFERENCES RestaurantDimensionTable(RES_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES OrderDimensionTable(ORDER_ID),
  FOREIGN KEY (CUST_ID) REFERENCES CustomerDimensionTable(CUST_ID),
  FOREIGN KEY (PAYMENT_ID) REFERENCES PaymentDimensionTable(PAYMENT_ID),
  FOREIGN KEY (DRIVER_ID) REFERENCES DriverDimensionTable(DRIVER_ID),
  FOREIGN KEY (CUST_LOCATION_ID) REFERENCES LocationDimensionTable(LOCATION_ID),
  FOREIGN KEY (RES_LOCATION_ID) REFERENCES LocationDimensionTable(LOCATION_ID)
);

/*
Restaurant Data
1. Miyabi, Jalan Utara C Sheraton Petaling Jaya Hotel, Petaling Jaya 46200 Malaysia, +60 3-7622 8999
2. Fatty Crab Restaurant, No 2 Jalan SS 24/13 Taman Megah, Petaling Jaya 47301 Malaysia, +60 3-7804 5758
3. Khan's Indian Cuisine, Jalan Kerinchi Unit 1-7, 1-8, 1-9, 1-10, Level 1, The Sphere, No.1, Avenue 1, Bangsar South City, No.8,, Kuala Lumpur 59200 Malaysia, +60 17-865 4661
4. Nizza, No 6 Jalan Damanlela Bukit Damansara Sofitel Kuala Lumpur Damansara, Kuala Lumpur 50490 Malaysia, +60 3-2720 6628
5. Makan Kitchen, The Intermark, 348 Jalan Tun Razak, The Intermark, 348 Jalan Tun Razak,, Kuala Lumpur 50400 Malaysia, +60 3-2172 7272
6. Positano Risto, Jalan Dutamas 1 Block C1, Lot 2, Level G3, Publika Shopping Gallery, Solaris Dutamas, No. 1, Kuala Lumpur 50480 Malaysia, +60 3-6411 3799
7. LOKL Coffee Co., 30 Jalan Tun H S Lee, Kuala Lumpur 50100 Malaysia, +60 18-968 5515
8. Chambers Grill, 3 Jalan Stesen Sentral, Kuala Lumpur 50470 Malaysia, +60 3-2264 2264
*/

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (1, 'Miyabi', '+60 3-7622 8999', 'Japanese');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (2, 'Fatty Crab Restaurant', '+60 3-7804 5758', 'Chinese');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (3, 'Khan"s Indian Cuisine', '+60 17-865 4661', 'Indian');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (4, 'Nizza', '+60 3-2720 6628', 'French');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (5, 'Makan Kitchen', '+60 3-2172 7272', 'Chinese');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (6, 'Positano Risto', '+60 3-6411 3799', 'Italian');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (7, 'LOKL Coffee Co.', '+60 18-968 5515', 'Cafe');
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (8, 'Chambers Grill', '+60 3-2264 2264', 'Steakhouse');


/*
Customer Data
1. John Doe, +60 12- 100 1234, doedoe123
2. Karen Doe, +60 12- 100 1235, karendoe11
3. Johnny Ali, +60 12- 100 1240, ali123!
4. Jessica Wall, +60 12- 100 1299, jeswall99
5. Jane Doe, +60 12- 101 1234, jdoe123
6. Kanye Doe, +60 12- 101 1235, kyDoe11
7. Muhammad Abu, +60 12- 101 1240, abuM122!
8. Siti Mariam, +60 12- 101 1299, smariam1991
*/

INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (1, 'John Doe', '+60 12- 100 1234', 'doedoe123');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (2, 'Karen Doe', '+60 12- 100 1235', 'karendoe11');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (3, 'Johnny Ali', '+60 12- 100 1240', 'ali123!');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (4, 'Jesicca Wall', '+60 12- 100 1299', 'jeswall99');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (5, 'Jane Doe', '+60 12- 101 1234', 'jdoe123');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (6, 'Kanye Doe', '+60 12- 101 1235', 'kyDoe11');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (7, 'Muhammad Abu', '+60 12- 101 1240', 'abuM122!');
INSERT INTO CustomerDimensionTable (CUST_ID, CUST_NAME, CUST_TEL, CUST_PWORD)
VALUES (8, 'Siti Mariam', '+60 12- 101 1299', 'smariam1991');


/*Driver Data
1. Mike Jones, +60 12- 102 1234, 970101-01-1231, Honda, VAX1299
2. David Gunther, +60 12- 102 1235, 920130-01-12879, Toyota, WWA5880
3. Clinton Wood, +60 12- 102 1240, 880101-05-1233, Suzuki, JAN1444
4. Rick Wall, +60 12- 102 1299, 870101-07-1265, Honda, TAN1266
5. Johnny Wood, +60 12- 103 1246, 881230-05-7701, Suzuki, JNA1789
6. Jimmy Doe, +60 12- 103 1399, 871111-07-1111, Honda, TAM5555
*/

INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (1, 'Mike Jones', '+60 12- 102 1234', '970101-01-1231', 'Honda', 'VAX1299');
INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (2, 'David Gunther', '+60 12- 102 1235', '920130-01-12879', 'Toyota', 'WWA5880');
INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (3, 'Clinton Wood', '+60 12- 102 1240', '880101-05-1233', 'Suzuki', 'JAN1444');
INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (4, 'Rick Wall', '+60 12- 102 1299', '870101-07-1265', 'Honda', 'TAN1266');
INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (5, 'Johnny Wood', '+60 12- 103 1246', '881230-05-7701', 'Suzuki', 'JNA1789');
INSERT INTO DriverDimensionTable (DRIVER_ID, DRIVER_NAME, DRIVER_TEL, DRIVER_IC_NUM, DRIVER_CAR_BRAND, DRIVER_CAR_NUMPLATE)
VALUES (6, 'Jimmy Doe', '+60 12- 103 1399', '871111-07-1111', 'Honda', 'TAM5555');
;
/*Location Data
Customer
1. 'Selangor', 'Petaling Jaya', 47301, '2, Jalan SS 7/26, Ss 7'
2. 'Selangor', 'Petaling Jaya', 46300, 'Jalan 22/44 Seksyen 22, Kampung Tunku'
3. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 53100, 'Jalan Sentosa 2, Batu 7 Gombak'   
4. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 43300 , 'Jalan Cemara, Taman Bukit Serdang'
5. 'Selangor', 'Klang', 41300 , Jalan Batu Tiga Lama'
6. 'Selangor', 'Petaling Jaya', 47301, 'Jalan PJU 1/42, Dataran Prima'

Restaurant
7. 'Selangor', 'Petaling Jaya', 46200, 'Lorong Utara C, Pjs 52'
8. 'Selangor', 'Petaling Jaya', 47301, ' 2, Jalan SS 24/13, Taman Megah'
9. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 59000, 'No.8, Level 1, The Sphere No.1, Avenue 1, Jalan Kerinchi, Bangsar South'
10. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50490, 'Level 3, Sofitel Kuala Lumpur Damansara, No. 6, Jalan Damanlela, Bukit Damansara'
11. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50400, '348, Jln Tun Razak, Kampung Datuk Keramat'
12. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50480, 'Block C1, Lot 2, Level G3, Publika Shopping Gallery, No. 1, Jln Dutamas 1, Solaris Dutamas'
13. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50100, '30, Jalan Tun H S Lee, City Centre'
14. 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50470, 'Lobby Level, 3, Jalan Stesen Sentral'
*/

INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (1, 'Selangor', 'Petaling Jaya', 47301, '2, Jalan SS 7/26, Ss 7');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (2, 'Selangor', 'Petaling Jaya', 46300, 'Jalan 22/44 Seksyen 22, Kampung Tunku');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (3, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 53100, 'Jalan Sentosa 2, Batu 7 Gombak');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (4, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 43300 , 'Jalan Cemara, Taman Bukit Serdang');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (5, 'Selangor', 'Klang', 41300 , 'Jalan Batu Tiga Lama');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (6, 'Selangor', 'Petaling Jaya', 47301, 'Jalan PJU 1/42, Dataran Prima');

INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (7, 'Selangor', 'Petaling Jaya', 46200, 'Lorong Utara C, Pjs 52');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (8, 'Selangor', 'Petaling Jaya', 47301, ' 2, Jalan SS 24/13, Taman Megah');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (9, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 59000, 'No.8, Level 1, The Sphere No.1, Avenue 1, Jalan Kerinchi, Bangsar South');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (10, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50490, 'Level 3, Sofitel Kuala Lumpur Damansara, No. 6, Jalan Damanlela, Bukit Damansara');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (11, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50400, '348, Jln Tun Razak, Kampung Datuk Keramat');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (12, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50480, 'Block C1, Lot 2, Level G3, Publika Shopping Gallery, No. 1, Jln Dutamas 1, Solaris Dutamas');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (13, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50100, '30, Jalan Tun H S Lee, City Centre');
INSERT INTO LocationDimensionTable (LOCATION_ID, STATE, CITY, ZIP, STREET)
VALUES (14, 'Wilayah Persekutuan Kuala Lumpur', 'Kuala Lumpur', 50470, 'Lobby Level, 3, Jalan Stesen Sentral');
        
/*
Payment Data
1. 'NA', 'TnG Ewallet', 50.00
2. 'ACXAA', 'Cash on Delivery', 30.50
3. 'NA', 'Credit Card', 100.35
4. '50OFF', 'Debit Card', 22.50
5. 'NA', 'TnG Ewallet', 30.00
6. 'ACXZZ', 'Cash on Delivery', 37.50
7. 'NA', 'Credit Card', 77.35
8. '50OFF', 'Credit Card', 45.50
*/

INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (1, 'NA', 'TnG Ewallet', 50.00);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (2, 'ACXAA', 'Cash on Delivery', 30.50);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (3, 'NA', 'Credit Card', 100.35);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (4, '50OFF', 'Debit Card', 22.50);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (5, 'NA', 'TnG Ewallet', 30.00);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (6, 'ACXZZ', 'Cash on Delivery', 37.50);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (7, 'NA', 'Credit Card', 77.35);
INSERT INTO PaymentDimensionTable (PAYMENT_ID, PROMO_CODE, PAYMENT_METHOD, PAYMENT_AMOUNT)
VALUES (8, '50OFF', 'Credit Card', 45.50);

/*
Order Data
1. 'Completed', 2022, 08, 1, '09:00:25'
2. 'Completed', 2022, 08, 2, '10:10:30'
3. 'Completed', 2022, 08, 2, '13:10:30'
4. 'Completed', 2022, 08, 2, '15:25:20'
5. 'Completed', 2022, 08, 3, '10:00:45'
6. 'Completed', 2022, 08, 3, '11:13:44'
7. 'Completed', 2022, 08, 3, '12:30:45'
8. 'Completed', 2022, 08, 3, '17:00:12'
*/
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (1, 2022, 08, 1, '09:00:25');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (2, 2022, 08, 2, '10:10:30');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (3, 2022, 08, 2, '13:10:30');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (4, 2022, 08, 2, '15:25:20');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (5, 2022, 08, 3, '10:00:45');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (6, 2022, 08, 3, '11:13:44');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (7, 2022, 08, 3, '12:30:45');
INSERT INTO OrderDimensionTable (ORDER_ID, ORDER_YEAR, ORDER_MONTH, ORDER_DAY, ORDER_TIME)
VALUES (8, 2022, 08, 3, '17:00:12');


INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(1, 1, 1, 1, 1, 1, 7, 'Completed', 43.00, 1, 1, 7.00, '2022-08-01 09:25:00', '2022-08-01 09:45:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(2, 2, 2, 2, 2, 2, 8, 'Completed', 25.50, 2, 1, 5.00, '2022-08-02 10:40:00', '2022-08-02 11:00:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(3, 3, 3, 3, 3, 3, 9, 'Completed', 90.35, 3, 1, 10.00, '2022-08-02 13:30:00', '2022-08-02 13:45:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(4, 4, 4, 4, 4, 4, 10, 'Completed', 16.50, 4, 1, 6.00, '2022-08-02 16:00:00', '2022-08-02 16:30:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(5, 5, 5, 5, 5, 5, 11, 'Completed', 26.00, 5, 1, 4.00, '2022-08-03 10:15:00', '2022-08-03 10:45:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(6, 6, 6, 6, 6, 6, 12, 'Completed', 32.50, 6, 1, 5.00, '2022-08-03 11:40:00', '2022-08-03 12:20:00');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(7, 7, 7, 1, 7, 1, 13, 'Completed', 68.35, 7, 1, 9.00, '2022-08-03 12:50:30', '2022-08-02 13:20:45');
INSERT INTO DeliveryFactTable (RES_ID, ORDER_ID, CUST_ID, DRIVER_ID, PAYMENT_ID, CUST_LOCATION_ID, RES_LOCATION_ID,
                               ORDER_STATUS, ORDER_AMT, DELIVERY_ID, DELIVERY_QUANTITY, DELIVERY_REVENUE, DELIVERY_PICKUPTIME,
                               DELIVERY_ARRIVALTIME)
VALUES(8, 8, 8, 3, 8, 3, 14, 'Completed', 37.50, 8, 1, 8.00, '2022-08-03 17:30:00', '2022-08-02 18:00:00');


/* Join tutorial: https://www.youtube.com/watch?v=TGt2xa7EzvI&ab_channel=DatabaseStar*/


/*
QUERY
a. group by with rollup and order by clauses
b. group by with cube and order by clauses
c. stored procedure
d. trigger
e. group by with grouping sets clauses
*/

-- a. group by with rollup and order by clauses
SELECT STATE as RESTAURANT_STATE, CITY as RESTAURANT_CITY,
    sum(delivery_revenue) as 'DELIVERY_REVENUE_SUM (RM)'
FROM deliveryfacttable 
INNER join locationdimensiontable
ON deliveryfacttable.CUST_LOCATION_ID = locationdimensiontable.LOCATION_ID

GROUP BY
	ROLLUP(STATE, CITY);

-- GROUP BY ORDER_ID, CUST_LOCATION_ID, CITY, STATE; -- https://stackoverflow.com/a/13999935

-- b. group by with cube and order by clauses
SELECT STATE as CUSTOMER_STATE, CITY as CUSTOMER_CITY,
    sum(ORDER_AMT) as 'ORDER_AMT (RM)'
FROM deliveryfacttable 
INNER join locationdimensiontable
ON deliveryfacttable.CUST_LOCATION_ID = locationdimensiontable.LOCATION_ID

GROUP BY
	CUBE(STATE, CITY);


-- c. stored procedure
-- https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver16
DROP PROCEDURE IF EXISTS GetCustomerInformation;
GO
CREATE PROCEDURE GetCustomerInformation @CustomerName varchar(100)
AS BEGIN
SELECT * 
FROM CustomerDimensionTable 
WHERE CHARINDEX(@CustomerName, CUST_NAME) > 0;
END
GO

EXECUTE GetCustomerInformation @CustomerName = 'Doe';


-- d. trigger

GO
CREATE TRIGGER CustomerTelephoneNumberCheck ON CustomerDimensionTable FOR UPDATE
AS
BEGIN
	DECLARE @CUST_ID INT;
	DECLARE @OLD_TEL varchar(20);
	DECLARE @NEW_TEL varchar(20);

	SELECT @CUST_ID = CUST_ID from inserted;
	SELECT @OLD_TEL = CUST_TEL from deleted;
	SELECT @NEW_TEL = CUST_TEL from inserted;

	if (@OLD_TEL = @NEW_TEL)
	BEGIN
		RAISERROR('Customer ID: %i existing phone number already="%s"', 16, 1, @CUST_ID, @NEW_TEL);
		ROLLBACK;
	END
END
GO

/*
UPDATE CustomerDimensionTable
SET CUST_TEL='+60 12- 100 1234'
WHERE CUST_ID = 1;
*/
UPDATE CustomerDimensionTable
SET CUST_TEL='+60 12- 100 1233'
WHERE CUST_ID = 1;

Select * from CustomerDimensionTable;


-- e. group by with grouping sets clauses
SELECT
	-- https://www.youtube.com/watch?v=h25K5S998fA&ab_channel=kudvenkat
	Case When GROUPING(STATE) = 1 Then 'Total' ELSE ISNULL(STATE, 'Unkown') END AS RESTAURANT_STATE,
	Case When GROUPING(CITY) = 1 Then 'Total' ELSE ISNULL(CITY, 'Unknown') END AS RESTAURANT_CITY,
    sum(ORDER_AMT) as 'ORDER_AMT (RM)'
FROM deliveryfacttable 
INNER join locationdimensiontable
ON deliveryfacttable.CUST_LOCATION_ID = locationdimensiontable.LOCATION_ID

GROUP BY CUBE(STATE, CITY);
