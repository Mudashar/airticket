<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="student.*" %>
    	
    <% 
    	String admin_e=(String)session.getAttribute("admin_e");
    	String admin_p=(String)session.getAttribute("admin_p");
    	if(admin_e==null && admin_p==null){
    		response.sendRedirect("admin_login.jsp");
    		return ;
    	}
    
    %>
    	
    
    <%
    	String bp=request.getParameter("addadminbutton");
    	try{
    		if(bp!=null && bp.equals("ADD ADMIN")){
        		String name=request.getParameter("aname");
        		String email=request.getParameter("aemail");
        		String pass=request.getParameter("apass");
        		String cpass=request.getParameter("reapass");
        		if(pass.equals(cpass)){
        			StudentDemo sd = new StudentDemo();
        			int i=sd.insert(name,email,pass);
        			if(i>0){
        				out.print("Successfully Added");
        			}
        			else{
        				out.print("Some Error Occurred !!!");
        			}
        		}
        		else{
        			out.print("Password Din't matches. Please Try Again");
        			response.sendRedirect("add_admin.jsp");
        		}
        	}
    	}catch(Exception e){
    		response.sendRedirect("admin_login.jsp");
    	}
    
    %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	body{
		background-color: black;
	}
	
	.container{
		margin-top: 10%;
	}
	.login{
		
		width:30%;
		margin:auto;
		border: 1px solid transparent;
		color:white;
		
    background:url(http://a1064.phobos.apple.com/us/r30/Purple/v4/2b/2a/6b/2b2a6b38-9a7f-db5e-6090-46716d4ff1b7/mzl.eyhswfuj.png);
    background-size: 90px 70px;
    background-repeat: no-repeat;
    padding:15px;
}
	}
	.login_in{
		width:80%;
		margin:auto;
		border: 1px solid yellow;
		color:white;
	}
	
</style>
</head>
<body>
	<div class="container">
<a href="grid_view.jsp"><i class="fa fa-arrow-left" style="font-size:48px;color:white;background-color:black;margin-left:10%;"></i></a>
<div class="login">
	<div class="login_in">
		<h1 style="text-align:center;">Add Admin</h1>
	
			<form action="" method="POST">
			<div style="text-align:center;"><input type="text" name="aname" placeholder="Enter Your name" required></div><br>
			<div style="text-align:center;"><input type="text" name="aemail" placeholder="Enter Your email" required></div><br>
			<div style="text-align:center;"><input type="password" name="apass" placeholder="Password" required></div><br>
			<div style="text-align:center;"><input type="password" name="reapass" placeholder="Re-Enter your Password" required></div><br><br>
			<input  style="float:right;" type="submit" name="addadminbutton" value="ADD ADMIN" onclick="return confirm('are you sure ?');"><br><br>


		</form>
	</div>
</div>
</div>
</body>
</html>