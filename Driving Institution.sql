BEGIN TRANSACTION;

CREATE TABLE Student
(
  studentID varchar(8) NOT NULL,
  firstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  gender varchar(255) NOT NULL,
  age INT NOT NULL,
  dateOfBirth DATE NOT NULL,
  nationality varchar(255) NOT NULL,
  phoneNumber varchar(10) NOT NULL,
  vehicleClass varchar(255) NOT NULL,
  trafficFileNumber varchar(8) NOT NULL,
  issueDate DATE NOT NULL,
  expiryDate DATE NOT NULL,
  PRIMARY KEY (studentID)
);

CREATE TABLE Training_and_Testing_Center
(
  buildingNumber INT NOT NULL,
  numberOfVehicles INT NOT NULL,
  numberOfInstructors INT NOT NULL,
  numberOfStudents INT NOT NULL,
  PRIMARY KEY (buildingNumber)
);

CREATE TABLE Branches
(
  branchID varchar(8) NOT NULL,
  location1 varchar(255) NOT NULL,
  studentID varchar(8) NOT NULL,
  buildingNumber INT NOT NULL,
  PRIMARY KEY (branchID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID),
  FOREIGN KEY (buildingNumber) REFERENCES Training_and_Testing_Center(buildingNumber)
);

CREATE TABLE Facilities
(
  functionFac varchar(255) NOT NULL,
  timings DATE NOT NULL,
  buildingNumber INT NOT NULL,
  PRIMARY KEY (functionFac),
  FOREIGN KEY (buildingNumber) REFERENCES Training_and_Testing_Center(buildingNumber)
);

CREATE TABLE Vehicles
(
  vehicleID varchar(8) NOT NULL,
  vehicleType varchar(255) NOT NULL,
  functionFac varchar(255) NOT NULL,
  PRIMARY KEY (vehicleID),
  FOREIGN KEY (functionFac) REFERENCES Facilities(functionFac)
);

CREATE TABLE Instructors
(
  instructorID varchar(8) NOT NULL,
  instructorFirstName varchar(255) NOT NULL,
  instructorLastName varchar(255) NOT NULL,
  instructorNationality varchar(255) NOT NULL,
  instructorPhoneNumber varchar(255) NOT NULL,
  functionFac varchar(255) NOT NULL,
  PRIMARY KEY (instructorID),
  FOREIGN KEY (functionFac) REFERENCES Facilities(functionFac)
);

CREATE TABLE Teaches
(
  instructorID varchar(8) NOT NULL,
  studentID varchar(8) NOT NULL,
  FOREIGN KEY (instructorID) REFERENCES Instructors(instructorID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

INSERT INTO Student VALUES('20192023','Abdallah','Elabora','Male',18,'2002-08-29','Jordan','05093039033','Automatic','27493660','2020-10-29','2021-06-15');
INSERT INTO Student VALUES('20195853','Layan','Ahmad','Female',19,'2001-08-14','Jordan','0501582732','Automatic','12309874','2020-09-15','2021-04-20');
INSERT INTO Student VALUES('20195645','Layan','Shanableh','Female',19,'2001-09-14','Jordan','0502346780','Manual','45657878','2020-06-06','2021-01-05');
INSERT INTO Student VALUES('20197897','Ahmad','Saif ','Male',18,'2002-07-21','Syria','0509909567','Automatic','45896734','2020-11-15','2021-06-05');
INSERT INTO Student VALUES('20199877','Mohammed','Alhelwani','male',20,'2001-08-14','Lebnon','0503785984','Manual','33459985','2019-12-15','2020-07-25');

INSERT INTO Training_and_Testing_Center VALUES(1,5,5,5);
INSERT INTO Training_and_Testing_Center VALUES(2,50,100,20);
INSERT INTO Training_and_Testing_Center VALUES(3,100,50,40);
INSERT INTO Training_and_Testing_Center VALUES(4,150,75,50);
INSERT INTO Training_and_Testing_Center VALUES(5,50,25,25);

INSERT INTO Branches VALUES('43783478','Mirdif','20192023',1);
INSERT INTO Branches VALUES('43785687','Al-Qouz','20195853',1);
INSERT INTO Branches VALUES('43789807','Warqa','20195645',1);
INSERT INTO Branches VALUES('43782354','Sharjah','20197897',1);
INSERT INTO Branches VALUES('43787590','Jumeirah','20199877',1);

INSERT INTO Facilities VALUES('Parking Training','2021-06-25',1);
INSERT INTO Facilities VALUES('Road Training','2021-06-26',1);
INSERT INTO Facilities VALUES('Night Training','2021-06-26',1);
INSERT INTO Facilities VALUES('Highway Training','2021-06-27',1);
INSERT INTO Facilities VALUES('Exam Training','2021-06-28',1);

INSERT INTO Vehicles VALUES('CR123456','Light','Parking Training');
INSERT INTO Vehicles VALUES('CR123899','Light','Road Training');
INSERT INTO Vehicles VALUES('CR123232','Light','Night Training');
INSERT INTO Vehicles VALUES('CR123676','Light','Highway Training');
INSERT INTO Vehicles VALUES('CR123999','Heavy','Exam Training');

INSERT INTO Instructors VALUES('14134444','James','Adams','Jordan','0567809678','Parking Training');
INSERT INTO Instructors VALUES('14134445','Ahmed','Abdallah','Jordan','05046709454','Road Training');
INSERT INTO Instructors VALUES('14134446','Rami','Tawil','Jordan','05090499090','Night Training');
INSERT INTO Instructors VALUES('14134447','Abel','Tesfaye','Syria','05077787778','Highway Training');
INSERT INTO Instructors VALUES('14134448','Khaled','Khaldoon','Lebnon','05039845763','Exam Training');

INSERT INTO Teaches VALUES('14134444','20192023');
INSERT INTO Teaches VALUES('14134445','20195853');
INSERT INTO Teaches VALUES('14134446','20195645');
INSERT INTO Teaches VALUES('14134447','20197897');
INSERT INTO Teaches VALUES('14134448','20199877');
COMMIT;


SELECT * FROM Student;
SELECT * FROM Training_and_Testing_Center;
SELECT * FROM Branches;
SELECT * FROM Facilities;
SELECT * FROM Vehicles;
SELECT * FROM Instructors;
SELECT * FROM Teaches;

UPDATE Branches
SET location1 = 'Dera'
WHERE branchID = '43787590';

DROP TABLE Teaches;

CREATE VIEW [Jordanian Students] AS
SELECT studentID, firstName
FROM Student
WHERE nationality = 'Jordan';

SELECT * FROM [Jordanian Students];
SELECT * FROM Student;
SELECT * FROM Training_and_Testing_Center;
SELECT * FROM Branches;
SELECT * FROM Facilities;
SELECT * FROM Vehicles;
SELECT * FROM Instructors;
