package testing;

import java.sql.*;

public class Dbtest {
	public static void main(String[] args) throws Exception {
		String html = "";
		Connection con = null;
		ResultSet rs = null;
		try {
			// Set the url
			String url = "jdbc:mysql://localhost:3306/DELI_POS";
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			
			//Connect
			con = DriverManager.getConnection(url, "root", "m0dal1ne");
			
			
			// check connection and get results
			if (con != null) {
	
				Statement stmt = con.createStatement();
				rs = stmt.executeQuery("Select id, name, price from menu_items");
				while(rs.next()){
					html += "<input type='button' value='"+rs.getString(2)+"' />\n";
					
				}
				System.out.println(html);
			}
		} catch (Exception e) {
			System.out.println("Problem: " + e.toString());
		}
		
		finally {
			if (con != null) {
				try {
					con.close();
			} catch (Exception e) {
				// report
			}
		}
		}
	}
}
	
		


