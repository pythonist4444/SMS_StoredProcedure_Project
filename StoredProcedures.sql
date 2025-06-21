
-- 1. AddStudent
DELIMITER $$
CREATE PROCEDURE Addstudent (
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN email VARCHAR(100),
    IN phone VARCHAR(20),
    IN address VARCHAR(255),
    IN department VARCHAR(100),
    IN enrollmentDate DATE
)
BEGIN
    INSERT INTO Students (
        FirstName, LastName, Email, Phone, Address, Department, EnrollmentDate
    )
    VALUES (
        firstName, lastName, email, phone, address, department, enrollmentDate
    );
END $$
DELIMITER ;

-- 2. EnrollStudent
DELIMITER $$
CREATE PROCEDURE EnrollStudent (
    IN studentId INT,
    IN courseId INT,
    IN enrollDate DATE,
    IN status VARCHAR(20)
)
BEGIN
    INSERT INTO Enrollments (
        StudentID, CourseID, EnrollmentDate, Status
    )
    VALUES (
        studentId, courseId, enrollDate, status
    );
END $$
DELIMITER ;


-- 3. GetStudentsByCourse
DELIMITER $$
CREATE PROCEDURE GetStudentByCourse (
	IN courseId INT
)
BEGIN
	SELECT 
		s.StudentID,
        s.FirstName,
        s.LastName,
        s.Email,
        c.CourseID,
        c.CourseName,
        e.Status,
        e.EnrollmentDate
	FROM Enrollments e
    INNER JOIN Students s ON e.StudentID = s.StudentID
	INNER JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.courseID = courseId;
END $$
DELIMITER ;



-- 4. GetStudentsByInstructor
DELIMITER $$
CREATE PROCEDURE GetStudentsByInstructor (
    IN instructorId INT
)
BEGIN
    SELECT 
        s.StudentID,
        s.FirstName AS StudentFirstName,
        s.LastName AS StudentLasName,
        s.Email AS StudentEmail,
        c.courseID,
        c.CourseName,
        i.InstructorID,
        CONCAT (i.FirstName, ' ', i.LastName) AS InstructorName,
        e.Status
    FROM Enrollments e
    INNER JOIN Students s ON e.StudentID = s.StudentID
    INNER JOIN Courses c ON e.CourseID = c.CourseID
    INNER JOIN Instructors i ON c.InstructorID = i.InstructorID
    WHERE i.InstructorID = instructorId;
END $$
DELIMITER ;

-- 5. UpdateStudentContact
DELIMITER $$
CREATE PROCEDURE UpdateStudentContact (
	IN studentId INT,
	IN NewEmail VARCHAR(50),
    IN NewPhone VARCHAR(20),
    IN Newaddress VARCHAR(250)
)
BEGIN 	
	UPDATE Students
		SET 
			Email = NewEmail,
            Phone = NewPhone,
            Address = NewAddress
        WHERE StudentID = studentId;
END $$
DELIMITER ;

-- 6. GetCoursesByStudent
DELIMITER $$
CREATE PROCEDURE GetCourseByStudent (
	IN studentId INT
)
BEGIN 
	SELECT 
		CONCAT(s.FirstName, " ", s.LastName) AS StudentName,
		c.CourseID,
        c.CourseName,
        c.Department,
        e.EnrollmentDate,
        e.Status
	FROM Enrollments e
	INNER JOIN Courses c USING (CourseID)
    INNER JOIN Students s ON e.StudentID = s.StudentID
    WHERE e.StudentID = studentId;
END $$
DELIMITER ;

-- 7. GetEnrollmentSummary
DELIMITER $$
CREATE PROCEDURE GetEnrollmentSummary ()
BEGIN
	SELECT
		c.CourseID,
        c.CourseName,
        c.Department,
        COUNT(e.EnrollmentID) AS TotalEnrolled
	FROM Courses c
    LEFT JOIN Enrollments e USING(CourseID)
    GROUP BY c.CourseID, c.CourseName, c.Department
    ORDER BY TotalEnrolled DESC;
END $$
DELIMITER ;
