<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>contact</title>
<link rel="stylesheet" type="text/css" href="profile.css">
<link rel="stylesheet" type="text/css" href="table.css"/>
      <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.6.3/css/fontawesome.min.css">
</head>
<body>
	<%@ page import="aircon.*"%>
	<%@ page 	import="java.sql.*"%>
	<%@ page 	import="javax.sql.*"%>
	<%! String fname; %>
	<%! String flname; %>
	<%! String femail; %>
	<%! String fid; %>
	<%
		try{
		if(!(session.getAttribute("key1").equals(null))){
			
				Connection con=new Dblogin().dbcnn();	
				femail= (String)session.getAttribute("key1");
				PreparedStatement ps= con.prepareStatement("select id,fname,lname,femail from f_user where femail=?");
				ps.setString(1, femail);
				ResultSet rs= ps.executeQuery();
					while(rs.next()){
						fname=rs.getString("fname");
						flname=rs.getString("lname");
						fid=rs.getString("id");
					}
					
			
	%>
			<ul id="header">
		<li><a  href="#AirTicket">AirTicket</a></li>
		<li><a  href="profile.jsp">Profile</a></li>
		<li><a  href="flights.jsp">Flights</a></li>
		<li><a  class="active" href="#contact">Contact Us</a></li>
		<li style="float:right"><a href="logout.jsp">Logout</a></li>
	</ul>
	<div class="outter">
		<div class="inner">
			<div class="header">
				<br><br>
				<br>	
					<div class="headerin">
						<table>
							<tr>
							<th><h1>H!  <%= fname %></h1></th>
							<th><h1 style="color:#000000">Contact Us</h1></th>
							<th><a href="http://creativestockphoto.com/wp-content/uploads/2014/10/images-of-man-and-woman-in-love.jpg" target="_blank"><img src="http://creativestockphoto.com/wp-content/uploads/2014/10/images-of-man-and-woman-in-love.jpg" width="60" height="60"></a></th>
						</table>
					</div>
			</div>
			<div class="section">
 
			<div class="qlist">
				
			
				 <div class="citiesnav">
                                <h2>INFO</h2>
                                  
                                         <b>User guide</b><br>
									 	<b>chose and and start</b><br>
										<b>Share holders</b>
								
				 </div>
		 <div class="citiesnav">
							 	<h2>NEWS</h2>
					 <p><marquee>Celebrating golden 50 Year of service</marquee></p>
				 	<p><marquee>Some vacancy for maintenance staff</marquee></p>
			 </div>
        				<div class="citiesnav">
					<h2>NOTICE</h2>
					<p>1. commencement of new flights soon</p>
					<p>2. Extension of branch</p>
					<p>3. 20% off for person with physical disabilities </p>
				      </div>
		   </div>
		   <div class="body">
		 	<div class="bodyin">
 
						 	<div class="block">
						 		<h2>Send message to admin:-</h2>
						 		<form name="contact">
						 			<textarea rows="4" cols="30" name="message" placeholder="Write you message here"></textarea>
						 			<input type="submit" style="text-align:right;" value="send">
						 		</form>
						 	</div>
						 	
		   </div>
 
	 	</div>
	 </div>
 </div>
	<% 
		}else{
	
				response.sendRedirect("login.jsp");
			}
		}catch(Exception e){
	
			response.sendRedirect("login.jsp");
			
		}
	%>
</body>
</html>