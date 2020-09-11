<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	//String email=(String)session.getAttribute("key1");
//String pass=(String)session.getAttribute("key2");
try
{
		session.invalidate();
		response.sendRedirect("login.jsp");

}catch(Exception e)
{
	out.println(e);
}
	%>
</body>
</html>