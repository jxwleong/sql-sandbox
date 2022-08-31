-- Original table https://www.programiz.com/sql/online-compiler/
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Shippings;  

DROP TABLE IF EXISTS DeliveryFactTable;
DROP TABLE IF EXISTS RestaurantDimensionTable ;
DROP TABLE IF EXISTS CustomerDimensionTable;
DROP TABLE IF EXISTS DriverDimensionTable;
DROP TABLE IF EXISTS LocationDimensionTable;
DROP TABLE IF EXISTS OrderDimensionTable;
DROP TABLE IF EXISTS PaymentDimensionTable;

CREATE TABLE DeliveryFactTable( 
  RES_ID INT NOT NULL,
  ORDER_ID INT NOT NULL,
  CUST_ID INT NOT NULL,
  DRIVER_ID INT NOT NULL,
  PAYMENT_ID INT NOT NULL,
  
  ORDER_STATUS varchar(50) NOT NULL,
  ORDER_AMT INT NOT NULL,
  
  DELIVERY_ID INT NOT NULL,
  DELIVERY_QUANTITY INT NOT NULL,
  DELIVERY_REVENUE INT NOT NULL,
  DELIVERY_PICKUPTIME INT NOT NULL,
  DELIVERY_ARRIVALTIME INT NOT NULL,
  
  PRIMARY KEY (DELIVERY_ID),
  FOREIGN KEY (RES_ID) REFERENCES RestaurantDimensionTable(RES_ID),
  FOREIGN KEY (ORDER_ID) REFERENCES OrderDimensionTable(ORDER_ID),
  FOREIGN KEY (CUST_ID) REFERENCES CustomerDimensionTable(CUST_ID),
  FOREIGN KEY (PAYMENT_ID) REFERENCES PaymentDimensionTable(PAYMENT_ID),
  FOREIGN KEY (DRIVER_ID) REFERENCES DriverDimensionTable(DRIVER_ID)
);

CREATE TABLE RestaurantDimensionTable( 
  RES_ID INT NOT NULL,
  RES_NAME varchar(100) NOT NULL,
  RES_TEL varchar(100) NOT NULL,
  RES_CATEGORY varchar(100) NOT NULL,
  
  PRIMARY KEY (RES_ID)
);

CREATE TABLE CustomerDimensionTable( 
  CUST_ID INT NOT NULL,
  CUST_NAME varchar(100) NOT NULL,
  CUST_TEL int NOT NULL,
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
  ORDER_STATUS varchar(100) NOT NULL,
  ORDER_AMT varchar(100) NOT NULL,
  ORDER_YEAR varchar(100) NOT NULL,
  ORDER_MONTH INT NOT NULL,
  ORDER_DAY INT NOT NULL,
  ORDER_TIME INT NOT NULL,
  
  PRIMARY KEY (ORDER_ID)
);

CREATE TABLE PaymentDimensionTable( 
  PAYMENT_ID INT NOT NULL,
  PROMO_CODE INT NOT NULL,
  PAYMENT_METHOD varchar(100) NOT NULL,
  PAYMENT_AMOUNT INT NOT NULL,
  
  PRIMARY KEY (PAYMENT_ID)
);


-- Restaurant Data
-- 1. Miyabi, Jalan Utara C Sheraton Petaling Jaya Hotel, Petaling Jaya 46200 Malaysia, +60 3-7622 8999
-- 2. Fatty Crab Restaurant, No 2 Jalan SS 24/13 Taman Megah, Petaling Jaya 47301 Malaysia, +60 3-7804 5758
-- 3. Khan's Indian Cuisine, Jalan Kerinchi Unit 1-7, 1-8, 1-9, 1-10, Level 1, The Sphere, No.1, Avenue 1, Bangsar South City, No.8,, Kuala Lumpur 59200 Malaysia, +60 17-865 4661
-- 4. Nizza, No 6 Jalan Damanlela Bukit Damansara Sofitel Kuala Lumpur Damansara, Kuala Lumpur 50490 Malaysia, +60 3-2720 6628
-- 5. Makan Kitchen, The Intermark, 348 Jalan Tun Razak, The Intermark, 348 Jalan Tun Razak,, Kuala Lumpur 50400 Malaysia, +60 3-2172 7272
-- 6. Positano Risto, Jalan Dutamas 1 Block C1, Lot 2, Level G3, Publika Shopping Gallery, Solaris Dutamas, No. 1, Kuala Lumpur 50480 Malaysia, +60 3-6411 3799
-- 7. LOKL Coffee Co., 30 Jalan Tun H S Lee, Kuala Lumpur 50100 Malaysia, +60 18-968 5515
-- 8. Chambers Grill, 3 Jalan Stesen Sentral, Kuala Lumpur 50470 Malaysia, +60 3-2264 2264
INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (1, "Miyabi", "+60 3-7622 8999", "Japanese");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (2, "Fatty Crab Restaurant", "+60 3-7804 5758", "Chinese");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (3, "Khan's Indian Cuisine", "+60 17-865 4661", "Indian");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (4, "Nizza", "+60 3-2720 6628", "French");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (5, "Makan Kitchen", "+60 3-2172 7272", "Chinese");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (6, "Positano Risto", "+60 3-6411 3799", "Italian");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (7, "LOKL Coffee Co.", "+60 18-968 5515", "Cafe");

INSERT INTO RestaurantDimensionTable (RES_ID, RES_NAME, RES_TEL, RES_CATEGORY)
VALUES (5, "Chambers Grill", "+60 3-2264 2264", "Steakhouse");
