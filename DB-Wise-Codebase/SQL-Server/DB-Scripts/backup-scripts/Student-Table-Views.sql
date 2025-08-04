SELECT * INTO Student2 FROM Student;

-- DROP VIEW Student_Table_View 
-- DROP VIEW All_Students_View 

-- Single Record
CREATE VIEW Student_Table_View AS
	SELECT 
		s_firstName + ' ' + s_lastName AS studentName,
		s_fees * 10 AS total_fees
	FROM 
		Student2
	WHERE 
		s_id = 1080;

SELECT * FROM Student_Table_View;

ALTER VIEW Student_Table_View AS
	SELECT 
		s_firstName + ' ' + s_lastName AS studentName,
		s_fees * 10 AS total_fees
	FROM 
		Student2
	WHERE 
		s_id = 1040;

SELECT * FROM Student_Table_View;

-- Whole Table
CREATE VIEW All_Students_View AS 
	SELECT * FROM Student2;

SELECT * FROM All_Students_View;

DELETE FROM All_Students_View WHERE s_id = 1110;

SELECT * FROM All_Students_View;

UPDATE All_Students_View SET s_firstName = 'Anne' WHERE s_id = 1030;

SELECT * FROM All_Students_View;