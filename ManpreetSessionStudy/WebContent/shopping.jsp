<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#cart {
	width: 300px;
	float: right;
	background-color: yellow;
	border-color: lime;
	border-style: dashed;
	border-width: 4px;
	background-color: yellow;
	background-color: yellow
}
</style>
</head>
<body bgcolor="pink">


	<%
		HttpSession s = request.getSession(false);

		String code = (String) s.getAttribute("S3CRET");

		if (code == null) {
			out.println("You are not within the session .Please Login");
		} else {
			String username = (String) s.getAttribute("USERNAME");
	%>

	<div id="cart">
		<h2>Items Purchased</h2>
		<%
			double totalPrice = 0;
				ArrayList<Product> purchseList = (ArrayList<Product>) s
						.getAttribute("TROLLEY");

				for (Product p : purchseList) {
					out.println("<br> "
							+ p.name
							+ "      Rs. "
							+ p.price
							+ " &nbsp  <a href='RemoveProductServlet?pid="
							+ p.id
							+ "'><img src='cancel.png' height='10' width='10'></a>");

					totalPrice = totalPrice + p.price;

				}
				
				
		%>
		<hr>
		<h2>Total Amount : Rs<%=totalPrice%> </h2>
		

	</div>

	<h1>Start Shopping</h1>

	<div align="center">
		Logged in as
		<%=username%></div>
	<br>


	<br>
	<center>
		<img src="Amul.gif" width="90" height="100"> <a
			href="PurchseServlet?pid=1">Buy</a> <br> <img src="bis.jpg"
			width="90" height="100"> <a href="PurchseServlet?pid=2">Buy</a>
		<br> <img src="maggi.jpg" width="90" height="100"> <a
			href="PurchseServlet?pid=3">Buy</a> <br> <img src="veg.jpg"
			width="90" height="100"><a href="PurchseServlet?pid=4">Buy</a>
		<br>

	</center>

	<br>
	<a href="mypage.jsp">Profile</a>
	<br>
	<a href="settings.jsp">Settings</a>
	<br>
	<a href="LogoutServlet">Logout</a>

	<h3>Session Properties</h3>
	Session ID :
	<%=s.getId()%><br> Creation Time :
	<%=s.getCreationTime()%><br> Last Accessed Time :
	<%=s.getLastAccessedTime()%><br> Inactive Time Interval :
	<%=s.getMaxInactiveInterval()%><br> Is New :
	<%=s.isNew()%><br>

	<%
		}
	%>










</body>
</html>