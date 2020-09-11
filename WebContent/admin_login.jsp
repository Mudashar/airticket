<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
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
<%@ page import = "student.*"  %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>

	<%
		String bp=request.getParameter("adminloginbutton");
		if(bp!=null && bp.equals("LOGIN")){
			String email = request.getParameter("aname");
			String pass = request.getParameter("apass");
			StudentDemo sd=new StudentDemo();
			int i=sd.acheckLogin(email,pass);
			if(i>0){
				session.setAttribute("admin_e","email");
				session.setAttribute("admin_p","pass");
				RequestDispatcher rd=request.getRequestDispatcher("grid_view.jsp");
				rd.forward(request,response);
			}
			else{
				out.print("Wrong Input !! Try Again");
				response.sendRedirect("admin_login.jsp");
			}
		}
	%>
<div class="container">
<a href="login.jsp"><i class="fa fa-arrow-left" style="font-size:48px;color:white;background-color:black;margin-left:10%;"></i></a>
<div class="login">
	<div class="login_in">
		<h1 style="text-align:center;">Admin Section</h1>
		<form action="" method="POST">
		
			<div style="text-align:center;">E-mail: <input  type="text" name="aname" placeholder="Enter Your email address"></div><br>
			<div style="text-align:center;">Password: <input  type="password" name="apass" placeholder="Enter Your password"></div><br><br>
			
			<input style="float:right;" type="submit" name="adminloginbutton" value="LOGIN"><br><br>
	
		</form>
		</div>
</div>
</div>
</body>
</html>