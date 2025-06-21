CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,  
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Address VARCHAR(225),
    Department VARCHAR(100),
    EnrollmentDate DATE
);

CREATE TABLE Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),  
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Department VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (FirstName, LastName, Email, Phone, Address, Department, EnrollmentDate)
VALUES 
('John', 'Doe', 'john.doe@student.uni.edu', '07456789012', '123 Elm Street', 'Computer Science', '2023-09-01'),
('Mary', 'Lee', 'mary.lee@student.uni.edu', '07567890123', '456 Oak Avenue', 'Mathematics', '2023-09-05'),
('James', 'Brown', 'james.brown@student.uni.edu', '07678901234', '789 Pine Road', 'Physics', '2023-09-10');

INSERT INTO Instructors (FirstName, LastName, Email, Phone, Department)
VALUES 
('Alice', 'Johnson', 'alice.johnson@uni.edu', '07123456789', 'Computer Science'),
('Bob', 'Smith', 'bob.smith@uni.edu', '07234567890', 'Mathematics'),
('Clara', 'Evans', 'clara.evans@uni.edu', '07345678901', 'Physics');

INSERT INTO Courses (CourseName, Department, InstructorID)
VALUES 
('Data Structures', 'Computer Science', 1),
('Linear Algebra', 'Mathematics', 2),
('Quantum Mechanics', 'Physics', 3);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Status)
VALUES 
(1, 1, '2023-09-10', 'Active'),  -- John → Data Structures
(2, 2, '2023-09-12', 'Active'),  -- Mary → Linear Algebra
(3, 3, '2023-09-15', 'Active'),  -- James → Quantum Mechanics
(1, 2, '2023-09-20', 'Completed'); -- John → Linear Algebra