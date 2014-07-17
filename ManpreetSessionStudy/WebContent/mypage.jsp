<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<h2>Profile Page</h2>
	<center>


		<%
			HttpSession s = request.getSession(false);

			String code =(String) s.getAttribute("S3CRET");
			
			if(code==null){
				out.println("You are not within the session .Please Login");
			}else{
				String username=(String)s.getAttribute("USERNAME");
				
				%>
				    <h1>Welcome <%=username%> </h1>
			        <br>
					<br>
					<br>
					<h3>Session Properties</h3>
					     Session ID : <%=s.getId() %><br>
					     Creation Time : <%=s.getCreationTime() %><br>
					     Last Accessed Time : <%=s.getLastAccessedTime() %><br>
					     Inactive Time Interval  : <%=s.getMaxInactiveInterval()%><br>
					     Is New  : <%=s.isNew()%><br>
					     
					     					     
					<br>
					<a href="mypage.jsp">Profile</a><br>
					
					<a href="settings.jsp">Settings</a>
					<br>
					<a href="shopping.jsp">Shop Now</a><br>
				
					<a href="LogoutServlet">Logout</a>
				
				<% 
				
			}
			
		%>





	</center>
</body>
</html>