<%@page import="com.datamanagement.student.dao.StudentDao"%>
<%@page import="com.datamanagement.student.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        @media (max-width: 600px) {
            table {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h2>All Students</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            <%
                StudentDao dao = new StudentDao();
                List<Student> students = dao.getAllStudents();
                for (Student student : students) {
            %>
            <tr>
                <td><%= student.getSid() %></td>
                <td><%= student.getSname() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>