<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Entry</title>
</head>
<body>
<form id="employee_login" name="employee_login" method="post" action="timeclock.jsp">
<br>
Employee ID: <input id="login_id" name="login_id" type="text" value="" />
<br>
Password: <input id="employee_password" name="employee_password" type="password" value="" />
<br>
<input type="submit" value="Login" />
</form>
<%
if(request.getParameter("login_id")!=null)
{
out.write("Login ID: " +request.getParameter("login_id"));
}
%>
<br>
<% 
if(request.getParameter("employee_password")!=null)
{
out.write("Password: " +request.getParameter("employee_password"));
}
%>
</body>
</html>