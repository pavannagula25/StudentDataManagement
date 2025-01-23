<%@page import="com.datamanagement.student.dao.StudentDao"%>
<%@page import="com.datamanagement.student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Data</title>
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
        <h1>Update Student</h1>
        <form method="post" action="">
            <label for="student-id">Student ID:</label>
            <input type="text" id="student-id" name="studentId" required>

            <label for="student-name">Student Name:</label>
            <input type="text" id="student-name" name="studentName" required>

            <button type="submit">Update Student</button>
        </form>

        <%
            String message = null; 

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                try {
                	
                    int studentId = Integer.parseInt(request.getParameter("studentId"));
                    String studentName = request.getParameter("studentName");

                    Student student = new Student();
                    student.setSid(studentId);
                    student.setSname(studentName);

                    StudentDao dao = new StudentDao();
                    String resultMessage = dao.updateStudent(student);

                    message = resultMessage;
                    

                } catch (NumberFormatException e) {
                    message = "Error: Student ID must be a number.";
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                }
            

            if (message != null) {
        %>
      
        <div id="result" class="result">
           <% out.println(message); %>
        </div>
        <%
        } 
        else {
        %>
        <div id="result" class="result not-found">
            <h2>Student Not Found</h2>
            <p>Please check the Student ID and try again.</p>
        </div>
        <%
         }
        }
        %>
    </div>
</body>
</html>