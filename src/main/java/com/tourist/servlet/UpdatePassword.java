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
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User auth = (User) request.getSession().getAttribute("auth");
			if(auth != null) {
				String password = request.getParameter("password");
				String hashPassword = Hashing.sha256()
						  .hashString(password, StandardCharsets.UTF_8)
						  .toString();
				User user = new User();
				user.setId(auth.getId());
				user.setPassword(hashPassword);
				new UserDao().updatePassword(user);
				request.getSession().setAttribute("success", "Password updated successfully!");
				response.sendRedirect("profile.jsp");
			}else {
				response.sendRedirect("auth.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
