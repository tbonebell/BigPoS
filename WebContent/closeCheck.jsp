<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.dentondeli.*,java.util.*,javax.xml.parsers.*,org.xml.sax.*,org.w3c.dom.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Close Check</title>
</head>
<body>
<%
String orderXML = request.getParameter("current_order");
try {
	Order o = new Order(new Date(),"Day");
	o.openCheck("Day");
	
	
    DocumentBuilderFactory dbf =
        DocumentBuilderFactory.newInstance();
    DocumentBuilder db = dbf.newDocumentBuilder();
    InputSource is = new InputSource();
    is.setCharacterStream(new StringReader(orderXML));

    Document doc = db.parse(is);
    NodeList nodes = doc.getElementsByTagName("order_item");

    // iterate the employees
    for (int i = 0; i < nodes.getLength(); i++) {
    	MenuItem sandwich = new MenuItem();
    	
    	Element element = (Element) nodes.item(i);

       NodeList id = element.getElementsByTagName("item_id");
       Element id_line = (Element) id.item(0);
       sandwich.setId(Integer.parseInt(id_line.getTextContent()));
       NodeList name = element.getElementsByTagName("item_name");
       Element name_line = (Element) name.item(0);
       sandwich.setName(name_line.getTextContent());
       NodeList price = element.getElementsByTagName("item_price");
       Element price_line = (Element) price.item(0);
       sandwich.setPrice(Integer.parseInt(price_line.getTextContent()));
       o.addItemToOrder(sandwich);

    }
    o.closeCheck();
    %>
    <a href="order.jsp">New Order</a>
    <%
}
catch (Exception e) {
    e.printStackTrace();
}




%>

</body>
</html>