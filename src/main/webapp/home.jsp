<%@page import="com.datamanagement.student.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <style>
    	body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

header {
    text-align: center;
    margin-bottom: 20px;
}

h1 {
    color: #333;
}

.message {
    text-align: center;
    margin: 20px 0;
}

h2 {
    color: #555;
}

.options {
    display: flex;
    justify-content: center;
    gap: 20px;
}

button {
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    background-color: #007BFF;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Student Management System</h1>
        </header>
        <div class="message">
            <h2>Total Number of Students: <span id="total-students">
            <%
            	StudentDao dao = new StudentDao();
                int total = dao.totalStudents();
                out.print(total);
            %>
            
            </span></h2>
        </div>
        <div class="options">
            <a href="searchStudent.jsp"><button>Search Student</button></a>
            <a href="updateStudentData.jsp"><button >Update Student Data</button></a>
            <a href="AddStudent.jsp"><button >Add Student</button></a>
            <a href="listAllStudents.jsp"><button >Student List</button></a>
        </div>
    </div>
</body>
</html>