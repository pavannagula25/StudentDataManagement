<%@page import="com.datamanagement.student.dao.StudentDao"%>
<%@page import="com.datamanagement.student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .result {
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Insert Student</h1>
        <form method="post" action="">
            <label for="student-id">Student ID:</label>
            <input type="text" id="student-id" name="studentId" required>

            <label for="student-name">Student Name:</label>
            <input type="text" id="student-name" name="studentName" required>

            <button type="submit">Insert Student</button>
        </form>

        <%
            String message = null; // Initialize message variable

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                    // Retrieve form data
                    int studentId = Integer.parseInt(request.getParameter("studentId"));
                    String studentName = request.getParameter("studentName");

                    // Create a Student object
                    Student student = new Student();
                    student.setSid(studentId);
                    student.setSname(studentName);

                    // Create a StudentDao object and insert the student
                    StudentDao dao = new StudentDao();
                    String resultMessage = dao.insertStudent(student);

                    // Set the message based on the insertion result
                    message = resultMessage;

                } catch (NumberFormatException e) {
                    message = "Error: Student ID must be a number.";
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                }
            }

            // Display the message if it exists
            if (message != null) {
        %>
        <div class="result">
            <p><%= message %></p>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>