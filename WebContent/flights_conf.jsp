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
      <style>
      .button {
    border: none;
    color: white;
    padding: 10px 26px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 18px;
    margin: 4px 2px;
    cursor: pointer;
}

.button1 {
    background-color: #900C3F; 
    color: white; 
    border: 2px solid #900C3F;
    border-radius: 6px;
}

.button1:hover {
    background-color: white;
    color: #900C3F;
}
</style>
</head>
<body>
	<%@ page import="aircon.*"%>
	<%@ page 	import="java.sql.*"%>
	<%@ page 	import="javax.sql.*"%>
	<%! String fname; %>
	<%! String flname; %>
	<%! String femail; %>
	<%! String fid; %>
	<%! String deptime; %>
	<%! String arvtime; %>
	<%! double fare; %>
	<%! String name; %>
	<%! int  pid; %>
	<%! String visa; %>
	<%! String result; %>
	<%! int flag=1; %>
	<%! double fareph; %>
	<%! int n_c; %>
	<%! int n_a; %>
	<%! double child_fare; %>
	<%
		try{
			Dblogin dbl=new Dblogin();
		if(!(session.getAttribute("key1").equals(null))){
				
				Connection con=dbl.dbcnn();	
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
		<li><a  href="#contact">Contact Us</a></li>
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
						 		<h2>Your flight</h2>
						 		<%
								 		//Dblogin dbl=new Dblogin();
									 		String leavingfrom=request.getParameter("leavingfrom");
										String goingto=request.getParameter("goingto");
										String d_date=request.getParameter("d_date");
										String adult=request.getParameter("adult");
										String children=request.getParameter("children");
										String visa=request.getParameter("visa");
										PreparedStatement ps1= con.prepareStatement("select * from flight_details where fromp=? and top=?");
										ps1.setString(1,leavingfrom);
										ps1.setString(2,goingto);
										ResultSet rs1= ps1.executeQuery();
										if(rs1.next()){
											pid=rs1.getInt("id");
											name=rs1.getString("name");
											session.setAttribute("plane", name);
											deptime=rs1.getString("deptime");
											arvtime=rs1.getString("arvtime");
											fare=rs1.getDouble("fare");
											flag=0;
											n_c=Integer.parseInt(children);
											 n_a=Integer.parseInt(adult);
											//out.print("no of child:"+ n_c+"\n no of adult"+n_a);
											fareph=fare;
											child_fare=fare/2;
											fare=fare*n_c/2 +fare*n_a;
										%>
											<table id="score">
												<tr>
													<th>Details</th>
													<th>Description</th>
												</tr>
												<tr>
													<td>Flight name:</td>
													<td><%= name %></td>
												</tr>
												<tr>
													<td>Flight from:</td>
													<td><%= leavingfrom %></td>
												</tr>
												<tr>
													<td>Flight Destination:</td>
													<td><%= goingto %></td>
												</tr>
												<tr>
													<td>Flight date:</td>
													<td><%=  d_date%></td>
												</tr>
												<tr>
													<td>Flight time:</td>
													<td><%= deptime %></td>
												</tr>
												<tr>
													<td>No of Adult:</td>
													<td><%= n_a %></td>
												</tr>
												<tr>
													<td>No of Child:</td>
													<td><%= n_c %></td>
												</tr>
												<tr>
													<td>Flight fare /person:</td>
													<td><%= fareph %></td>
												</tr>
												<tr>
													<td>Flight fare /child:</td>
													<td><%= child_fare %></td>
												</tr>
												<tr>
													<td>Total fare:</td>
													<td><%= fare %></td>
												</tr>
											</table><br>
											<div style="float:right;"><a href="flights.jsp"><button class="button button1">Cancel</button></a></div>
											<br><br><br><hr>
											<h2>Payment:-</h2>
											<form name="payment" action="payment.jsp" method="POST">
												<input type="number" name="money" placeholder="Enter amount">
												<input type="hidden" name="d_date" value="<%=  d_date%>">
												<input type="hidden" name="fare" value="<%= fare %> ">
												<input type="hidden" name="leavingfrom" value="<%= leavingfrom %>">
												<input type="hidden" name="goingto" value="<%= goingto %>">
												<input type="hidden" name="adult" value="<%= adult %>">
												<input type="hidden" name="children" value="<%= children %>">
												<input type="submit" value="submit"> 
											</form>
								<% 		
									}
										else{%>
										<h3>----------:flight not available:---------- </h3>
										<div style="float:right;"><a href="flights.jsp"><button class="button button1">Back</button></a></div>
										
								<%
									}
						 		%>
						 		
							</div>
						 	
		  			 </div>
 
	 	</div>
	 </div>
 </div>

	<% 
		}else{
			//out.print("else wala");
				response.sendRedirect("login.jsp");
			}
		}catch(Exception e){
			//out.print("exception"+e);
			response.sendRedirect("login.jsp");
			
		}
	%>
</body>
</html>