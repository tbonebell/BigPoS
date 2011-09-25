package com.dentondeli;
import java.sql.*;
import java.util.*;

import org.apache.tomcat.util.json.JSONObject;


public class Menu {

	private Connection con = DbHelper.con();

	public ArrayList getItems() throws Exception {
		Connection con = this.con;
		ResultSet rs = null;
		ArrayList items = new ArrayList();


		// check connection and get results
		if (con != null) {
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery("Select id, name, price from menu_items");
			while(rs.next()){
				MenuItem item = new MenuItem();
				   item.setId(rs.getInt("id"));
				   item.setName(rs.getString("name"));
				   item.setPrice(rs.getInt("price"));
				   items.add(item);		   
			}
		}

		DbHelper.closeConnection(con);
		
		return items;
	}
	
	public String jsonMenu() throws Exception
	{
		JSONObject jo = new JSONObject();
		
		Menu m = new Menu();
		try {	
		
		ArrayList mi = m.getItems();
		
		for (int i=0;i<mi.size();i++)
		{
			MenuItem currentItem = (MenuItem)mi.get(i);			
			jo.put(new Integer(currentItem.getId()).toString(),new JSONObject(currentItem));			
		}
		
		return jo.toString();
	
		}catch(Exception e){
			
			// TODO: handle
			return e.toString();
		}
	}
}

