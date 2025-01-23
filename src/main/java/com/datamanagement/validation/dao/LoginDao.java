package com.datamanagement.validation.dao;

import java.sql.*;

public class LoginDao 
{
	 
	String query = "Select * from logindetails where Username = ? AND Password = ?";

	public boolean checkUser(String username,String password) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
	     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatamanagement","root","1234");
	     
	     PreparedStatement st = con.prepareStatement(query);
	     st.setString(1, username);
	     st.setString(2, password);
	     
	     ResultSet rs = st.executeQuery();
	     if(rs.next()) {
	    	 return true;
	     }
		
		return false;
	}
}
