-- Date Functions SQLite

-- UTC Date, UTC Time, UTC DateTime
SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP;

-- Todays Date, First Day of Previous Month, Last Day of Next Month
SELECT DATE() AS todaysDate, DATE('now','start of month','-1 month') prevMonthFirstDay,DATE('now','start of month','+2 month','-1 day') nextMonthLastDay;

-- UTC DateTime, EST DateTime
SELECT DATETIME('now') AS utcDateTime, DATETIME('now','localtime') AS estDateTime;

-- Time Difference between LocalTime(EST) and UTC DateTime
SELECT TIMEDIFF(DATETIME('now') ,DATETIME('now','localtime') )

-- Extract Current Year Month Day from CurrentDate
SELECT strftime('%Y-%m-%d', 'now') as currYMD;
-- Extract Hour:Min:Sec from CurrentDateTime
SELECT strftime('%H:%M:%S', CURRENT_TIMESTAMP) as currHMS;
-- Extract Hour:Min:Sec AM/PM from CurrentDateTime
SELECT strftime('%H:%M:%S %p', CURRENT_TIMESTAMP) as currHMSP;

-- Extract Day-Month Hour-Min from CurrentDateTime
SELECT strftime('%d-%m %H:%M', DATETIME('now') ) as currDMHM;

-- Adjust Date 
SELECT strftime('%m-%d', 'now', '+7 days' ) as dateAfterAWeek;
SELECT strftime('%m-%d', 'now', 'start of month' ) as monthStartDate;

-- Get Day of the Week - Sunday = 0 [0 to 6]
SELECT strftime( '%w', 'now', '-3 days' ) AS threeDaysBefore, strftime( '%w', 'now' ) AS today;

-- Get Week of the Year [ 0 to 53 ]
SELECT strftime( '%W', 'now' ) as currWeek, strftime( '%W', 'now', '+21 days' ) AS after3Weeks;

-- Adds 14 days to current date
SELECT strftime('%Y-%m-%d', 'now', '+14 days'); 

-- Table Data 
CREATE TABLE Experts( eID INTEGER PRIMARY KEY AUTOINCREMENT, eBDate DATETIME, eName TEXT, eTech TEXT );

INSERT INTO Experts (eBDate, eName, eTech)
VALUES
('1956-01-31 10:30:00', 'Guido van Rossum', 'Python'),
('1961-04-09 01:09:11', 'Dr. Richard Hipp', 'SQLite'),
('1948-09-10 08:40:00', 'Charles Simonyi', 'Microsoft Word & Excel'),
('1791-12-26 16:05:00', 'Charles Babbage', 'Analytical Engine'),
('1941-09-09 12:00:00', 'Dennis Ritchie', 'C'),
('1955-06-08 12:00:00', 'Sir Tim Berners-Lee', 'World Wide Web');

SELECT * FROM Experts;

-- Display DateTime with strftime
SELECT eName, strftime('%d-%m %H:%M', eBDate) AS DMHM, strftime('%d-%m-%Y %H:%M:%S %p', eBDate) as ISTDateTime FROM Experts;