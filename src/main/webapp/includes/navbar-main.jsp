
<!-- 
    - #HEADER
  -->


<header class="header" data-header>
	<div class="container">

		<a href="index.jsp">
			<h1 class="logo">Triple</h1>
		</a>

		<button class="nav-toggle-btn" data-nav-toggle-btn
			aria-label="Toggle Menu">
			<ion-icon name="menu-outline" class="open"></ion-icon>
			<ion-icon name="close-outline" class="close"></ion-icon>
		</button>

		<nav class="navbar">

			<ul class="navbar-list">

				<li><a href="index.jsp" class="navbar-link">Home</a></li>

				<li><a href="#" class="navbar-link">About Us</a></li>

				<li><a href="#" class="navbar-link">Tours</a></li>

				<li><a href="#" class="navbar-link">Destinations</a></li>

				<li><a href="#" class="navbar-link">Blog</a></li>

				<li><a href="#" class="navbar-link">Contact Us</a></li>

			</ul>

			<%
			if(auth != null){%>
				<div class="auth-user-name">
					<a href="#" class="btn btn-secondary"><%= auth.getFirstName()+" "+ auth.getLastName() %></a>
					<div class="overlay">
					<ul class="overlay-list">
						<li><a href="profile.jsp" class="">Edit Profile</a></li>
						<li><a href="user-logout" class="">Log Out</a></li>
					</ul>
					
					</div>
				</div>
			<% }else{%>
				<a href="auth.jsp" class="btn btn-secondary">Login&frasl;Sign Up</a>
			<%}
			%>
			

		</nav>

	</div>
</header>