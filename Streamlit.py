import streamlit as st
import mysql.connector

# Streamlit app for the Student Management System (SMS)
# This app allows users to add students and view a list of current students.
# Ensure you have the required packages installed:
# pip install streamlit mysql-connector-python
# Make sure to run this app with the command: streamlit run Streamlit.py

def get_connection():
    return mysql.connector.connect(
        host='localhost',
        database='StudentManagementSystem',
        user='root',
        password='password'  # Update your password here
    )

def add_student():
    with st.form("Add Student"):
        st.write("Add New Student")
        fn = st.text_input("First Name")
        ln = st.text_input("Last Name")
        email = st.text_input("Email")
        phone = st.text_input("Phone")
        address = st.text_input("Address")
        dept = st.text_input("Department")
        enroll_date = st.date_input("Enrollment Date")
        submitted = st.form_submit_button("Add Student")
        
        if submitted:
            conn = get_connection()
            cursor = conn.cursor()
            cursor.callproc('AddStudent', [fn, ln, email, phone, address, dept, enroll_date.strftime("%Y-%m-%d")])
            conn.commit()
            cursor.close()
            conn.close()
            st.success(f"Student {fn} {ln} added!")

def list_students():
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Students LIMIT 20;") 
    rows = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    cursor.close()
    conn.close()
    st.write("### Current Students")
    if rows:
        st.table([dict(zip(columns, row)) for row in rows])  # Displaying as a table 
    else:
        st.write("No students found.")

def main():
    st.title("🎓 Student Management System (SMS)")
    add_student()
    st.markdown("---")
    list_students()

if __name__ == "__main__":
    main()
