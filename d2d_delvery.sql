-- Online SQL Editor to Run SQL Online.
-- Use the editor to create new tables, insert data and all other SQL operations.
  
DROP TABLE Customers;
DROP TABLE Orders;
DROP TABLE Shippings;

CREATE TABLE DeliveryFactTable( 
  RES_ID INT NOT NULL,
  ORDER_ID INT NOT NULL,
  CUST_ID INT NOT NULL,
  PAYTMENT_ID INT NOT NULL,
  ORDER_STATUS varchar(50) NOT NULL,
  ORDER_AMT INT NOT NULL,
  CUST_LOCATION_ID varchar(100) NOT NULL,
  REST_LOCATION_ID varchar(100) NOT NULL
);

CREATE TABLE RestaurantDimensionTable( 
  RES_NAME varchar(100) NOT NULL,
  RES_TEL varchar(100) NOT NULL,
  RES_CATEGORY varchar(100) NOT NULL
);

CREATE TABLE CustomerDimensionTable( 
  CUST_NAME varchar(100) NOT NULL,
  CUST_TEL varchar(100) NOT NULL,
  CUST_PWORD varchar(100) NOT NULL
);

CREATE TABLE DriverDimensionTable( 
  DRIVER_NAME varchar(100) NOT NULL,
  DRIVER_TEL varchar(100) NOT NULL,
  DRIVER_IC_NUM varchar(100) NOT NULL,
  DRIVER_CAR_BRAND varchar(100) NOT NULL,
  DRIVER_CAR_NUMPLATE varchar(100) NOT NULL
);

CREATE TABLE LocationDimensionTable( 
  LocationID varchar(100) NOT NULL,
  State varchar(100) NOT NULL,
  City varchar(100) NOT NULL,
  Zip INT NOT NULL,
  Street varchar(100) NOT NULL
);

CREATE TABLE OrderDimensionTable( 
  ORDER_STATUS varchar(100) NOT NULL,
  ORDER_AMT varchar(100) NOT NULL,
  ORDER_YEAR varchar(100) NOT NULL,
  ORDER_MONTH INT NOT NULL,
  ORDER_DAY INT NOT NULL,
  ORDER_TIME INT NOT NULL
);

CREATE TABLE PaymentDimensionTable( 
  PROMO_CODE INT NOT NULL,
  PAYMENT_METHOD varchar(100) NOT NULL,
  PAYMENT_AMOUNT INT NOT NULL
);
