<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	
	html { 
  background: url(https://scontent.fccu3-1.fna.fbcdn.net/v/t35.0-12/16593875_1838558473024890_1337958248_o.png?oh=63a0a9ce2fa44da19115c2c79665cc97&oe=589D47A3) no-repeat center fixed; 
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
	<%@ page 	import="java.sql.*"%>
	<%@ page 	import="javax.sql.*"%>
	<%! String result; %>
	<%! String url; %>
	<%	
		url="login.jsp";
		String fname=request.getParameter("fname");
		String flname=request.getParameter("flname");
		String femail=request.getParameter("femail");
		String fpass=request.getParameter("fpass");
		String fcpass=request.getParameter("fcpass");
		if(fname!=null && flname!=null && femail!=null && fpass!=null && fcpass!=null){
			if(fpass.equals(fcpass)){
				//result="Successfully registered..";
				 Dblogin dbl=new Dblogin();
				result=dbl.insert(fname,flname,femail,fpass);
				if(result.equals("Succesfully register")){
					session.setMaxInactiveInterval(20000);
					session.setAttribute("key1", femail);
					session.setAttribute("key2", fpass);
					url="profile.jsp";
				}
			}
			else{
				result="password not matches";
			}
		}
		else{
			result="Fill up the form";
		}	
	%>
	<div class="back"><%= result %>
		<a href="<%= url %>"><i class="fa fa-arrow-circle-right" style="font-size:48px;color:white;background-color: #900C3F;"></i></a>
	</div>
</body>
</html>