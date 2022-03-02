CREATE DATABASE Online_Salon_Booking_System;

USE [Online_Salon_Booking_System];

CREATE TABLE Manager
(
Manager_ID varchar(10) NOT NULL,
First_Name varchar(20),
Last_Name varchar(20),
Address varchar(50),
Email varchar(50),

CONSTRAINT Manager_PK PRIMARY KEY(Manager_ID),
CONSTRAINT CK1_Manager CHECK (Manager_ID LIKE 'M%'),
);


CREATE TABLE Admin 
(
Admin_ID varchar(10) NOT NULL,
First_Name varchar(20),
Last_Name varchar(20),
Address varchar(50),
Email varchar(50),

CONSTRAINT Admin_PK PRIMARY KEY(Admin_ID),
);


CREATE TABLE Beautician 
(
Beautician_ID varchar(10) NOT NULL,
First_Name varchar(20),
Last_Name varchar(20),
Address varchar(50),
DOB DATE,
Qualification text,
Manager_ID varchar(10),

CONSTRAINT Beautician_PK PRIMARY KEY(Beautician_ID),
CONSTRAINT Beautician_FK1 FOREIGN KEY(Manager_ID) REFERENCES Manager(Manager_ID),
CONSTRAINT CK1_Beautician CHECK (Beautician_ID LIKE 'B%'),
);


CREATE TABLE Branch
(
Branch_No varchar(10) NOT NULL,
Address varchar(60),
Phone_No int NOT NULL,
Email varchar(50),
Manager_ID varchar(10) NOT NULL,

CONSTRAINT Branch_PK PRIMARY KEY(Branch_No),
CONSTRAINT Branch_FK1 FOREIGN KEY(Manager_ID) REFERENCES Manager(Manager_ID),
CONSTRAINT CK1_Branch CHECK (Branch_No LIKE 'BR%'),
);


CREATE TABLE Customer
(
Customer_ID varchar(10) NOT NULL,
First_Name varchar(20),
Last_Name varchar(20),
Address varchar(50),
DOB Date,
Email varchar(50),
Branch_No varchar(10) NOT NULL,

CONSTRAINT Customer_PK PRIMARY KEY(Customer_ID),
CONSTRAINT Customer_FK1 FOREIGN KEY(Branch_No) REFERENCES Branch(Branch_No),
CONSTRAINT CK1_Customer CHECK (Customer_ID LIKE 'C%'),
);


CREATE TABLE Booking
(
Booking_No varchar(10) NOT NULL,
Service_No varchar(10) NOT NULL,
Service_Name varchar(50),
Appointment_Date DATE NOT NULL,
Admin_ID varchar(10) NOT NULL,
Beautician_ID varchar(10) NOT NULL,
Customer_ID varchar(10) NOT NULL,

CONSTRAINT Booking_PK PRIMARY KEY(Booking_No),
CONSTRAINT Booking_FK1 FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID),
CONSTRAINT Booking_FK2 FOREIGN KEY(Beautician_ID) REFERENCES Beautician(Beautician_ID),
CONSTRAINT Booking_FK3 FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
);

CREATE TABLE Product
(
Product_No varchar(10) NOT NULL,
Product_Name varchar(50) NOT NULL,
Price int,
Customer_ID varchar(10),

CONSTRAINT Product_PK PRIMARY KEY(Product_No),
CONSTRAINT Product_FK1 FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
CONSTRAINT CK1_Product CHECK (Product_No LIKE 'PR%'),
);


CREATE TABLE Payment
(
Payment_ID varchar(10) NOT NULL,
Product_No varchar(10),
Service_No varchar(10) NOT NULL,
Amount int,
Payment_Date DATE,
Admin_ID varchar(10) NOT NULL,
Booking_No varchar(10) NOT NULL,
Beautician_ID varchar(10) NOT NULL,
Customer_ID varchar(10) NOT NULL,

CONSTRAINT Payment_PK PRIMARY KEY(Payment_ID),
CONSTRAINT Payment_FK1 FOREIGN KEY(Beautician_ID) REFERENCES Beautician(Beautician_ID),
CONSTRAINT Payment_FK2 FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
CONSTRAINT Payment_FK3 FOREIGN KEY(Booking_No) REFERENCES Booking(Booking_No),
CONSTRAINT Payment_FK4 FOREIGN KEY(Admin_ID) REFERENCES Admin(Admin_ID),
CONSTRAINT Payment_FK5 FOREIGN KEY(Product_No) REFERENCES Product(Product_No),
); 


