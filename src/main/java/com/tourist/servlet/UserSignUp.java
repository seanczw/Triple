package com.tourist.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.hash.Hashing;
import com.tourist.dao.UserDao;
import com.tourist.model.User;

/**
 * Servlet implementation class UserSignUp
 */
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			String fname = request.getParameter("fname");
			String  lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone_number");
			String password = request.getParameter("password");
			
			String hashPassword = Hashing.sha256()
					  .hashString(password, StandardCharsets.UTF_8)
					  .toString();
			
			
			User user = new User(fname, lname, email, phone, hashPassword);
			
			UserDao udao = new UserDao();
			
			boolean check  = udao.checkExistEmail(email);
			if(check) {
				System.out.print("User email already exist");
				request.getSession().setAttribute("error", "User email already exist. Try another email");
				response.sendRedirect("auth.jsp");
			}else {
				if(udao.registerUser(user)) {
					request.getSession().setAttribute("success", "Register successfully!");
					response.sendRedirect("auth.jsp");
				};
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
