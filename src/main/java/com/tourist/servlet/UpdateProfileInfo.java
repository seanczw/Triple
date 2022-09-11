package com.tourist.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tourist.dao.UserDao;
import com.tourist.model.User;

/**
 * Servlet implementation class UpdateProfileInfo
 */
public class UpdateProfileInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User auth = (User) request.getSession().getAttribute("auth");
			if(auth != null) {
				String fname = request.getParameter("fname");
				String  lname = request.getParameter("lname");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone_number");
				User user = new User(auth.getId(), fname, lname, email, phone);
				new UserDao().updateProfileInfo(user);
				request.getSession().setAttribute("success", "Information updated successfully!");
				response.sendRedirect("profile.jsp");
			}else {
				response.sendRedirect("auth.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
