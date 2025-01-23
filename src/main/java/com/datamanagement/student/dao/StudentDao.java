package com.datamanagement.student.dao;

import java.sql.*;
import java.util.*;
import com.datamanagement.student.Student;

public class StudentDao {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/studentdatamanagement";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "1234";

    // Method to establish a connection to the database
    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Method to execute a query and return a ResultSet
    public ResultSet executeQuery(String query) throws Exception {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            con = getConnection();
            st = con.createStatement();
            rs = st.executeQuery(query);
        }
        catch(Exception e) {
        	e.getMessage();
        }
		return rs;
    }

    // Method to search for a student by ID
    public Student searchStudent(int sid) throws Exception{
        String query = "SELECT * FROM students WHERE sid = " + sid;
        ResultSet rs = executeQuery(query);

        if (rs.next()) {
            Student s = new Student();
            s.setSid(sid);
            s.setSname(rs.getString("sname"));
            return s;
        }

        return null;
    }
    
    public List<Student> getAllStudents() throws Exception{
    	List<Student> students = new ArrayList<>();
    	ResultSet rs = executeQuery("select * from students");
    	while(rs.next()){
    		Student student = new Student();
    		student.setSid(rs.getInt("sid"));
    		student.setSname(rs.getString("sname"));
    		students.add(student);
    	}
    	
    	return students;
    }
    
    // Method to get the total number of students
    	public int totalStudents() throws Exception {
    		ResultSet rs = executeQuery("SELECT COUNT(sid) FROM students");
    		int total = 0;
    		
    		if (rs.next()) {
    			total = rs.getInt(1);
    		}
    		return total;
    	}

    // Method to insert a new student into the database
    public String insertStudent(Student student) throws Exception{
        String query = "INSERT INTO students (sid, sname) VALUES (?, ?)";
        
    
        if (searchStudent(student.getSid()) != null) {
            return "A student already exists with ID = " + student.getSid() + " and Name = " + student.getSname();
        }

        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, student.getSid());
            pst.setString(2, student.getSname());
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0 ? "Student inserted successfully!"+" With Student ID = " + student.getSid() + " and Name = " + student.getSname() : "Failed to insert student.";
        }
    }
    
    // Method to update  student data
    public String updateStudent(Student student) throws Exception{
        String query = "UPDATE students SET sname=? WHERE sid=?";


        if (searchStudent(student.getSid()) == null) {
            return null; 
        }

        try (Connection con = getConnection();
             PreparedStatement pst = con.prepareStatement(query)) {
            
            pst.setString(1, student.getSname()); 
            pst.setInt(2, student.getSid());      

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0 ? "Student updated successfully! With Student ID = " + student.getSid() + " and Name = " + student.getSname() : "Failed to update student.";
        }
        catch (NumberFormatException e) {
            return "Error: Student ID must be a number.";
        } catch (Exception e) {
            return  "Error: " + e.getMessage();
        }
    }
}