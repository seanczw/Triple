<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.tourist.model.*"%>
<%@page import="com.tourist.dao.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
	UserDao udao = new UserDao();
	User user = udao.userInfobyId(auth.getId());
	request.setAttribute("user", user);
}else{
	response.sendRedirect("auth.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Tourest - Update your profile</title>
<link rel="stylesheet" href="assets/css/profile.css">
<%@include file="includes/header-main.jsp"%>
</head>
<body id="top">

	<%@include file="includes/navbar-main.jsp"%>
	<main>
		<article>
			<section class="profile-section">

				<div class="container">

					<div class="profile-inner">
						<div class="update-profile">
							<div class="section-title">Update Profile Information</div>
							<div class="form-container">

								<form action="update-profile-info" method="post">
									<div class="form-group">
										<label>First Name</label> <input type="text" name="fname" 
											class="form-control" value="${ user.firstName }" required />
									</div>
									<div class="form-group">
										<label>Last Name</label> <input type="text" name="lname"
											class="form-control" value="${ user.lastName }" required />
									</div>
									<div class="form-group">
										<label>Email</label> <input type="text" name="email"
											class="form-control" value="${ user.email }" required readonly/>
									</div>
									<div class="form-group">
										<label>Phone Number</label> <input type="text" name="phone_number"
											class="form-control" value="${ user.phoneNumber }" required />
									</div>
									<button type="submit" class="btn btn-primary">Update Info</button>
								</form>
							</div>

						</div>

						<div class="update-password">
							<div class="section-title">Update Password</div>
							<div class="form-container">
								<form action="update-password" method="post">
									<div class="form-group">
										<label>New Password</label> <input type="password"
											name="password" class="form-control" required>
									</div>

									<button type="submit" class="btn btn-primary">Update
										Password</button>
								</form>
							</div>
						</div>

					</div>
				</div>

			</section>
		</article>
	</main>

	<!-- 
    - #GO TO TOP
  -->

	<a href="#top" class="go-top" data-go-top aria-label="Go To Top"> <ion-icon
			name="chevron-up-outline"></ion-icon>
	</a>




<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<%@include file="includes/footer-main.jsp"%>

</body>
</html>