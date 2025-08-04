USE StudentDB;

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Harry', 'Potter', 'harry.potter@yahoo.com', '+1-987-654-3210', 'm', '1999-11-11', 3000, 1 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Ron', 'Weasley', 'ron.weasley@gmail.com', '+1-123-456-7890', 'm', '1999-10-10', 1200, 2 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Hermoine', 'Granger', 'Hermoine.Granger@outlook.com', '+1-135-791-9642', 'f', '1999-10-10', 2700, 3 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Neville', 'Longbottom', 'Neville.Longbottom@yahoo.com', '+1-086-421-3579', 'm', '1999-09-09', 2300, 2 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Draco', 'Malfoy', 'Draco.Malfoy@gmail.com', '+1-123-456-7890', 'm', '1999-08-08', 3500, 3 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Ginny', 'Weasley', 'Ginny.Weasley@outlook.com', '+1-864-123-4567', 'f', '1997-01-08', 1234, 1 
);

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