CREATE TABLE Job_Seeker
(
First_Name varchar(20),
Last_Name varchar(20),
Email varchar(50),
DOB DATE,
NIC varchar(12) NOT NULL,
Address varchar(50),
Applied_Career varchar(10),
Branch_No varchar(10),

CONSTRAINT Job_Seeker_PK PRIMARY KEY (NIC), 
CONSTRAINT Job_Seeker_FK1 FOREIGN KEY(Branch_No) REFERENCES Branch(Branch_No),
);


CREATE TABLE Customer_Phone
(
Customer_ID varchar(10) NOT NULL,
Phone_No varchar(10),

CONSTRAINT Customer_Phone_PK PRIMARY KEY(Phone_No),
);


CREATE TABLE Customer_Email
(
Customer_ID varchar(10) NOT NULL,
Email varchar(50),

CONSTRAINT Customer_Email_PK PRIMARY KEY (Email),
);


CREATE TABLE Beautician_ID_Phone
(
Beautician_ID varchar(10),
Phone_No varchar(10),

CONSTRAINT Beautician_ID_Phone_PK PRIMARY KEY(Phone_No),
);


CREATE TABLE Beautician_ID_Email
(
Beautician_ID varchar(10),
Email varchar(50),

CONSTRAINT Beautician_ID_Email_PK PRIMARY KEY(Email),
);


CREATE TABLE Manager_Phone
(
Manager_ID varchar(10) NOT NULL,
Phone_No varchar(10),

CONSTRAINT Manager_Phone_PK PRIMARY KEY(Phone_No),
)


CREATE TABLE Job_Seeker_Phone
(
NIC varchar(12),
Phone_No varchar(10),

CONSTRAINT Job_Seeker_Phone_PK PRIMARY KEY (Phone_No),
);


CREATE TABLE Admin_Phone
(
Admin_ID varchar(10) NOT NULL,
Phone_No varchar(10),

CONSTRAINT Admin_Phone_PK PRIMARY KEY(Phone_No),
);


CREATE TABLE Dependents
(
name  varchar(20),
DOB DATE,
Beautician_ID varchar(10),

CONSTRAINT Depentednts_PK PRIMARY KEY (name,Beautician_ID),
CONSTRAINT Dependents_FK1 FOREIGN KEY (Beautician_ID) REFERENCES Beautician(Beautician_ID),
);


INSERT INTO Manager VALUES ('M01','Kasun','Jayakody','No.111, Perera Street, Nugegoda','kasunjaykody.salonj@gmail.com');


INSERT INTO Admin VALUES ('ADMIN01','Dimuth','Karunathilake','No.680, Church Rd, Nugegoda','admin.dimuth.salonj@gmail.com');


INSERT INTO Beautician VALUES 
('B01','Ann','Jayathilake','No.15, Flower Street, Nugegoda','1986-08-27','NVQ Level 03 Qualified, 12 years Experience','M01'),
('B02','Malsha','Geethmi','No.30 3rd Lane, Maharagama','1989-03-21','Diploma in Beauty Culture','M01'),
('B03','Heshan','Siriwardana','No.150/B, Gemunu Rd, Dickwella','1984-05-02','NVQ Level 04 Qualified','M01'),
('B04','Piumi','Navoda','No.213, Kosowita, Gampaha','1996-08-14','Diploma in Beauty Culture','M01'),
('B05','Malmi','Herath','No.56, Uluwitike, Galle','1987-08-06','NVQ Level 03 Qualified','M01'),
('B06','Jayani','Rathnayke','No.47 Dewamiththa Rd, Galle','1985-09-02','Diploma in Hear Dressing','M01'),
('B07','Puja','Kariyawasam','No.162, Silva Street, Nupe, Matara','1988-02-14','NVQ Level 04 Qualified','M01');


INSERT INTO Branch VALUES 
('BR01','No.250, High Level Rd, Nugegoda','0112505680','salonj.nugegoda@gmail.com','M01'),
('BR02','No.140/A Wackwella Rd, Galle','0912504560','salonj.galle@gmail.com','M01'),
('BR03','No.60/B Anagarika Dharmapala Mawatha, Matara','0416698452','salonj.matara@gmail.com','M01');


