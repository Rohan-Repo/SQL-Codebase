USE StudentDB;

CREATE FUNCTION 
	Add_Up( @n1 INT, @n2 INT )
RETURNS INT
AS
	BEGIN
		RETURN (@n1 + @n2);
	END

SELECT dbo.Add_Up( 125,250 ) AS addFunCall;


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