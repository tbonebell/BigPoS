import java.util.*;
<<<<<<< HEAD

import org.apache.tomcat.util.json.*;

=======
>>>>>>> 120bb415237972e776cba0d65d7e81bd0f949168
import com.dentondeli.*;


public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
<<<<<<< HEAD
		/*
		JSONObject jo = new JSONObject();
			
=======
>>>>>>> 120bb415237972e776cba0d65d7e81bd0f949168
		Menu m = new Menu();
		try {
			
		
		ArrayList mi = m.getItems();
		
		for (int i=0;i<mi.size();i++)
		{
<<<<<<< HEAD
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
=======
			MenuItem currentItem = (MenuItem)mi.get(i);
		
			System.out.println(
					currentItem.getName()+ " : " + currentItem.getPrice()
					);
		}
		
		
		}catch(Exception e){}
		
		// TODO Auto-generated method stub
		Order o = new Order(new Date(),"Day");
		try{
			o.openCheck("Day");
			MenuItem sandwich = new MenuItem();
			sandwich.setId(1);
			sandwich.setPrice(699);
			sandwich.setName("Beef");
			MenuItem sandwich2 = new MenuItem();
			sandwich2.setId(2);
			sandwich2.setPrice(698);
			sandwich2.setName("Vege");
			o.addItemToOrder(sandwich);
			o.addItemToOrder(sandwich2);
			o.applyPercentageDiscount(.50);
			o.applyDollarAmountDisount(100);
>>>>>>> 120bb415237972e776cba0d65d7e81bd0f949168
			System.out.println("Sub Total: " + Integer.toString(o.getSubTotal()));
			System.out.println("Total: " + Integer.toString(o.getTotal()));
			o.closeCheck();
	
		}
		catch(Exception e)
		{
			// do something!
		}
<<<<<<< HEAD
		
=======
>>>>>>> 120bb415237972e776cba0d65d7e81bd0f949168
	}
}
