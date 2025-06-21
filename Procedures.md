# 📘 Stored Procedures Documentation: Student Management System (SMS)

This document summarizes the stored procedures developed to automate and manage tasks in the Student Management System (SMS) database.

---

## 1. `AddStudent`

**Description:**  
Adds a new student record to the `Students` table.

**Parameters:**
- `firstName` (VARCHAR)
- `lastName` (VARCHAR)
- `email` (VARCHAR)
- `phone` (VARCHAR)
- `address` (VARCHAR)
- `department` (VARCHAR)
- `enrollmentDate` (DATE)

**Usage:**
```sql
CALL AddStudent('Jane', 'Doe', 'jane.doe@uni.edu', '07000000001', '10 Long Lane', 'Physics', '2025-09-01');
```

---

## 2. `EnrollStudent`

**Description:**  
Enrolls a student in a course by inserting a record into the `Enrollments` table.

**Parameters:**
- `studentId` (INT)
- `courseId` (INT)
- `enrollDate` (DATE)
- `status` (VARCHAR)

**Usage:**
```sql
CALL EnrollStudent(4, 2, '2025-09-02', 'Active');
```

---

## 3. `GetStudentsByCourse`

**Description:**  
Retrieves all students enrolled in a specified course.

**Parameters:**
- `courseId` (INT)

**Usage:**
```sql
CALL GetStudentsByCourse(2);
```

---

## 4. `GetStudentsByInstructor`

**Description:**  
Returns a list of students being taught by a particular instructor.

**Parameters:**
- `instructorId` (INT)

**Usage:**
```sql
CALL GetStudentsByInstructor(2);
```

---

## 5. `UpdateStudentContact`

**Description:**  
Updates a student’s contact details such as email, phone, and address.

**Parameters:**
- `studentId` (INT)
- `NewEmail` (VARCHAR)
- `NewPhone` (VARCHAR)
- `NewAddress` (VARCHAR)

**Usage:**
```sql
CALL UpdateStudentContact(4, 'linda.updated@student.uni.edu', '07881234567', '88 Birch Lane');
```

---

## 6. `GetCoursesByStudent`

**Description:**  
Returns a list of all courses a student is currently enrolled in.

**Parameters:**
- `studentId` (INT)

**Usage:**
```sql
CALL GetCoursesByStudent(4);
```

---

## 7. `GetEnrollmentSummary`

**Description:**  
Returns a summary of enrollment counts per course.

**Parameters:**  
None

**Usage:**
```sql
CALL GetEnrollmentSummary();
```

---