INSERT INTO Customer VALUES 
('C100','Nelu','Dias','No.246, Nawala Rd, Delgoda','1996-04-20','nelu@gmail.com','BR01'),
('C102','Menaka','Perera','No.425/1, Kotikawatta Rd, Panapitiya','1998-02-20','menaka@gmail.com','BR01'),
('C103','Suresh','Rajapaksha','No.21A, David Street, Colombo','2001-10-25','suresh@yahoo.com','BR01'),
('C104','Pramila','Senavirathna','No.139, Dangedara Rd, Galle','1993-07-12','pramila@hotmail.com','BR02'),
('C105','Silu','Zoisa','No.140/4, Rahula Rd, Matara','1991-05-15','silu@gmail.com','BR03');


INSERT INTO Booking VALUES 
('A111','HC02','Hair-Relaxing','2021-05-17','ADMIN01','B02','C103'),
('B112','MS01','Massage','2021-05-19','ADMIN01','B04','C104'),
('A112','HC01','Hair-Cutting','2021-05-18','ADMIN01','B03','C102'),
('B113','MK04','Skin-Treatment','2021-05-19','ADMIN01','B07','C105'),
('A113','HC05','Hair-Coloring','2021-05-21','ADMIN01','B06','C100');


INSERT INTO Product VALUES 
('PR10025','Dreamron-HairColor_WineRed','750','C103'),
('PR20006','RoseBeauty-SkinCare','1200','C105'),
('PR30007','Vitamin-E-ComboPack','890','C100');


INSERT INTO Payment VALUES 
('PMT100','PR10025','HC02','1750','2021-05-12','ADMIN01','A111','B02','C103'),
('PMT101',NULL,'MS01','1200','2021-05-11','ADMIN01','B112','B04','C104'),
('PM1T02',NULL,'HC01','600','2021-05-13','ADMIN01','A112','B03','C102'),
('PMT103','PR20006','MK04','2400','2021-05-12','ADMIN01','B113','B07','C105'),
('PMT104','PR30007','HC05','1490','2021-05-11','ADMIN01','A113','B06','C100');


INSERT INTO Job_Seeker VALUES 
('Gayani','Fernando','gayani1234@gmail.com','1990-10-29','915645856V','No.36, Flower Street, Delgoda','Colorist','BR01'),
('Tharuka','Waththegama','tharuka95@gmail.com','1995-05-25','956238894V','No.64/A, Palliya Rd, Kaduwela','Therapist','BR01');


INSERT INTO Customer_Phone VALUES 
('C100','0715464750'),
('C100','0763428472'),
('C102','0723453533'),
('C102','0782342345'),
('C103','0703523533'),
('C103','0703242342'),
('C104','0713234534'),
('C104','0723534535'),
('C105','0723423434'),
('C105','0712342345');


INSERT INTO Beautician_ID_Phone VALUES 
('B01','0728762343'),
('B01','0783736456'),
('B02','0743234234'),
('B02','0712345435'),
('B03','0765446070'),
('B03','0712344555'),
('B04','0765412313'),
('B04','0712312312'),
('B05','0765443455'),
('B05','0765442345'),
('B06','0712345333'),
('B06','0712324534'),
('B07','0712334533'),
('B07','0712343453');


INSERT INTO Beautician_ID_Email VALUES 
('B01','ann4a@gmail.com'),
('B01','ANN6a@hotmail.com'),
('B02','malsha.g@gmail.com'),
('B02','malsha123.g@hotmail.com'),
('B03','heshan.s@gmail.com'),
('B03','Hesh123.s@hotmail.com'),
('B04','piumi.n@gmail.com'),
('B04','piumi123.n@hotmail.com'),
('B05','malmi.h@gmail.com'),
('B05','malmi32.h@hotmail.com'),
('B06','jayani.r12@gmail.com'),
('B06','jayani@@.r12@hotmail.com'),
('B07','puja.kari@gmail.com'),
('B07','puja121.kari@hotmail.com');

INSERT INTO Manager_Phone VALUES ('M01','0112504560');
INSERT INTO Manager_Phone VALUES ('M01','0771363456');

INSERT INTO Job_Seeker_Phone VALUES 
('915645856V','0718807933'),
('956238894V','0776658470');

INSERT INTO Admin_Phone VALUES ('ADMIN01','0116652874');
INSERT INTO Admin_Phone VALUES ('ADMIN01','0772334567');


INSERT INTO Dependents VALUES
('Asha Jayathilake','2000-05-25','B01');
