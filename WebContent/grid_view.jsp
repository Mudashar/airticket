<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <% 
    	String admin_e=(String)session.getAttribute("admin_e");
    	String admin_p=(String)session.getAttribute("admin_p");
    	if(admin_e==null && admin_p==null){
    		response.sendRedirect("admin_login.jsp");
    	}
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="entire_db_grid_view_stylesheet.css">
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="student.*" %>
<h1 style="text-align:center;">Welcome: admin</h1>
<table border="2">
	<tr>
		<th>FLIGHT ID</th>
		<th>FLIGHT NAME</th>
		<th>FLIGHT SOURCE</th>
		<th>FLIGHT DESTINATION</th>
		<th>NUMBER OF SEATS</th>
		<th>DEPARTURE TIME</th>
		<th>ARRIVAL TIME</th>
		<th>FARE</th>
		<th>DELETE FLIGHTS</th>
		<th>UPDATE FLIGHTS</th>			
	</tr>
	<%
		StudentDemo sd =new StudentDemo();
		ResultSet rs=sd.display();	
		while(rs.next()){%>	
					<tr>
						<td><%= rs.getInt(1) %></td>
						<td><%= rs.getString(2) %></td>
						<td><%= rs.getString(3) %></td>
						<td><%= rs.getString(4) %></td>
						<td><%= rs.getInt(5) %></td>
						<td><%= rs.getString(6) %></td>
						<td><%= rs.getString(7) %></td>
						<td><%= rs.getDouble(8) %></td>
						<td>
   							 <a href=<%= "\"delete.jsp?Id=" + rs.getInt(1) + "\"" %> >DELETE</a>
						</td>
						<td>
   							 <a href=<%= "\"update.jsp?Id=" + rs.getInt(1) + "\"" %> >UPDATE</a>
						</td>
					</tr>
			
		<% }%>
		
</table>
<table border="2" align="center">
	<tr>
		
		<td>
			<a href="admin_logout.jsp">LOG OUT</a>
		</td>
		<td>
			<a href="addF.jsp">INSERT</a>
		</td>
		<td>
			<a href="add_admin.jsp">ADD ADMIN</a>
		</td>
	</tr>
</table>
</body>
</html>