<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% 
    	String admin_e=(String)session.getAttribute("admin_e");
    	String admin_p=(String)session.getAttribute("admin_p");
    	if(admin_e==null && admin_p==null){
    		response.sendRedirect("admin_login.jsp");
    	}
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<a href="grid_view.jsp">GRID VIEW</a>
<a href="addF.jsp">INSERT</a>
<a href="grid_view.jsp">DELETE</a>
<a href="grid_view.jsp">UPDATE</a>
<a href="admin_logout.jsp">LOG OUT</a>
<a href="add_admin.jsp">ADD ADMIN</a>
</body>
</html>