create database CarRental;
USE CarRental;
CREATE TABLE Categories(
	Category_ID int not null,
	Category_Label varchar(10),
    PRIMARY KEY (Category_ID)
);
CREATE TABLE Cars (
	VIN varchar(20) not null,
    Color varchar(10),
    Brand varchar(20),
    Model varchar(20),
    Category_ID int,
    PRIMARY KEY (VIN)
);

CREATE TABLE Locations (
	Location_ID int not null ,
    Country varchar(20),
    State varchar(20),
    Street_NO varchar(10),
    Street varchar(20),
    City varchar(20),
    PRIMARY KEY (Location_ID)
);
CREATE TABLE Phones (
	Phone_NO varchar(13) not null,
    Location_ID int not null,
    PRIMARY KEY (Location_ID , Phone_NO)
);
CREATE TABLE Customers (
	Customer_ID int not null,
    Customer_Name varchar(20) not null,
    Phone_NO varchar(13) not null,
    State varchar(20),
    Country varchar(20),
    PRIMARY KEY (Customer_ID)
);
CREATE TABLE Reservations (
	Reservation_ID int not null ,
    Car_VIN varchar(10) not null,
    Cust_ID int not null,
    Location_ID int not null,
    Pickup_date DATE not null,
    Return_date DATE not null,
    Amount float not null,
    PRIMARY KEY (Reservation_ID)
);

ALTER TABLE Cars ADD CONSTRAINT cat_id FOREIGN KEY (Category_ID) references Categories (Category_ID)
	on delete cascade on update cascade;
    
ALTER TABLE Phones ADD CONSTRAINT loc_id FOREIGN KEY (Location_ID) references Locations (Location_ID)
	on delete cascade on update cascade;
    
ALTER TABLE Reservations ADD CONSTRAINT cust_id FOREIGN KEY (Cust_ID) references Customers (Customer_ID)
	on delete cascade on update cascade;
ALTER TABLE Reservations ADD CONSTRAINT car_vin FOREIGN KEY (Car_VIN) references Cars (VIN)
	on delete cascade on update cascade;
ALTER TABLE Reservations ADD CONSTRAINT location_id FOREIGN KEY (Location_ID) references Locations (Location_ID)
	on delete cascade on update cascade;

ALTER TABLE Categories
ADD CONSTRAINT CHECK (Category_ID > 0 AND Category_ID < 4);

ALTER TABLE Reservations 
ADD CONSTRAINT CHECK (Return_date >= Pickup_date );

ALTER TABLE Phones
MODIFY COLUMN Phone_NO character(13);

ALTER TABLE Customers
MODIFY COLUMN Phone_NO character(13);

INSERT INTO Categories VALUES (1,'Hatchback');
INSERT INTO Categories VALUES (2,'PrimeSedan');
INSERT INTO Categories VALUES (3,'SUV');

INSERT INTO Cars VALUES ('KA04P3633','Golden','Suzuki','Maruti800',1);
INSERT INTO Cars VALUES ('KA02H4543','Mustard','Suzuki','WagonR',1);
INSERT INTO Cars VALUES ('KA03X127','Black','Honda','Civic',2);
INSERT INTO Cars VALUES ('MH01Y4325','Red','Audi','Q5',3);
INSERT INTO Cars VALUES ('TS45MN32','White','BMW','3Series',2);
INSERT INTO Cars VALUES ('TN77A129','Blue','Hyundai','I20',1);
INSERT INTO Cars VALUES ('DL88RF2167','White','Volkswagen','Ameo',2);
INSERT INTO Cars VALUES ('PY09HU657','Brown','Mahindra','Scorpio',3);
INSERT INTO Cars VALUES ('GJ69NB4765','Black','Tata','Indigo',2);
INSERT INTO Cars VALUES ('TN64GF8901','White','Tata','Hexa',3);

