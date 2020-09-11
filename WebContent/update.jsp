<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
			    	String admin_e=(String)session.getAttribute("admin_e");
			    	String admin_p=(String)session.getAttribute("admin_p");
			    	if(admin_e==null && admin_p==null){
			    		response.sendRedirect("admin_login.jsp");
			    		return ;
			    	}
	%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="entire_db_grid_view_stylesheet.css">
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="student.*" %>
	<%! ResultSet urs,ors;
		String[] oldrs = new String[20];
		String[] newrs = new String[20];
		
	%>
	
	<% 	String bp=request.getParameter("updatebutton");
			try{
				if(bp!=null && bp.equals("UPDATE")){
					StudentDemo sd=new StudentDemo();
					String str = request.getParameter("Id");
					
						int id =Integer.parseInt(str);
					
					String fname=request.getParameter("fname");
					String fsource=request.getParameter("fsource");
					String fdest=request.getParameter("fdest");
					int depdate=Integer.parseInt(request.getParameter("depdate"));
					String deptime=request.getParameter("deptime");
					String arrivtime=request.getParameter("arrivtime");
					double fare=Double.parseDouble(request.getParameter("fare"));
					int i=sd.update(id, fname, fsource, fdest, depdate, deptime, arrivtime, fare);
					urs=sd.display(id);
					if(urs.next()){
						newrs[2]=ors.getString(2);
						newrs[3]=ors.getString(3);
						newrs[4]=ors.getString(4);
						newrs[5]=Integer.toString((ors.getInt(5)));
						newrs[6]=ors.getString(6);
						newrs[7]=ors.getString(7);
						newrs[8]=ors.getString(8);
					}
					if(i>0)
					out.print("Updated Successfully");
				}
				else{
					StudentDemo sd=new StudentDemo();
					String str = request.getParameter("Id");
					int id =Integer.parseInt(str);
					ors=sd.display(id);
					if(ors.next()){
						oldrs[2]=ors.getString(2);
						oldrs[3]=ors.getString(3);
						oldrs[4]=ors.getString(4);
						oldrs[5]=Integer.toString((ors.getInt(5)));
						oldrs[6]=ors.getString(6);
						oldrs[7]=ors.getString(7);
						oldrs[8]=ors.getString(8);
					}
				}
				}catch(Exception e){
					response.sendRedirect("admin_login.jsp");
				}%>
	
	

	
	
	
	<center><marquee behavior=alternate scrollamount="10"><h1>DATA BASE UPDATING PAGE</h1></marquee></center>

<form action="" method="POST">




<table border="2" align="center" align="center">
			<tr>
				<td>
					FLIGHT NAME:
				</td>
				<td>
					<input class="box" type="text" name="fname" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
											if(bp!=null && bp.equals("UPDATE")){
													out.print(newrs[2]);
											}
											else
												out.print(oldrs[2]);
											%>">
				</td>
			</tr>
			<tr>
				<td>
					FLIGHT SOURCE
				</td>
				<td>
					<input class="box" type="text" name="fsource" style="width:90%;" required="" value="<% 
					bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[3]);
					}
					else
						out.print(oldrs[3]);
					%>">
				</td>
			</tr>
			
			<tr>
				<td>
					FLIGHT DESTINATION
				</td>
				
				<td>
					<input class="box" type="text" name="fdest" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[4]);
					}
					else
						out.print(oldrs[4]);
					%>">
				</td>
			</tr>
			
			<tr>
				<td>
					N.O.S
				</td>
				
				<td>
					<input class="box" type="text" name="depdate" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[5]);
					}
					else
						out.print(oldrs[5]);
					%>">
				</td>
			</tr>
			
			<tr>
				<td>
					DEPARTURE TIME
				</td>
				
				<td>
					<input class="box" type="text" name="deptime" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[6]);
					}
					else
						out.print(oldrs[6]);
					%>">
				</td>
			</tr>
			
			<tr>
				<td>
					ARRIVAL TIME
				</td>
				
				<td>
					<input class="box" type="text" name="arrivtime" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[7]);
					}
					else
						out.print(oldrs[7]);
					%>">
				</td>
			</tr>
			<tr>
				<td>
					FARE
				</td>
				
				<td>
					<input class="box" type="text" name="fare" style="width:90%;" required="" value="<% 
													bp=request.getParameter("updatebutton");
					if(bp!=null && bp.equals("UPDATE")){
							out.print(newrs[8]);
					}
					else
						out.print(oldrs[8]);
					%>">
				</td>
			</tr>
			<tr>
				<table  align="center">
					<tr>
						<td>
							<input style="background-color:green; height:40px; width:400px;" type="submit" name="updatebutton" value="UPDATE" onclick="return confirm('Are you sure');">
						</td>
					</tr>
				</table>
			</tr>
			<tr>
				<table align="center">
					<tr>
						<td>
							<a href="grid_view.jsp">VIEW GRID TABLE</a>
						</td>
					</tr>
				</table>
				
			</tr>
</table>
<table border="2" align="center">
	<tr>
		<td>
			<a href="admin_logout.jsp">LOG OUT</a>
		</td>
	</tr>
</table>
</form>
	
	
</body>
</html>