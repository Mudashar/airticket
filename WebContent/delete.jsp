<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <% 
    	String admin_e=(String)session.getAttribute("admin_e");
    	String admin_p=(String)session.getAttribute("admin_p");
    	if(admin_e==null && admin_p==null){
    		response.sendRedirect("admin_login.jsp");
    		return ;
    	}
    
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Flights</title>
<link rel="stylesheet" type="text/css" href="entire_db_grid_view_stylesheet.css">
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="student.*" %>
	<% 	String bp=request.getParameter("deletbutton");
			try{
				if(bp!=null && bp.equals("DELETE")){
					String str = request.getParameter("Id");
					int id =Integer.parseInt(str);
					StudentDemo sd =new StudentDemo();
					int i= sd.delet(id);
					if(i>0){
						out.print("Successfully Deleted");
					}	
				}
			}catch(Exception e){
				response.sendRedirect("admin_login.jsp");
			}
	%>


	
<h1><marquee>DELETING SECTION OF DATA BASE !!!</marquee></h1>

				<th>
					<a href="grid_view.jsp">Go to previous Page</a>
				</th>
				<br>
				<br>
<form action="" method="POST">
<table border="2" align="center">
	<tr>
		<th>FLIGHT ID</th>
		<th>FLIGHT NAME</th>
		<th>FLIGHT SOURCE</th>
		<th>FLIGHT DESTINATION</th>
		<th>N.O.S</th>
		<th>DEPARTURE TIME</th>
		<th>ARRIVAL TIME</th>
		<th>FARE</th>
	</tr>
	<%
		StudentDemo sd=new StudentDemo();
		String str = request.getParameter("Id");
		int id =Integer.parseInt(str);
		ResultSet rs=sd.display(id);	
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
					</tr>
			
		<% }%>	
		<table border="2" align="center">
		<tr>
			<td>
			
				<a style="text-decoration: none;" href="grid_view.jsp">GOTO GRID VIEW</a> 
			</td>
			<td>
				<a href="admin_logout.jsp">LOG OUT</a>
			</td>
			<td>
				<input type="submit" name="deletbutton" value="DELETE" onclick="return confirm('Are you sure to delete');">
			</td>
		</tr>
	</table>
</table>


</form>



</body>
</html>