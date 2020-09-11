<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" type="text/css" href="profile.css">
<link rel="stylesheet" type="text/css" href="table.css"/>
      <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.6.3/css/fontawesome.min.css">
      <style> 
#ticket {
    background: url(http://icons.iconarchive.com/icons/icons8/ios7/256/Transport-Airplane-Take-Off-icon.png) left top no-repeat, url(http://www.freeiconspng.com/uploads/plane-icon--iconshow-14.png) right bottom no-repeat, #CCD1D1   left top repeat;
    padding: 15px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 15px 0 rgba(0, 0, 0, 0.19);
    background-size: 50px, 130px, auto;
}

table {
    border-collapse: collapse;
    width: 40%;
    margin-left:10%;
    display:inline;
}

 td {
    text-align: left;
    padding: 8px;
    font-style: italic;
}

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
	<%! int tid; %>
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
						 		
						 		
						 		<%
								 		//Dblogin dbl=new Dblogin();
						 					String money= request.getParameter("money");
						 					String d_date=request.getParameter("d_date");
						 					//String children=request.getParameter("children");
						 					//String adult=request.getParameter("adult");
						 					String leavingfrom=request.getParameter("leavingfrom");
									 		String goingto=request.getParameter("goingto");
									 		
						 					/* String fname=request.getParameter("fname");
						 					String name=request.getParameter("name");
											
											//String adult=request.getParameter("adult");
											//String children=request.getParameter("children");
											String deptime=request.getParameter("deptime");
											String arvtime=request.getParameter("arvtime");
											String pid=request.getParameter("pid"); */
											String fareMatch=(String)request.getParameter("fare"); 
											String pname=(String)session.getAttribute("plane");
											PreparedStatement ps1= con.prepareStatement("select * from flight_details where name=?");
											ps1.setString(1,pname);
											ResultSet rs1= ps1.executeQuery();
											while(rs1.next()){
												pid=rs1.getInt("id");
												name=rs1.getString("name");
												deptime=rs1.getString("deptime");
												arvtime=rs1.getString("arvtime");
												fare=rs1.getDouble("fare");
											String s=fareMatch.split("\\.")[0];
												
											//out.print("\n"+money+"\t"+"\n"+s);
											if(money.equals(s)){ %>
												
												<h3>---------payment accepted--------</h3>
												<h2>Ticket:</h2><hr>
												<div id="ticket">
													<h1 style="text-align:center;">Air ticket</h1>
												
											<% 	 result=dbl.insert(fname,name,pid,d_date,deptime,arvtime,Double.parseDouble(s));
												if(result.equals("Succesfully booked")){

													PreparedStatement ps2= con.prepareStatement("SELECT id FROM booked ORDER BY id DESC LIMIT 1");
													ResultSet rs2= ps2.executeQuery();
													while(rs2.next()){
														
														tid=rs2.getInt(1);
													}
													
													flag=0;
													%>
													<table>
														     <tr>
														    <td><b>Ticket No:</b></td>
														    <td><%= tid %></td>
														
														  </tr>
														  <tr>
														    <td><b>Person Name</b></td>
														    <td><%= fname %></td>
														    
														  </tr>
														  <tr>
														    <td><b>Flight name</b></td>
														    <td><%= name %></td>
														  </tr>
														  <tr>
														    <td><b>Flight from</b></td>
														    <td><%= leavingfrom %></td>
														
														  </tr>
														 
														  </table>
														  <table>
														  <tr>
														     <td><b>Flight Date</b></td>
														    <td><%=  d_date%></td>
														    
														  </tr>
														  <tr>
														    <td><b>Flight time</b></td>
														    <td><%= deptime %></td>
														
														  </tr>
														  <tr>
														    <td><b>Flight fare</b></td>
														    <td><%= s %></td>
														
														  </tr>
														  <tr>
														    <td><b>Flight Destination</b></td>
														    <td><%= goingto %></td>
														
														  </tr>
														  </table>
														
													</div>
											<br><br>
											<div style="float:right;"><a href="flights.jsp"><button class="button button1">Ok</button></a></div>
								<% 		}
									}
									
											else{%>
											<h2>payment rejected:</h2>
										<h3> you have to pay: <%= s %> </h3>
										<div style="float:right;"><a href="flights.jsp" target="_blank"><button class="button button1">Again</button></a></div>
								<%
									}
								}
						 		%>
						 		
							</div>
						 	
		  			 </div>
 
	 	</div>
	 </div>
 </div>

			<%
		}
		else{
			out.print("else wala");
				//response.sendRedirect("login.jsp");
			}
		}catch(Exception e){
			out.print("exception"+e);
			//response.sendRedirect("login.jsp");
			
		}
	%>
</body>
</html>