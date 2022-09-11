package com.tourist.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.hash.Hashing;
import com.tourist.dao.UserDao;
import com.tourist.model.User;

/**
 * Servlet implementation class UserSignIn
 */
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			String hashPassword = Hashing.sha256()
					  .hashString(password, StandardCharsets.UTF_8)
					  .toString();
			UserDao udao = new UserDao();
			User user=udao.authenticateUser(email, hashPassword);
			if(user != null) {
				System.out.print("User Logged in "+ user.getFirstName());
				request.getSession().setAttribute("success", "Successfully logged in");
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			}else {
				System.out.print("Incorrect email or password");
				request.getSession().setAttribute("error", "Incorrect Credential :(");
				response.sendRedirect("auth.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
