package com.datamanagement.validation;

import java.io.IOException;
import java.sql.SQLException;

import com.datamanagement.validation.dao.LoginDao;

import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class ValidateLogin
 */

@WebServlet("/ValidateLogin")
public class ValidateLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("username");
		String upass = request.getParameter("password");
		LoginDao logindao = new LoginDao(); 
		
		try {
			if(logindao.checkUser(uname,upass)) {
				response.sendRedirect("home.jsp");
			}
			else {
				response.sendRedirect("login.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
