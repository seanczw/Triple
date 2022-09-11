<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.tourist.model.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Login/Sign Up</title>
<!-- <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="assets/css/bootstrap-grid.css">
<link rel="stylesheet" href="assets/css/style-auth.css">
<%@include file="includes/header-main.jsp"%>
</head>
<body>

	<!-- Header start -->
	<%@include file="includes/navbar-main.jsp"%>

	<!-- Header end -->
	<main class="cd-main">
		<section class="cd-section index5 visible">
			<div class="cd-content style5">
				<div class="login-box">
					<div class="row no-gutters height-100-percentage">
						<!-- login style5 left side start -->
						<div class="col-md-4 col-sm-12 style5-left">
							<div class="d-flex height-100-percentage padding-30px">
								<div class="align-self-center width-100-percentage">
									<h2>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p>
									<a class="btn btn-primary btn-lg" href="#" role="button">Learn
										More</a>
								</div>
							</div>
						</div>
						<!-- login style5 left side end -->
						<!-- login style5 right side start -->
						<div class="col-md-8 col-sm-12 style5-right">
							<div class="login-form-slider">
								<!-- login slide start -->
								<div class="login-slide slide">
									<div class="sign-up-txt">
										<span>Don't have an account? <a href="javascript:;"
											class="sign-up-click">Register Now</a>
										</span>
									</div>
									<div
										class="d-flex height-100-percentage max-width-400 margin-0-auto padding-10px">
										<div class="align-self-center width-100-percentage">
											<h2>Sign in to You Login</h2>
											<form action="user-signin" method="post"
												class="floating-form">
												<div class="form-group">
													<input type="text" name="email" class="form-control"
														required> <label class="label">Enter Your
														Email</label>
												</div>
												<div class="form-group">
													<input type="password" name="password" class="form-control"
														required> <label class="label">Password</label>
												</div>
												<div class="row">
													<div class="col-6">
														<div class="forgot-txt">
															<a href="javascript:;" class="forgot-password-click">Forgot
																Password</a>
														</div>
													</div>
													<div class="col-6">
														<div class="form-group text-right">
															<input type="submit" class="submit" value="Login">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- login slide end -->
								<!-- signup slide start -->
								<div class="signup-slide slide">
									<div class="sign-up-txt">
										if you have an account? <a href="javascript:;"
											class="login-click">login</a>
									</div>
									<div class="d-flex height-100-percentage padding-40px">
										<div class="align-self-center width-100-percentage">
											<h2>Create An Account</h2>
											<form action="user-signup" method="post"
												class="floating-form">
												<div class="row">
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">First Name</label> <input
																type="text" name="fname" class="form-control" required>
														</div>
													</div>
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">Last Name</label> <input type="text"
																name="lname" class="form-control" required>
														</div>
													</div>
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">Email</label> <input type="text"
																name="email" class="form-control" required>
														</div>
													</div>
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">Phone</label> <input type="number"
																name="phone_number" class="form-control" required>
														</div>
													</div>
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">Password</label> <input
																type="password" name="password" class="form-control"
																required>
														</div>
													</div>
													<div class="col-md-6 col-sm-12">
														<div class="form-group">
															<label class="label">Confirm Password</label> <input
																type="password" name="confirm_pass" class="form-control"
																required>
														</div>
													</div>
												</div>
												<div class="form-group text-right">
													<input type="submit" class="submit" value="Register">
												</div>
											</form>
										</div>
									</div>
								</div>
								<!-- signup slide end -->
								<!-- forgot password slide start -->
								<div class="forgot-password-slide slide">
									<div class="d-flex height-100-percentage style4-left">
										<div
											class="align-self-center width-100-percentage max-width-400 margin-0-auto padding-10px">
											<form class="floating-form">
												<label class="label">Enter your email address to
													reset your password</label>
												<div class="form-group user-name-field">
													<input type="text" class="form-control"> <label
														class="label">Email</label>
												</div>
												<div class="form-group text-right">
													<input type="submit" class="submit" value="Submit">
												</div>
											</form>
											<div class="sign-up-txt">
												if you remember your password? <a href="javascript:;"
													class="login-click">login</a>
											</div>
										</div>
									</div>
								</div>
								<!-- forgot password slide end -->
							</div>
						</div>
						<!-- login style5 right side end -->
					</div>
				</div>
			</div>
		</section>
	</main>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- <script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script> -->
	<!-- JS File -->
	<script src="assets/js/modernizr.js"></script>
	<script src="assets/js/velocity.min.js"></script>
	<script type="text/javascript" src="assets/js/script-auth.js"></script>
	
	<%@include file="includes/footer-main.jsp"%>

	<script type="text/javascript">
		
	</script>

</body>
</html>