INSERT INTO Customers VALUES (23,'Satish','080984543029','Karnataka','India');
INSERT INTO Customers VALUES (123,'Suresh','9197657320198','TamilNadu','India');
INSERT INTO Customers VALUES (897,'Manjula','9189980913517','Telangana','India');
INSERT INTO Customers VALUES (980,'Tripti','2198765432190','Delhi','India');
INSERT INTO Customers VALUES (65,'Anupama','9109903316316','Maharashtra','India');
INSERT INTO Customers VALUES (435,'Nitish','9809034598042','Karnataka','India');
INSERT INTO Customers VALUES (705,'Supreet Ronad','9809789096514','Maharashtra','India');
INSERT INTO Customers VALUES (632,'Sandeep Bhat','9119032568195','TamilNadu','India');
INSERT INTO Customers VALUES (706,'Shashank GS','7897689543209','Gujarat','India');
INSERT INTO Customers VALUES (684,'Sathvik Saya','0988769543109','Pondicherry','India');

INSERT INTO Locations VALUES (1,'India','Karnataka','21A','Vijaynagar','Bangalore');
INSERT INTO Locations VALUES (2,'India','Karnataka','9B','MG Road','Mysuru');
INSERT INTO Locations VALUES (3,'India','Maharashtra','77','ALP Colony','Mumbai');
INSERT INTO Locations VALUES (4,'India','Gujarat','66J','Margosa Road','Gandhinagar');
INSERT INTO Locations VALUES (5,'India','Maharashtra','89K','ECity','Thane');
INSERT INTO Locations VALUES (6,'India','TamilNadu','6D','RRNagar','Chennai');
INSERT INTO Locations VALUES (7,'India','Telangana','88P','Kalasipalya','Hyderabad');
INSERT INTO Locations VALUES (8,'India','Telangana','8C','Madivala','Warangal');
INSERT INTO Locations VALUES (9,'India','Pondicherry','98R','HST Layout','Auroville');
INSERT INTO Locations VALUES (10,'India','Karnataka','34K','Subbaih Road','Chitradurga');

ALTER TABLE Locations
ADD CONSTRAINT CHECK (Location_ID > 0 AND Location_ID < 11);

INSERT INTO Phones VALUES ('0802435261780',1);
INSERT INTO Phones VALUES ('0802435261781',1);
INSERT INTO Phones VALUES ('0794516273901',2);
INSERT INTO Phones VALUES ('0794516273900',2);
INSERT INTO Phones VALUES ('0092837190829',3);
INSERT INTO Phones VALUES ('8903241561728',4);
INSERT INTO Phones VALUES ('8903241561729',4);
INSERT INTO Phones VALUES ('8802134253678',5);
INSERT INTO Phones VALUES ('6789087654352',6);
INSERT INTO Phones VALUES ('6789087654351',6);
INSERT INTO Phones VALUES ('1007865431928',7);
INSERT INTO Phones VALUES ('1906578421980',8);
INSERT INTO Phones VALUES ('9702341562718',9);
INSERT INTO Phones VALUES ('9702341562719',9);
INSERT INTO Phones VALUES ('9702341562710',9);
INSERT INTO Phones VALUES ('8895641327890',10);
INSERT INTO Phones VALUES ('8895641372890',10);

INSERT INTO Reservations VALUES (1265,'KA04P3633',23,1,'2020-08-02','2020-08-02',450);
INSERT INTO Reservations VALUES (1288,'KA02H4543',706,3,'2020-07-23','2020-07-25',3200);
INSERT INTO Reservations VALUES (243,'DL88RF2167',980,4,'2020-07-12','2020-07-18',7820);
INSERT INTO Reservations VALUES (2318,'PY09HU657',684,9,'2020-06-01','2020-06-01',1200);
INSERT INTO Reservations VALUES (4536,'TN77A129',632,6,'2020-05-18','2020-05-18',760);
INSERT INTO Reservations VALUES (190,'TN64GF8901',897,8,'2020-06-12','2020-06-12',1090);
INSERT INTO Reservations VALUES (5687,'MH01Y4325',435,4,'2020-05-27','2020-05-31',10000);
INSERT INTO Reservations VALUES (90,'GJ69NB4765',123,4,'2020-08-12','2020-08-13',1200);
INSERT INTO Reservations VALUES (2309,'KA02H4543',23,1,'2020-09-13','2020-09-14',1380);
INSERT INTO Reservations VALUES (789,'KA02H4543',705,2,'2020-05-19','2020-05-20',1380);
INSERT INTO Reservations VALUES (1980,'DL88RF2167',23,4,'2020-06-18','2020-06-18',420);

