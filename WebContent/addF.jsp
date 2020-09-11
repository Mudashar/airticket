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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="entire_db_grid_view_stylesheet.css">
</head>
<body>

<%@ page import="student.*" %>
<%@ page import="java.sql.*" %>
<% 
	String bp=request.getParameter("insertbutton");
	try{
		
		if(bp!=null && bp.equals("INSERT")){
			StudentDemo sd =new StudentDemo();
			String fname=request.getParameter("fname");
			String fsource=request.getParameter("fsource");
			String fdest=(request.getParameter("fdest"));
			int depdate=Integer.parseInt(request.getParameter("depdate"));
			String deptime=request.getParameter("deptime");
			String arrivtime=request.getParameter("arrivtime");
			double fare=Double.parseDouble(request.getParameter("fare"));
			int i=sd.insert(fname, fsource, fdest, depdate, deptime, arrivtime, fare);
			if(i>0){
				out.print("Successfully Inserted");
			}else{
				out.print("Error Occured !!!");
			}
		}
	}catch(Exception e){
		response.sendRedirect("admin_login.jsp");
	}
		
		
	
		
%>

<center><marquee behavior=alternate scrollamount="10"><h1>DATA BASE UPDATING PAGE</h1></marquee></center>
<form action="" method="POST">
<table border="2" align="center" align="center">
			<tr>
				<td>
					FLIGHT NAME:
				</td>
				<td>
					<input class="box" type="text" name="fname" style="width:90%;" required="">
				</td>
			</tr>
			
			<tr>
				<td>
					FLIGHT SOURCE
				</td>
				<td>
					<input class="box" type="text" name="fsource" style="width:90%;" required="" >
				</td>
			</tr>
			
			<tr>
				<td>
					FLIGHT DESTINATION
				</td>
				
				<td>
					<input class="box" type="text" name="fdest" style="width:90%;" required="">
				</td>
			</tr>
			
			<tr>
				<td>
					N.O.S
				</td>
				
				<td>
					<input class="box" type="text" name="depdate" style="width:90%;" required="" >
				</td>
			</tr>
			
			<tr>
				<td>
					DEPARTURE TIME
				</td>
				
				<td>
					<input class="box" type="text" name="deptime" style="width:90%;" required="">
				</td>
			</tr>
			
			<tr>
				<td>
					ARRIVAL TIME
				</td>
				
				<td>
					<input class="box" type="text" name="arrivtime" style="width:90%;" required="" >
				</td>
			</tr>
			<tr>
				<td>
					FARE
				</td>
				
				<td>
					<input class="box" type="text" name="fare" style="width:90%;" required="">
				</td>
			</tr>
			<tr>
				<table  align="center">
					<tr>
						<td>
							<input style="background-color:green; height:40px; width:400px;" type="submit" name="insertbutton" value="INSERT" onclick="return confirm('Are you sure');">
						</td>
					</tr>
				</table>
			</tr>
			<tr>
				<table align="center">
					<tr>
						<td>
							<a href="grid_view.jsp">VIEW GRID TABLE</a>
						</td>
					</tr>
				</table>
				
			</tr>
</table>
<table border="2" align="center">
	<tr>
		<td>
			<a href="admin_logout.jsp">LOG OUT</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>