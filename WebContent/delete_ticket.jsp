<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DeleteTicket</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	
	html { 
  background: url(https://scontent.fccu3-1.fna.fbcdn.net/v/t35.0-12/16667344_1839649502915787_448099118_o.png?oh=4af95ff45cb30c6f2ed6a18bf5c031b3&oe=58A0C3CE) no-repeat center fixed; 
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
	<%@ page import="java.sql.*"%>
	<%! String str; %>
	<%! String fname; %>
	<%! String femail; %>
		<%
		try{
			if(!(session.getAttribute("key1").equals(null))){
			int tid=Integer.parseInt(request.getParameter("tid"));
			Connection con=new Dblogin().dbcnn();
			femail= (String)session.getAttribute("key1");
			PreparedStatement ps= con.prepareStatement("select fname from f_user where femail=?");
			ps.setString(1, femail);
			ResultSet rs= ps.executeQuery();
				while(rs.next()){
					fname=rs.getString("fname");
					
				}
			PreparedStatement ps1=con.prepareStatement("delete  from booked where id=? and name=?");
			ps1.setInt(1,tid);
			ps1.setString(2,fname);
			int i=ps1.executeUpdate();
			if(i>0){
				str="Succesfully canceled";
			}else{
				str="Invalid ticket details";
			}
				%>
		<div class="back"><%= str %>
		<a href="flights.jsp"><i class="fa fa-arrow-circle-right" style="font-size:48px;color:white;background-color: #900C3F;"></i></a>
		</div>
		<% 
		}else{
				out.print("else");
				//response.sendRedirect("login.jsp");
			}
		}catch(Exception e){
		out.print("--"+e);
			//response.sendRedirect("login.jsp");
			
		}
	%>
</body>
</html>