-- retrivew names of customers who have reserved car no KA02MH4543
SELECT C.Customer_Name
FROM Customers as C
WHERE EXISTS ( SELECT *
				FROM Reservations as R
				WHERE R.Car_VIN = 'KA02H4543' AND R.Cust_ID = C.Customer_ID);
                
-- retriew names and phone number of customers who have no reservations.
SELECT C.Customer_Name , C.Phone_NO
FROM Customers as C
WHERE NOT EXISTS ( SELECT *
					FROM Reservations as R
                    WHERE C.Customer_ID = R.Cust_ID);

-- find all car number and their model which have no reservation
SELECT C.VIN , C.Model
FROM Cars as C
WHERE NOT EXISTS ( SELECT *
					FROM Reservations as R
                    WHERE R.Car_VIN = C.VIN);

-- AGREGATE FUNCTIONS

-- find total amount, avg amount and highest amount among all the reservations
SELECT avg(Amount) as AVERAGE_AMOUNT, MAX(Amount) as MAX_AMOUNT, SUM(Amount) as SUM_AMOUNT
FROM Reservations
WHERE Location_ID = 4 OR Location_ID = 1;

-- for each car which has more than one reservations retriew the car number and model
SELECT VIN , Model
FROM Cars, Reservations
WHERE VIN = Car_VIN
GROUP BY VIN, Model
HAVING COUNT(*) > 1;

-- find the number of reservations whose amount is greater than 1000
SELECT COUNT(*) as COUNT
FROM Reservations
WHERE Amount>1000;

-- OUTER JOINS

-- return all customer name and their phone number who have made atleast one reservations.
SELECT Distinct Customer_Name, Phone_NO, Reservation_ID, Amount
FROM Customers LEFT OUTER JOIN Reservations ON Customer_ID = Cust_ID
ORDER BY 1;


-- find the count of cars under each category which are rented.
SELECT Categories.Category_ID, Category_Label, Count(1) as No_of_reservations_of_each_category
								FROM Cars LEFT OUTER JOIN Categories ON Cars.Category_ID = Categories.Category_ID
								WHERE EXISTS (SELECT Distinct VIN
												FROM Cars LEFT OUTER JOIN Reservations ON VIN = Car_VIN) GROUP BY Category_ID, Category_Label;
                                                


CREATE TABLE Customers_Audit (
	Customer_ID int not null,
    Customer_Name varchar(20) not null,
	Action VARCHAR(50) ,
    UpdateDate DATETIME,
    PRIMARY KEY (Customer_ID)
);


-- Trigger to store any update made to the customers column
CREATE TRIGGER Before_Update 
    BEFORE UPDATE ON Customers
    FOR EACH ROW 
 INSERT INTO Customers_Audit
 SET action = 'UPDATE',
     Customer_ID = OLD.Customer_ID,
     Customer_Name = OLD.Customer_Name,
     UpdateDate = NOW();

Use CarRental;
UPDATE Customers
SET Phone_NO='9107654302918'
 WHERE Customer_ID=23;

select * FROM Customers_Audit;


-- trigger to check if a car VIN is valid before entering into the database.
delimiter $$
CREATE TRIGGER Car_Insert_Value before insert on Cars
FOR EACH ROW
BEGIN
IF NEW.VIN not rlike '^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{1,4}$'
THEN
signal sqlstate '45000' set message_text = 'NOT A VALID CAR REGISTRATION NUMBER' ;
 END IF;
END;

INSERT INTO Cars VALUES ('KA9H890','Yellow','Maruti','Brezza',3);
INSERT INTO Cars VALUES ('KA04JH7890','Blue','Maruti','Brezza',3);
