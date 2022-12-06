-- Create Database
-- CREATE DATABASE CecilCountyFootball;

-- Create HighSchool Table 
CREATE TABLE HighSchool 
(
	schoolID bigint Primary Key,
	highSchoolName varchar(255),
	road varchar(255),
	cityState varchar(255),
	zipcode varchar(15),
	phoneNumber bigint
);

-- Populate HighSchool Table
INSERT INTO HighSchool (schoolID, highSchoolName, road, cityState, zipcode, phoneNumber)
VALUES 
(240024000577, 'Perryville High School', '1696 Perryville Rd', 'Perryville, MD', '21903-2541', 4109966000),
(240024000575, 'North East High School', '300 Irishtown Rd', 'North East, MD', '21901-4308', 4109966200),
(240024090469, 'Rising Sun High School', '100 Tiger Dr', 'North East, MD', '21901-1139', 4106589115),
(240024000558, 'Bohemia Manor High School', '2755 Augustine Herman Hwy', 'Chesapeake City, MD', '21915-1408', 4108852075),
(240024000568, 'Elkton High School', '110 James St', 'Elkton, MD', '21921-4915', 4109965000);

-- Create Team Table
CREATE TABLE Team
(
	teamID int Primary Key,
	vOrJV varchar(2),
	year int,
	schoolID bigint FOREIGN KEY REFERENCES HighSchool(schoolID)
);		

-- Populate Team Table
	-- teamID numbers: State, County, High School, Team (V Or JV = 1 or 2)
INSERT INTO Team
VALUES
(1111, 'v', 2022, 240024000577),
(1112, 'jv', 2022, 240024000577),
(1121, 'v', 2022, 240024000575),
(1122, 'jv', 2022, 240024000575),
(1131, 'v', 2022, 240024090469),
(1132, 'jv', 2022, 240024090469),
(1141, 'v', 2022, 240024000558),
(1142, 'jv', 2022, 240024000558),
(1151, 'v', 2022, 240024000568),
(1152, 'jv', 2022, 240024000568);

-- Create Athlete Table
CREATE TABLE Athlete
(
	studentID int Primary Key,
	firstName varchar(55),
	lastName varchar(55),
	jerseyNumber int,
	position varchar(3),
	gradeLevel varchar(10),
	eligible bit DEFAULT 'TRUE',
	gpa char(4),
	studentEmail varchar(55),
	teamID int FOREIGN KEY REFERENCES Team(teamID)
);

-- Populate Team Table
	-- studentID numbers: State, County, High School, Freshman Year (last two digits), Alphabetical Ranking by Last Name (three digits, 009 or 076)
INSERT INTO Athlete
VALUES
(11112004, 'Ted', 'Abrams', 21, 'TE', 'Senior', 'TRUE', '3.11', 'tabrams@students.perryville.edu', 1111),
(11213102, 'Chris', 'White', 13, 'TE', 'Junior', 'FALSE', '1.70', 'cwhite@students.northeast.edu', 1121),
(11116042, 'Thomas', 'Johnson', 7, 'RB', 'Freshman', 'FALSE', '2.89', 'tjohnson@students.perryville.edu', 1112),
(11115121, 'Brad', 'Ulman', 14, 'WR', 'Sophomore', 'TRUE', '3.23', 'bulman@students.perryville.edu', 1111),
(11412008, 'Darth', 'Vader', 3, 'QB', 'Senior', 'FALSE', '0.30', 'dvader@students.elkton.edu', 1151);

-- Create Staff Table
CREATE TABLE Staff
(
	staffID int Primary Key,
	firstName varchar(55),
	lastName varchar(55),
	staffType varchar(55),
	email varchar(55),
	phoneNumber int,
	teamID int FOREIGN KEY REFERENCES Team(teamID),
	schoolID bigint FOREIGN KEY REFERENCES HighSchool(schoolID)
);

-- Populate Staff Table
	-- staffID numbers: State, County, High School, Year Started (last two digits), Team (V or JV = 1 or 2), Alphabetical Ranking by Last Name (Single Digit)
INSERT INTO Staff
VALUES
(1152011, 'John', 'Doe', 'Head Coach', 'jdoe@elkton.edu', 0000000000, 1151, 240024000568);

-- Create Class Table
CREATE TABLE Class
(
	classID int Primary Key,
	studentID int FOREIGN KEY REFERENCES Athlete(studentID),
	className varchar(55),
	gradePercentage decimal (5,2),
	teacherFirstName varchar(55),
	teacherLastName varchar(55),
	teacherEmail varchar(55),
	phoneNumber int
);

-- Populate Class Table
INSERT INTO Class
VALUES
(4012, 11112004, 'Pre-Calculus', 84.20, 'John', 'Doe', 'jdoe@perryville.edu', 0000000000),
(4011, 11213102, 'Algebra 2', 72.50, 'Tom', 'Cruise', 'tcruise@northeast.edu', 0000000000),
(1001, 11116042, 'Algebra', 68.00, 'Zack', 'Hudson', 'zhudson@perryville.edu', 0000000000),
(1010, 11112004, 'Art', 58.00, 'Shanon', 'Barks', 'sbarks@perryville.edu', 0000000000);

-- Create Schedule Table
CREATE TABLE Schedule
(
	gameID int Primary Key,
	gameNumber int,
	teamID int FOREIGN KEY REFERENCES Team(teamID),
	againstHighSchool varchar(55),
	road varchar(55),
	cityState varchar(55),
	zipcode varchar(15),
	date varchar(55),
	time varchar(7)
);

-- Populate Schedule Table
INSERT INTO Schedule
VALUES
(1, 1, 1111, 'North East High School', '300 Irishtown Rd', 'North East, MD', '21901-4308', 'Friday, November 25, 2022', '6:00pm');

-- Create Team Stats Table
CREATE TABLE TeamStats
(
	year int Primary Key,
	teamID int FOREIGN KEY REFERENCES Team(teamID),
	gameID int FOREIGN KEY REFERENCES Schedule(gameID),
	outcome char(1)
);

-- Populate Team Stats Table
INSERT INTO TeamStats
VALUES
(2022,	1111,	1,	'W');

-- Check created tables
SELECT * FROM HighSchool;
SELECT * FROM Team;
SELECT * FROM Athlete;
SELECT * FROM Staff;
SELECT * FROM Class;
SELECT * FROM Schedule;
SELECT * FROM TeamStats;
