<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights</title>
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
		<li><a class="active" href="#filghts">Flights</a></li>
		<li><a  href="contact.jsp">Contact Us</a></li>
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
							<th><h1 style="color:#000000">Flights</h1></th>
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
						 		<h2>Book flights:-</h2>
						 		<div class="block_1">
			
						 			<form name="booking" action="flights_conf.jsp">
						 				<input type="radio" name="trip" value="One way" checked> One way
						 				<input type="radio" name="trip" value="Round trip" > Round trip<br><br>
						 				<select name="leavingfrom" required>
						 					<option value="">leaving from..</option>
						 					<option value="KOLKATA">kolkata</option>
						 					<option value="MUMBAI">mumbai</option>
						 					<option value="DEHLI">dehli</option>
						 					<option value="KOTA">kota</option>
						 					<option value="CALIFORNIA">california</option>
						 					<option value="GUJARAT">gujarat</option>
						 					<option value="DUBAI">dubai</option>
						 					<option value="IRAQ">iraq</option>
						 					<option value="CHENNAI">chennai</option>
						 					<option value="PATNA">patna</option>
						 					<option value="hyderabad">hyderabad</option>
						 					<option value="kashmir">kashmir</option>
						 				</select>
						 				<select name="goingto" required>
						 					<option value="">leaving from..</option>
						 					<option value="KOLKATA">kolkata</option>
						 					<option value="MUMBAI">mumbai</option>
						 					<option value="DEHLI">dehli</option>
						 					<option value="KOTA">kota</option>
						 					<option value="CALIFORNIA">california</option>
						 					<option value="GUJARAT">gujarat</option>
						 					<option value="DUBAI">dubai</option>
						 					<option value="IRAQ">iraq</option>
						 					<option value="CHENNAI">chennai</option>
						 					<option value="PATNA">patna</option>
						 					<option value="hyderabad">hyderabad</option>
						 					<option value="kashmir">kashmir</option>
						 				</select><br><br>
						 				Departure date:
						 				<input type="text" name="d_date" placeholder="12-02-2017" required><br><br>
						 				Returning date:
						 				<input type="date" name="r_date"><br><br>
						 				<select name="adult" required>
						 				<option value="">Adults</option>
						 					<option value="1">1</option>
						 					<option value="2">2</option>
						 					<option value="3">3</option>
						 				</select>
						 				<select name="children">
						 					<option value="0">Children</option>
						 					<option value="1">1</option>
						 					<option value="2">2</option>
						 					<option value="3">3</option>
						 				</select><br><br>
						 				visa:
						 				<input type="text" name="visa" placeholder="VISA" required><br>
						 				<br>
						 				<input type="submit" value="Search Flights">
						 			</form>
						 		</div>
						 		<div class="block_2">
						 			<h2>Cancel ticket:-</h2>
						 			<form name="cancel" method="POST" action="delete_ticket.jsp">
						 				Ticket no:
						 				<input type="number"  name="tid" placeholder="Ticket no.." required="required">
						 				<input type="submit" value="Delete" onclick="return confirm('are you sure')">
						 			</form>
						 		</div>
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