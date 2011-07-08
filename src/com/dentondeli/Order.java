package com.dentondeli;

import java.sql.*;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Order {
	
	private String cashier = "";
	private Boolean cashOrder;
	private Boolean closed;
	private int finalTotal;
	private int order_id;
	private ArrayList order_items;
	private Date orderTime;
	private int subTotal;
	private double tax = Globals.TAX;
	
	
	public Order(Date orderTime, String cashier){
		orderTime = orderTime;
		cashier = cashier;
		closed = false;
		order_id = -1;
		order_items = new ArrayList();
	}
	
	public void addItemToOrder(MenuItem orderItem)
	{
		this.order_items.add(orderItem);
	}
	
	private void addTax()
	{
		double d = this.subTotal*(1+this.tax);
		this.finalTotal = (int) Math.round(d);
	}
	
	public void applyPercentageDiscount(double percentage)
	{
		// applies discount evenly to all menu items...
		for (int i=0;i<this.order_items.size();i++)
		{
			MenuItem item = (MenuItem)this.order_items.get(i);
			int discountedPrice = item.getPrice() - (int)Math.round(item.getPrice()*percentage);
			item.setPrice(discountedPrice);
		}
	}
	
	public void applyDollarAmountDisount(int amountInPennies)
	{
		// applies discount evenly to all menu items...
		int discountForEach = Math.round(amountInPennies/this.order_items.size());
		for (int i=0;i<this.order_items.size();i++)
		{
			MenuItem item = (MenuItem)this.order_items.get(i);
			int discountedPrice = item.getPrice() - discountForEach;
			item.setPrice(discountedPrice);
		}
	}
	
	public void closeCheck() throws SQLException
	{
		Connection con = DbHelper.con();
		// check connection and get results
		if (con != null) {
			Statement stmt = con.createStatement();
			for(int i=0;i<this.order_items.size();i++)
			{
				MenuItem item = (MenuItem)order_items.get(i);
				int sub_total = item.getPrice();
				int final_total = sub_total + (int)Math.round(item.getPrice()*Globals.TAX);
				String sql = "insert into order_items (order_number, menu_item, sub_total, total) VALUES ("+
				this.order_id+","+item.getId()+","+sub_total+","+final_total+")";
				stmt.execute(sql);
			}
			stmt.execute("Update pos_order set `open` = 0 where order_number = "+this.order_id);
			stmt.execute("Update pos_order set `sub_total` = "+this.getSubTotal()+" where order_number = "+this.order_id);
			stmt.execute("Update pos_order set `total` = "+this.getTotal()+" where order_number = "+this.order_id);
			this.closed = true;
			closeCon(con);
		}
	}
	
	private void closeCon(Connection con)
	{
		// clean up connection
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// report
				String wrong = "";
				wrong = e.toString();
			}
		}
	}
	

	public int getSubTotal()
	{
		int subTotal = 0;
		for (int i=0;i<this.order_items.size();i++)
		{
			MenuItem item = (MenuItem)order_items.get(i);
			int price = item.getPrice();
			subTotal += price;
		}
		this.subTotal = subTotal;
		return this.subTotal;
	}
	
	public int getTotal(){
		this.addTax();
		return this.finalTotal;
	}
	
	public void openCheck(String register) throws SQLException
	{
		Connection con = DbHelper.con();
		int order_id = -1;

		// check connection and get results
		if (con != null) {
			Statement stmt = con.createStatement();
			con.setAutoCommit(true);
			ResultSet rs = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String sqlDate = sdf.format(new Date());
			String sql = "INSERT INTO pos_order (`order_time`, `cashier`,`open`) VALUES ('"+sqlDate+"','"+register+"',1)";
			stmt.execute(sql,Statement.RETURN_GENERATED_KEYS);
			
			rs = stmt.getGeneratedKeys();
			if(rs.next())
			{
			order_id = rs.getInt(1);
			}
			closeCon(con);
			
			this.order_id = order_id;
		}
	}

	public void setTax(int taxRate)
	{
		this.tax = taxRate;
	}
	
}
