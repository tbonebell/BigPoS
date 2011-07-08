<%@page import="com.dentondeli.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Clock In/Out</title>
</head>
<body>
<form name="clock_in" action="employee_time.jsp" method="post"><input
	type="hidden" name="attempt" value="true" /> Enter your id and
password to clock in: ID: <input id="employee_id" name="employee_id"
	type="text" /> <br>
Password: <input id="password" name="password" type="password" /> <br>
<input type="submit" name="submit" value="Clock In" /></form>
<br>
<i> 

<%
 	// if sucessfull clock in, record time, show time clocked in
 	if (request.getParameter("attempt") != null) {
 		if (request.getParameter("employee_id") != null
 				&& request.getParameter("password") != null) {
 			int id = Integer.parseInt(request.getParameter("employee_id"));
 			String password = (String) request.getParameter("password");
 			//check good pw:
 			Employee currentEmployee = new Employee(id, password);
 			if (currentEmployee.goodPassword()) {
 				//ok, punch in
 				String clockedIn = currentEmployee.ClockIn();
 				out.write("You were clocked in at: "+clockedIn);
 			} else {
 				// give some message for bad password
 				out.write("Your password entry sucked!");
 			}

 		} else {
 			out.write("Well, I gotta have something to go on!");
 		}
 	}


%> 
</i>
</body>
</html>