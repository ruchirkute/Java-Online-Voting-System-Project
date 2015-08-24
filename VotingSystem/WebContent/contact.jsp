<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles/style.css" />
<title>Voting System</title>
<%
		String userName = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
			for(Cookie cookie : cookies){
			    if(cookie.getName().equals("username"))
			    	userName = cookie.getValue();
			}
		}
		if(userName == null)
			response.sendRedirect("login.jsp");
	%>
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="section">
				<div
					style="text-align: center; color: white; margin: 0px 0 0px 324px;">
					<h1>Online Voting System</h1>
					<h3>A project by Ruchir Kute</h3>
				</div>
			</div>
			<ul>
				<li><a href="index.jsp">Project Description</a></li>
				<li><a href="vote.jsp">Vote Here</a></li>
				<li><a href="vote-stats.jsp">Voting Statistics</a></li>
				<li class="current"><a href="contact.jsp">Contact us</a></li>
				<li><a href="JasonServlet">Web Service</a></li>
				<li><a href="logoutServlet">Logout</a></li>
				<li><a class="welcome"><b>Welcome! <%=userName %></b></a></li>
			</ul>
			<center>
				<div id="tagline">
					<div>
						<h2 style="height: 0px;">Northwestern Polytechnic University</h2>
						<br> 47671 Westinghouse Drive Fremont, CA 94539, USA<br>
						<br> Name: Ruchir Kute<br> ID: 12457<br> Email: <a
							href="mailto:ruchirkute2003@gmail.com">ruchirkute2003@gmail.com</a>
					</div>
				</div>
			</center>
		</div>

		<div id="footer">
			<div>
				<div class="section">
					<p style="text-align: center;">Copyright &copy; Ruchir Kute,
						ID: 12457 - All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>