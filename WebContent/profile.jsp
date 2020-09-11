<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profile</title>
<link rel="stylesheet" type="text/css" href="profile.css"/>
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
	<%! String pname; %>
	<%! String depdate; %>
	<%! String deptime; %>
	<%! double fare; %>
	<%! int tid;%>
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
		<li><a class="active" href="#profile">Profile</a></li>
		<li><a href="flights.jsp">Flights</a></li>
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
							<th><h1 style="color:#000000">Profile</h1></th>
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
								<img src="img/g1.gif">
						 		<h2>Name: <%= fname %>  <%= flname %></h2>
						 		<h2>Email: <%= femail %></h2>
						 		<h2>Your Id: <%= fid %></h2>
                                <h2>Book Flights:  <a href="http://www.coolclub.comli.com/quiz.php"><i class="fa faarrowcircleright" style="fontsize:36pxcolor:#000000"></i></a></h2>
						 	</div>
						 	<div class="block">
						 		<h1>Booking Summary:</h1>
						 		
						 		<table id="score">
						 			<tr>
						 				<th><img src="http://image.shutterstock.com/z/stock-vector-profile-picture-symbol-vector-silhouette-man-icon-263564516.jpg"  width="40" height="40"></th>
						 				<th>Pname</th>
						 				<th>Date</th>
						 				<th>Time</th>
						 				<th>T-fare</th>
						 				<th>T-id</th>
						 			</tr>
						 			<%
						 			PreparedStatement ps1= con.prepareStatement("select * from booked where name=?");
									ps1.setString(1, fname);
									ResultSet rs1= ps1.executeQuery();
									
										while(rs1.next()){%>
											<tr>
											<td><img src="http://creativestockphoto.com/wp-content/uploads/2014/10/images-of-man-and-woman-in-love.jpg"  width="40" height="40"></td>
											<% pname=rs1.getString("pname");%>
											<td><%= pname%></td>
											<% depdate=rs1.getString("depdate");%>
											<td><%= depdate%></td>
											<% deptime=rs1.getString("deptime");%>
											<td><%= deptime%></td>
											<% fare=rs1.getDouble("fare");%>
											<td><%= fare%></td>
											<% tid=rs1.getInt("id");%>
											<td><%= tid%></td>
											</tr>
									<% 	}
									
						 			%>
						 			 </table>
					</div>
		   </div>
 
	 	</div>
	 </div>
 </div>
	<% 
		}else{
			out.print("else wala");
				//response.sendRedirect("login.jsp");
			}
		}catch(Exception e){
			out.print("ee=="+e);
			//response.sendRedirect("login.jsp");
			
		}
	%>
</body>
</html>