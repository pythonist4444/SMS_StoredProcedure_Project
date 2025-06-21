-- Execution scripts 

-- 1. AddStudent
CALL AddStudent(
	'Cristiano', 'Ronaldo',
    'c.ronaldo@uni.edu',
    '076969432345',
    '99 Future Street',
    'Sport Science',
    '2011-09-01'
);

-- 2. EnrollStudent
CALL EnrollStudent(1, 2, '2025-06-17', 'Active');

-- 3. GetStudentsByCourse
CALL GetStudentByCourse(1);

-- 4. GetStudentsByInstructor
CALL GetStudentsByInstructor(2);

-- 5. UpdateStudentContact
CALL UpdateStudentContact(
	1,
    'john.doe.updated@student.uni.edu',
    '07911112222',
    '101 New Lane, London'
);

-- 6. GetCoursesByStudent
CALL GetCoursesByStudent(2);

-- 7. GetEnrollmentSummary
CALL GetEnrollmentSummary()

