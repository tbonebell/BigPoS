<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dentondeli.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Killer Food Ordered Here!</title>
<link href="css/main_style.css" rel="stylesheet" type="text/css" media="screen" />
<script src="js/jquery-1.6.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-ui-1.8.13.custom.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/deli.js" type="text/javascript"></script>
</head>
<script>
var order_item = function(id, name, price)
{
	this.id = id;
	this.name = name;
	this.price = price;
};

var order_list = function()
{
	this.items = new Array();	
};

</script>
<body>
<a href="manager.jsp">Manager's Page</a>
<a href="timeclock.jsp">Punch In/Out</a>
<div id="header">
Order Up Some Sandwiches!
</div>
<hr>
<div id="menu_selection">
<ul id="tags">
<%

Menu menu = new Menu(); 
ArrayList items = menu.getItems();
for(int i=0;i<items.size();i++)
{
	MenuItem item = (MenuItem)items.get(i);
	out.print("<li id='"+item.getId()+"'>"+item.getName()+"<br>"+item.getPrice()+"</li>");	
}

%>
</ul>
<script>
order_listing = new order_list();
<%

for(int i=0;i<items.size();i++)
{
	MenuItem item = (MenuItem)items.get(i);
	int k=i+1;
	out.print("order_listing.items["+k+"] = new order_item("+k+",'"+item.getName()+"','"+item.getPrice()+"');\n");	
}

%>
</script>

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