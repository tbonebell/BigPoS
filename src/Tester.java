import java.util.*;
import com.dentondeli.*;


public class Tester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Menu m = new Menu();
		try {
			
		
		ArrayList mi = m.getItems();
		
		for (int i=0;i<mi.size();i++)
		{
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
