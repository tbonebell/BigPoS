package com.dentondeli;

import java.sql.*;
import java.util.Calendar;


public class Employee {

	private Connection con;
	private Boolean goodPassword = false;
	private int id;

	
	public Employee(int id, String password)
	{
		//set the id
		this.id = id;
		//go to db and check pw
		con = DbHelper.con();
		String sql = "select password from employee where id = ?";

		ResultSet rs = null;
		String savedPw = "";
		try{

			// check connection and get results
			if (con != null) {
				PreparedStatement prepStmt = con.prepareStatement(sql);
				prepStmt.setInt(1,id);
				rs = prepStmt.executeQuery();
				while(rs.next()){
					savedPw = rs.getString("password");
				}
				// check entered pw against saved pw
				if(password.equals(savedPw))
				{
					this.goodPassword = true;
				}
			}
		}
		catch(Exception e)
		{
			//TODO: some error handling
			String problem = e.getMessage();
			
			String logger ="The problem with the password check was	"+problem;
		}


	}
	public Boolean goodPassword()
	{
		return goodPassword; 
	}

	public String ClockIn(){
		String results = "";
		try{
		// open connection
		Connection con = DbHelper.con();
		String sql = "insert into timecard (employee_id, timein) values (?,?)";
		PreparedStatement prepStmt = con.prepareStatement(sql);
		java.sql.Timestamp dt;

		// check connection and get results
		if (con != null) {
			prepStmt.setInt(1,this.id);
			Calendar cal = Calendar.getInstance();
			// why do I use Java again?
			dt = new java.sql.Timestamp(cal.getTime().getTime());
			results = cal.getTime().toString();
			
			prepStmt.setTimestamp(2, dt);
			prepStmt.executeUpdate();			   
		}
		}
		catch(Exception e)
		{
			// TODO: handle
			String problem = e.getMessage();
			
			results ="The problem with the password check was	"+problem;
		}
		finally{
			return results;
			
		}

	}
}

