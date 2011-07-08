package com.dentondeli;

import java.sql.*;

public class DbHelper {
public DbHelper()
{	 
}

public static Connection con()
{
	Connection con = null;

	try {
		// Set the url
		String url = "jdbc:mysql://localhost:3306/DELI_POS";

		Class.forName("com.mysql.jdbc.Driver").newInstance();

		//Connect
		con = DriverManager.getConnection(url, "root", Globals.db_password);

	} catch (Exception e) {
		// do something
		String wrong = "";
		wrong = e.toString();
	}

	return con;
}

public static void closeConnection(Connection con)
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

}
