CREATE TABLE Patient(
	SSN INTEGER NOT NULL,
	Name VARCHAR(255),
	Phone VARCHAR(255),
	Gender VARCHAR(6),
	Insuranceid  INTEGER,
	Address varchar(255),
	RID INTEGER,
	PRIMARY KEY (SSN),
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Room(
	RID INTEGER NOT NULL,
	Block_Floor INTEGER,
	Unavailable VARCHAR(255),
	PRIMARY KEY (RID)
);

CREATE TABLE Room_Type(
	RID INTEGER NOT NULL,
	Type VARCHAR(255) NOT NULL,
	PRIMARY KEY (RID, Type),
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE Medicine(
	Code INTEGER NOT NULL,
	Name VARCHAR(255),
	Brand VARCHAR(255),
	Description VARCHAR(255),
	Price FLOAT,
	PRIMARY KEY (Code)
);

CREATE TABLE Takes(
	PID INTEGER NOT NULL,
	Code INTEGER NOT NULL,
	Time VARCHAR(255),
	PRIMARY KEY (PID, Code),
	FOREIGN KEY (Code) REFERENCES Medicine (Code)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY (PID) REFERENCES Patient (SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Employee(
	SSN INTEGER NOT NULL,
	E_Name VARCHAR(255),
	Jop_Type VARCHAR(255),
	Gender VARCHAR(255),
	E_Address VARCHAR(255),
	Salary INTEGER,
	PRIMARY KEY (SSN)
);

CREATE TABLE E_Contact_Num(
	EID INTEGER NOT NULL,
	Contact_Num VARCHAR(255) NOT NULL,
	PRIMARY KEY (EID, Contact_Num),
	FOREIGN KEY (EID) REFERENCES Employee (SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Doctor(
	EID INTEGER NOT NULL,
	Dep_ID INTEGER,
	PRIMARY key (EID),
	FOREIGN key (EID) REFERENCES Employee
	ON DELETE CASCADE
	ON UPDATE CASCADE
	FOREIGN KEY (Dep_ID) REFERENCES Departmnt
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Departmnt(
	Dep_ID INTEGER NOT NULL,
	Dep_Name VARCHAR(255),
	PRIMARY KEY (Dep_ID)
);

CREATE TABLE Dep_Location(
	Dep_ID INTEGER NOT NULL,
	Location VARCHAR(255),
	PRIMARY KEY (Dep_ID),
	FOREIGN KEY (Dep_ID) REFERENCES Departmnt (Dep_ID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Trainee(
	EID INTEGER NOT NULL,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Doctor (SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Nurse(
	EID INTEGER NOT NULL,
	RID INTEGER NOT NULL,
	Shift_Hours INTEGER,
	Experiance VARCHAR(500),
	PRIMARY KEY (EID, RID),
	FOREIGN KEY (EID) REFERENCES Employee (SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY (RID) REFERENCES Room (RID)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Receptionist(
	EID INTEGER NOT NULL,
	Shift_Hours INTEGER,
	PRIMARY KEY (EID),
	FOREIGN KEY (EID) REFERENCES Employee (SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

CREATE TABLE Record(
	RID INTEGER NOT NULL,
	Description VARCHAR(500),
	Patient_ID INTEGER,
	Appointment TIMESTAMP,
	EID INTEGER,
	PRIMARY KEY (RID),
	FOREIGN KEY (EID) REFERENCES Receptionist (EID)
	ON DELETE SET NULL
	ON UPDATE CASCADE,
	FOREIGN KEY (Patient_ID) REFERENCES Patient(SSN)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);


INSERT INTO Room VALUES (1, 1, "Full");
INSERT INTO Room VALUES (2, 4, "Full");
INSERT INTO Room VALUES (3, 3, "Full");
INSERT INTO Room VALUES (4, 1, "Full");
INSERT INTO Room VALUES (5, 2, "Full");

INSERT INTO Patient VALUES (100000001, "John Smith", "555-0256", "Male", 68476213 , "42 Foobar Lane", 1);
INSERT INTO Patient VALUES (100000002, "Grace Ritchie", "555-0512", "Female", 36546321 , "37 Snafu Drive", 2);
INSERT INTO Patient VALUES (100000003, "Random J. Patient", "555-1204", "Male", 65465421 , "101 Omgbbq Street", 3);
INSERT INTO Patient VALUES (100000004, "Dennis Doe", "555-0256", "Female", 68421879 , "1100 Foobaz Avenue", 4);

INSERT INTO Room_Type VALUES (1, "Single");
INSERT INTO Room_Type VALUES (5, "Single");
INSERT INTO Room_Type VALUES (3, "Double");
INSERT INTO Room_Type VALUES (4, "Triple");

INSERT INTO Medicine VALUES (1, "Procrastin-X", "X", "N/A", 10);
INSERT INTO Medicine VALUES (2, "Thesisin", "Foo Labs", "A", 11.5);
INSERT INTO Medicine VALUES (3, "Awakin", "Bar Laboratories", "A", 15.3);
INSERT INTO Medicine VALUES (4, "Crescavitin", "Baz Industries", "A", 17.5);
INSERT INTO Medicine VALUES (5, "Melioraurin", "Snafu Pharmaceuticals", "A", 24.1);

INSERT INTO Takes VALUES (100000003, 1, "Every 6 hours");
INSERT INTO Takes VALUES (100000004, 3, "Every 12 hours");
INSERT INTO Takes VALUES (100000002, 2, "Every 8 hours");
INSERT INTO Takes VALUES (100000001, 4, "Every 6 hours");

INSERT INTO Employee VALUES (111111111, "John Dorian", "Doctor", "Male", "42 Foobar Lane", 1200);
INSERT INTO Employee VALUES (333333333, "Christopher Turk", "Trainee", "Male", "37 Snafu Drive", 260);
INSERT INTO Employee VALUES (888888888, "Keith Dudemeister", "Doctor", "Female", "101 Omgbbq Street", 1260);
INSERT INTO Employee VALUES (999999999, "Molly Clock", "Nurse", "Female", "1100 Foobaz Avenue", 900);
INSERT INTO Employee VALUES (222222222, "Will Smith", "Doctor", "Male", "HollyWood", 1900);
INSERT INTO Employee VALUES (555555555, "angelina jolie", "Doctor", "Female", "HollyWood", 1500);

INSERT INTO E_Contact_Num VALUES(111111111, "6666-2314");
INSERT INTO E_Contact_Num VALUES(111111111, "4632-1456");
INSERT INTO E_Contact_Num VALUES(888888888, "5632-2159");
INSERT INTO E_Contact_Num VALUES(999999999, "7777-2112");
INSERT INTO E_Contact_Num VALUES(999999999, "3333-4444");
INSERT INTO E_Contact_Num VALUES(333333333, "7878-6354");

INSERT INTO Departmnt VALUES(1, "General Practitioner");
INSERT INTO Departmnt VALUES(2, "Surgery");
INSERT INTO Departmnt VALUES(3, "Critical-care");
INSERT INTO Departmnt VALUES(4, "Padiatrist");

INSERT INTO Dep_Location VALUES(1, "san francisco");
INSERT INTO Dep_Location VALUES(2, "chicago");
INSERT INTO Dep_Location VALUES(3, "chicago");
INSERT INTO Dep_Location VALUES(4, "washington dc");

INSERT INTO Doctor VALUES(111111111, 2);
INSERT INTO Doctor VALUES(222222222, 2);
INSERT INTO Doctor VALUES(555555555, 1);

INSERT INTO Nurse VALUES (999999999, 1, 12, "Good");

INSERT INTO Receptionist VALUES(888888888, 12);

INSERT INTO Record VALUES(1, "Patient suffers from Headache", 100000001,  '2020-04-24 10:00:00', 888888888);

SELECT E_Name
FROM Employee, Departmnt, Doctor
WHERE Departmnt.Dep_Name = "Surgery" AND Departmnt.Dep_ID = Doctor.Dep_ID AND Doctor.EID = Employee.SSN

SELECT Name, Address 
FROM Patient
WHERE RID IN
	(SELECT RID 
	FROM Room 
	WHERE Block_Floor = 4)
	
SELECT Name, Address, Phone, Insuranceid
FROM Patient
WHERE SSN IN
	(SELECT PID 
	FROM Takes 
	WHERE Code IN 
	(SELECT Code 
	FROM Medicine 
	WHERE Name = "Thesisin")
	)
	
SELECT MAX(Price), AVG(Price), sum(Price)
FROM Medicine

	SELECT *
	FROM Employee, Doctor, Departmnt
	WHERE Departmnt.Dep_ID = Doctor.Dep_ID And Doctor.EID = Employee.SSN
	GROUP BY Doctor.Dep_ID

DELETE FROM Dep_Location 
WHERE Location = "san francisco"

DELETE FROM Room 
WHERE Block_Floor = 4

UPDATE Patient
SET Phone = "666-01235"
WHERE RID IN
	(SELECT RID 
	FROM Room 
	WHERE Block_Floor = 3)
UPDATE Employee
SET Salary = Salary * 1.1
WHERE E_Name = "John Dorian"


