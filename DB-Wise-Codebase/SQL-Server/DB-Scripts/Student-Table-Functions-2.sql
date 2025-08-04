USE StudentDB;

-- USER Defined Functions

-- Adding Two Numbers
CREATE FUNCTION 
	Add_Up( @n1 INT, @n2 INT )
RETURNS INT
AS
	BEGIN
		RETURN (@n1 + @n2);
	END

SELECT dbo.Add_Up( 125,250 ) AS addFunCall;

SELECT dbo.Add_Up( 100,300 ) AS addFunCall;

-- Using Table
-- Finding out the Total Revenue Generated
ALTER FUNCTION
CREATE FUNCTION
	fun_getTotalRevenue()
RETURNS NUMERIC(8,2)
AS
	BEGIN
		DECLARE @total NUMERIC(8,2)

		SET @total = (SELECT SUM(s_fees)  FROM Student);

		RETURN @total;
	END

-- Get the Total Revenue
SELECT dbo.fun_getTotalRevenue() AS totalRevenue;

-- Use it to Calculate the Average Revenue
SELECT dbo.fun_getTotalRevenue()/COUNT(Student.s_id) AS avgRevenue FROM STUDENT;

-- Cross check the Average Revenue
SELECT AVG(s_fees) AS checkAvg FROM Student;