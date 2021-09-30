--Create database with name CarManagementSystem
CREATE DATABASE CarManagementSystem

CREATE TABLE CAR (
    RegistrationNo VARCHAR(25),
    Make VARCHAR(25), Model VARCHAR(25), YearOfManufacture INT
    PRIMARY KEY(RegistrationNo)
);

SELECT* FROM CAR

INSERT INTO CAR VALUES('ABU 2522', 'Hyundai', 'Elantra', 2015);
INSERT INTO CAR VALUES('ABA 1978', 'Honda', 'City', 2016);
INSERT INTO CAR VALUES('WKC 6256', 'Perodua', 'Kancil', 2017);
INSERT INTO CAR VALUES('AEM 7778', 'Perodua', 'Kenari', 2016);
INSERT INTO CAR VALUES('BDQ 8787', 'Hyundai', 'Sonata', 2015);
INSERT INTO CAR VALUES('WJH 3465', 'Hyundai', 'Sonata', 2016);

CREATE TABLE CUSTOMER (
    CustCode VARCHAR(25),
    CustName VARCHAR(25),
    Location VARCHAR(25),
    PRIMARY KEY(CustCode)
);

SELECT* FROM CUSTOMER;

INSERT INTO CUSTOMER VALUES('E100', 'S.J. Salim', 'Selangor');
INSERT INTO CUSTOMER VALUES('C100', 'Harish', 'Perak');
INSERT INTO CUSTOMER VALUES('K201', 'Su Chin', 'Kuala Lumpur');
INSERT INTO CUSTOMER VALUES('K202', 'Mohd Salleh', 'Selangor');
INSERT INTO CUSTOMER VALUES('S101', 'Ramakrishna', 'Perak');
INSERT INTO CUSTOMER VALUES('S105', 'John Brown', 'Kelantan');

--d) Write the DDL statement to create the RENTAL table shown above. Include appropriate constraints in the table. 
CREATE TABLE RENTAL(
    RecID INT,
    RegistrationNo VARCHAR(25),
    CustCode VARCHAR(25),
    MilesDriven INT,
    DateHired DATE,
    CONSTRAINT FK_CARRENTAL FOREIGN KEY (RegistrationNo) REFERENCES CAR(RegistrationNo),
    CONSTRAINT FK_CUSTOMERRENTAL FOREIGN KEY (CustCode) REFERENCES CUSTOMER(CustCode)
);

SELECT* FROM RENTAL;

INSERT INTO RENTAL VALUES(100, 'ABU 2522', 'E100', 2300, '02/05/2018');
INSERT INTO RENTAL VALUES(122, 'ABA 1978', 'C100', 1200, '02/06/2018');
INSERT INTO RENTAL VALUES(123, 'WKC 6256', 'K201', 100, '02/07/2018');
INSERT INTO RENTAL VALUES(133, 'AEM 7778', 'K202', 550, '02/08/2018');
INSERT INTO RENTAL VALUES(145, 'BDQ 8787', 'S101', 50, '02/10/2018');
INSERT INTO RENTAL VALUES(146, 'WJH 3465', 'S105', 900, '02/12/2018');
INSERT INTO RENTAL VALUES(177, 'WKC 6256', 'E100', 700, '02/24/2018');

DROP TABLE RENTAL;
--a) How many cars of each make were manufactured in 2017? 
SELECT Make FROM CAR
WHERE YearOfManufacture = '2017';

--b) List the names of customers who had not driven a
-- particular car more than 1000 miles on a single journey. 

SELECT CustName
FROM CUSTOMER
INNER JOIN RENTAL ON RENTAL.CustCode=CUSTOMER.CustCode
WHERE MilesDriven<1000;

--c)List the names of all customers who had placed more than 1 car rental booking.
SELECT CustName
FROM CUSTOMER x 
JOIN (  SELECT CustCode FROM RENTAL GROUP BY CustCode HAVING COUNT(RecID )>1) y 
ON x.CustCode = y.CustCode


--e)     e. Show all customers’ details 
--who rented the car made from Perodua and model is Kancil.


SELECT *
FROM CUSTOMER j
LEFT JOIN RENTAL x
ON j. CustCode= x.CustCode
LEFT JOIN CAR z ON x.RegistrationNum= z.RegistrationNum
WHERE z.Make= 'Perodua' AND z.Model='Kancil'
		FROM CUSTOMER j
		LEFT JOIN RENTAL x
		ON j. CustCode= x.CustCode
		LEFT JOIN CAR z ON x.RegistrationNum= z.RegistrationNum
		WHERE z.Make= 'Perodua' AND z.Model='Kancil'
