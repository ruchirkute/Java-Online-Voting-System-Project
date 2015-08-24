<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="edu.npu.votingsystem.database.VotingBin" %>
<%@page import="java.util.List" %>
<%@page import="edu.npu.votingsystem.domain.Vote" %>
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
				<li class="current"><a href="vote-stats.jsp">Voting
						Statistics</a></li>
				<li><a href="contact.jsp">Contact us</a></li>
				<li><a href="JasonServlet">Web Service</a></li>
				<li><a href="logoutServlet">Logout</a></li>
				<li><a class="welcome"><b>Welcome! <%=userName %></b></a></li>
			</ul>
			<%
				VotingBin vb = new VotingBin();
				int javaCount=0, dotnetCount=0, pythonCount=0;
				List<Vote> list = vb.displayVotingStatistics();
				for(Vote v:list) {
					javaCount = v.getJavaCount();
					dotnetCount = v.getDotnetCount();
					pythonCount = v.getPythonCount();
				}
			%>
			<div id="tagline">
				<div>
					<h2 style="margin: 0px 0px 0px 300px;">Total number of Votes
						registered!</h2>
					<div style="padding: 0px 0px 21px 0;">
						<center>
							<table cellspacing=0 cellpadding="10">
								<tr>
									<td align=left style="color: #295071">Java:</td>
									<td><input type="text" id="java" value="<%=javaCount%>" name="java" size="10"
										disabled="disabled"></td>
								</tr>
								<tr>
									<td align=left style="color: #295071">Dot Net:</td>
									<td><input type="text" id="dotnet" value="<%=dotnetCount%>" name="dotnet" size="10"
										disabled="disabled"></td>
								</tr>
								<tr>
									<td align=left style="color: #295071">Python:</td>
									<td><input type="text" id="python" value="<%=pythonCount%>" name="python" size="10"
										disabled="disabled"></td>
								</tr>
							</table>
						</center>
					</div>
				</div>
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
	</div>
</body>
</html>