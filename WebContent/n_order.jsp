<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dentondeli.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Killer Food Ordered Here!</title>
<link href="css/main_style.css" rel="stylesheet" type="text/css" media="screen" />
<script src="js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/deli.js" type="text/javascript"></script>
</head>

<body>
<script>
	var menuItems = <%= new Menu().jsonMenu() %>;
	$(document).ready(function(){
		
		
		
		
		
	});
	
</script>
<a href="manager.jsp">Manager's Page</a>
<a href="timeclock.jsp">Punch In/Out</a>
<div id="header">
Order Up Some Sandwiches!
</div>
<hr>
<div id="menu_selection">
<ul id="tags">
<%
	Menu m = new Menu();
	
	ArrayList am = m.getItems();
	
	for(int i=0;i<am.size();i++){
		 MenuItem mi = (MenuItem)am.get(i);
		out.print("<li id="+mi.getId()+">"+mi.getName()+"</li>");
	}

%>
</ul>


<br />
      <div id="tag-control">
        <button id="clear">Clear</button>
      </div>
      
</div>
<div id="order_panel">
Current Order:
<ul id="order_list">

</ul>
<div id="total_area">

</div>
<form id="theOrderForm" method="post" action="closeCheck.jsp">
<input id="current_order" name="current_order" type="hidden" value="" />
</form>
<div id="pay_buttons">
<hr>
	<button id="pay_button">Pay</button>
	<br>
	Percent Discount: <input id="percentage_discount" name="percentage_discout" value=0 />
	<br>
	Dollar Discount: <input id="dollar_discount" name="dollar_discount" value=0 />
	
</div>
</div>
</body>
</html>