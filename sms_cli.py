
# sms_cli.py
# A simple command-line interface for the Student Management System (SMS)

import mysql.connector
from mysql.connector import Error

def connect_db():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            database='StudentManagementSystem',
            user='root',
            password='password'  # Change this!
        )
        return conn
    except Error as e:
        print(f"Error: {e}")
        return None

def add_student(cursor):
    print("Enter new student details:")
    fn = input("First Name: ")
    ln = input("Last Name: ")
    email = input("Email: ")
    phone = input("Phone: ")
    address = input("Address: ")
    dept = input("Department: ")
    enroll_date = input("Enrollment Date (YYYY-MM-DD): ")
    
    cursor.callproc('AddStudent', [fn, ln, email, phone, address, dept, enroll_date])
    print("Student added successfully!")

def list_students(cursor):
    cursor.execute("SELECT StudentID, FirstName, LastName FROM Students LIMIT 20;")
    rows = cursor.fetchall()
    print("\nCurrent Students:")
    for r in rows:
        print(f"{r[0]} - {r[1]} {r[2]}")
    if not rows:
        print("No students found.")

def main():
    conn = connect_db()
    if conn is None:
        return
    cursor = conn.cursor()
    while True:
        print("\nSMS CLI - Choose an option:")
        print("1. Add Student")
        print("2. List Students")
        print("3. Exit")
        choice = input("Choice: ")
        if choice == '1':
            add_student(cursor)
            conn.commit()
        elif choice == '2':
            list_students(cursor)
            conn.commit()
        elif choice == '3':
            break
        else:
            print("Invalid choice, try again.")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
