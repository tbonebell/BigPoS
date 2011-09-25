import java.util.*;

import org.apache.tomcat.util.json.*;

import com.dentondeli.*;


public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*
		JSONObject jo = new JSONObject();
			
		Menu m = new Menu();
		try {
			
		
		ArrayList mi = m.getItems();
		
		for (int i=0;i<mi.size();i++)
		{
			MenuItem currentItem = (MenuItem)mi.get(i);			
			jo.put(currentItem.getName(),new JSONObject(currentItem));
			//System.out.println(jo.toString());
		}
		
		System.out.println(jo.toString());
	
		}catch(Exception e){
			
			System.out.println(e.toString());
		}
		*/
		Menu m = new Menu();
		
		Order o = new Order(new Date(),"Day");
		try{
			ArrayList am = m.getItems();
			o.openCheck("Day");
			MenuItem sandwich = (MenuItem)am.get(0);
			MenuItem sandwich2 = (MenuItem)am.get(1);
			o.addItemToOrder(sandwich);
			o.addItemToOrder(sandwich2);
			//o.applyPercentageDiscount(.50);
			//o.applyDollarAmountDisount(100);
			System.out.println(sandwich.getName()+" : "+ sandwich2.getName());
			System.out.println("Sub Total: " + Integer.toString(o.getSubTotal()));
			System.out.println("Total: " + Integer.toString(o.getTotal()));
			o.closeCheck();
	
		}
		catch(Exception e)
		{
			// do something!
		}
		
	}
}
