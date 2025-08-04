USE StudentDB;

SELECT 
	CONCAT( s_firstName, ' ',  s_lastName) AS studentName, 
	c_name AS courseName, 
	s_fees AS feesPaid
FROM 
	Student 
INNER JOIN 
	Courses 
ON 
	Student.c_id = Courses.c_id
ORDER BY 
	courseName;

/*
	Suppose the College Admin wants to see a list of Students 
	with the Courses enrolled & the amount of fees paid
*/

-- DROP PROCEDURE sp_getStudentData

-- Stored Procedure Without Parameter
CREATE PROCEDURE sp_getStudentData
AS
	BEGIN
		SELECT CONCAT( s_firstName, ' ',  s_lastName) AS studentName, 
		c_name AS courseName, s_fees AS feesPaid 
		FROM Student INNER JOIN Courses ON Student.c_id = Courses.c_id 
		ORDER BY courseName
	END

EXEC sp_getStudentData;

--fun_getTotalRevenue() Function
-- Get the Total Revenue
SELECT dbo.fun_getTotalRevenue() AS totalRevenue;

-- Use it to Calculate the Average Revenue
SELECT dbo.fun_getTotalRevenue()/COUNT(Student.s_id) AS avgRevenue FROM STUDENT;

-- Cross check the Average Revenue
SELECT AVG(s_fees) AS checkAvg FROM Student;

-- https://www.w3schools.com/SQl/func_sqlserver_datediff.asp

SELECT DATEDIFF( YEAR, '1999-01-12',GETDATE() );

SELECT s_dateOfBirth, DATEDIFF( YEAR, s_dateOfBirth,GETDATE() )
FROM Student;

CREATE FUNCTION 
	fun_calculateAge( @DOB DATETIME )
RETURNS 
	INT
AS
	BEGIN
		DECLARE @num INT;

		SET @num = (SELECT DATEDIFF( YEAR, @DOB,GETDATE() ) )

		RETURN @num
	END

SELECT s_dateOfBirth, dbo.fun_calculateAge(s_dateOfBirth) AS ageOfStudent FROM Student;

SELECT dbo.fun_calculateAge( '1997-08-15' );