<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	
	html { 
  background: url(https://scontent.fccu3-1.fna.fbcdn.net/v/t35.0-12/16667539_1838557123025025_1731620444_o.png?oh=2c3c096b4cf3eee3d4f4b3a52a12f15d&oe=58B26A8A) no-repeat center fixed; 
  background-size: cover;
}
	
	.back{
		background-color: #900C3F;
		width: 100%;
		margin-top:  10%;
		font-style: italic;
		font-size:30px;
		text-align: center;
		color: white;
	}
</style>
</head>
<body>
	<%@ page import="aircon.*"%>
	<%! String result; %>
		<%
			String femail=request.getParameter("femail");
			String fpass=request.getParameter("fpass");
			Dblogin dbl=new Dblogin();
			try{
				int x=dbl.login(femail,fpass);
				if(x==1){
					session.setMaxInactiveInterval(20000);
					session.setAttribute("key1", femail);
					session.setAttribute("key2", fpass);
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
					rd.forward(request,response);
					//out.print("true");
				}else if(x==0){
					result="Wrong password";
				}else if(x==-1){
					result="no such acount exsist";
				}
				else{
					response.sendRedirect("login.jsp");
					//out.print("<p>wrong input</p>");
				}
			}catch(Exception e){
				//out.print("false");
			}
		%>
		<div class="back"><%= result %>
		<a href="login.jsp"><i class="fa fa-arrow-circle-right" style="font-size:48px;color:white;background-color: #900C3F;"></i></a>
		</div>
</body>
</html>