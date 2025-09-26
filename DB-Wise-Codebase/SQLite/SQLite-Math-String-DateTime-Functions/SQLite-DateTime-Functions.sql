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
CREATE TABLE Student( sID INTEGER PRIMARY KEY AUTOINCREMENT, sBDate DATETIME, sName TEXT );

INSERT INTO Student (sBDate, sName) VALUES ('1961-04-09 01:09:11', 'Dwayne Richard Hipp' );
INSERT INTO Student (sBDate, sName) VALUES ('1956-01-31 10:10:10', 'Guido Van Rossum');
INSERT INTO Student (sBDate, sName) VALUES ('1948-09-10 18:40:10', 'Charles Simonyi');
INSERT INTO Student (sBDate, sName) VALUES ('1791-12-26 16:16:16', 'Charles Babbage');
INSERT INTO Student (sBDate, sName) VALUES ('2020-01-01 12:12:12', 'John Doe' );
INSERT INTO Student (sBDate, sName) VALUES ('2021-03-03 13:13:13', 'Jane Doe' );
INSERT INTO Student (sBDate, sName) VALUES ('1990-06-15 10:30:00', 'Harvey Specter');
INSERT INTO Student (sBDate, sName) VALUES ('1991-09-21 14:45:00', 'Mike Ross');
INSERT INTO Student (sBDate, sName) VALUES ('1992-03-05 09:15:00', 'Rachel Zane');
INSERT INTO Student (sBDate, sName) VALUES ('1990-01-19 13:20:00', 'Louis Litt');
INSERT INTO Student (sBDate, sName) VALUES ('1993-11-30 08:40:00', 'Donna Paulsen');
INSERT INTO Student (sBDate, sName) VALUES ('1994-07-25 16:05:00', 'Jessica Pearson');
INSERT INTO Student (sBDate, sName) VALUES ('1995-02-14 11:10:00', 'Katrina Bennett');
INSERT INTO Student (sBDate, sName) VALUES ('1996-05-08 07:50:00', 'Samantha Wheeler');
INSERT INTO Student (sBDate, sName) VALUES ('1992-10-03 12:30:00', 'Sheila Sazs');
INSERT INTO Student (sBDate, sName) VALUES ('1991-12-22 15:00:00', 'Harold Gunderson');

SELECT * FROM Student;

-- Display DateTime with strftime
SELECT sName, strftime('%d-%m %H:%M', sBDate) AS DMHM, strftime('%d-%m-%Y %H:%M:%S %p', sBDate) as ISTDateTime FROM Student;