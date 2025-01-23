
<%@page import="com.datamanagement.student.dao.StudentDao"%>
<%@page import="com.datamanagement.student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
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

        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px 0;
        }

        label {
            margin-bottom: 10px;
            font-size: 16px;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 80%;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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

        .result {
            margin-top: 20px;
            text-align: center;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #e9f7ef;
        }

        .result h2 {
            margin: 0;
            color: #333;
        }

        .result p {
            margin: 5px 0;
            font-size: 18px;
            color: #555;
        }

        .not-found {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Search Student</h1>
        </header>
        
        <form method="get">
            <div class="search-container">
                <label for="student-id">Enter Student ID:</label>
                <input type="text" id="student-id" placeholder="Student ID" name="sid" required>
                <button type="submit">Search</button>
            </div>
        </form>
        
        <%
        try{
            String studentId = request.getParameter("sid");
            if (studentId != null && !studentId.isEmpty()) {
                StudentDao dao = new StudentDao();
                Student student = dao.searchStudent(Integer.parseInt(studentId)); 

                if (student != null) {
        %>
        <div id="result" class="result">
            <h2>Student Found</h2>
            <p><strong>ID:</strong> <%= student.getSid() %></p>
            <p><strong>Name:</strong> <%= student.getSname() %></p>
         
        </div>
        <%
                } else {
        %>
        <div id="result" class="result not-found">
            <h2>Student Not Found</h2>
            <p>Please check the Student ID and try again.</p>
        </div>
        <%
                }
            }
        } catch (NumberFormatException e) {
            out.println("Error: Student ID must be a number.");
        } catch (Exception e) {
        	out.println("Error: " + e.getMessage());
        }
        %>
    </div>
</body>
</html>