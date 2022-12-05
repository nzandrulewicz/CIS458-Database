-- Get the number of athletes on each team (V and JV seperate).
SELECT DISTINCT teamID, COUNT(teamID) AS numberOfPlayers 
FROM Athlete 
GROUP BY teamID;

-- Get the studentIDs, class grade percentage, classID, and teacher's email for athletes who have below a 70% in a class.
SELECT studentID, gradePercentage, classID, teacherEmail FROM Class
WHERE gradePercentage < 70;

-- Get all the Sophomores that play on the Varsity team for Perryville.
SELECT * FROM Athlete
WHERE gradeLevel = 'Sophomore' AND
teamID = '1111';

-- Get all the Juniors that play on the JV team for North East.
SELECT * FROM Athlete
WHERE gradeLevel = 'Junior' AND
teamID = '1122';

-- Get all the Juniors that play on the Varsity team for Elkton.
SELECT * FROM Athlete
WHERE gradeLevel = 'Junior' AND
teamID = '1151';

-- Get all the Sophomores that play on the JV team for Rising Sun.
SELECT * FROM Athlete
WHERE gradeLevel = 'Sophomore' AND
teamID = '1132';

-- Get all the Sophomores that play on the Varsity team for Bohemia Manor.
SELECT * FROM Athlete
WHERE gradeLevel = 'Sophomore' AND
teamID = '1141';

-- Get all the Freshman that play on the JV team for Rising Sun.
SELECT * FROM Athlete
WHERE gradeLevel = 'Freshman' AND
teamID = '1132';

-- Get all the Freshman that play on the Varsity team for Perryville.
SELECT * FROM Athlete
WHERE gradeLevel = 'Freshman' AND
teamID = '1111';

-- Get all the Head Coaches in the county.
SELECT * FROM Staff
WHERE staffType = 'Head Coach';

-- Get the schedule for Bohemia Manor's 2022 Varsity season.
SELECT * FROM Schedule
WHERE teamID = 1141;

-- Get the lowest GPA and the studentID, and first and last name out of all the athletes from Elkton.
SELECT studentID, firstName, lastName, gpa FROM Athlete
WHERE teamID = 1151 OR teamID = 1152 AND
gpa = (
	SELECT MIN(gpa) FROM Athlete);

-- Get the total number of wins Perryville's Varsity has in 2022.
SELECT COUNT(outcome) AS numberOfWins FROM TeamStats
WHERE teamID = 1111 AND
outcome = 'W';

-- Get the total number of games North East's JV team has for the season.
SELECT COUNT(gameID) FROM Schedule
WHERE teamID = 1122;

-- Get the total number of games Rising Sun's Varsity team will play Bohemia Manor.
SELECT COUNT(gameID) FROM Schedule
WHERE teamID = 1131 AND 
againstHighSchool = 'Bohemia Manor High School';
