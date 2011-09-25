
$(document).ready(function() {
	var tax_rate = 8.25;
	current_order = new order_list();
	function clearOrder() {
		$('#tags')
		.find('li')
		.removeClass('ui-selected');
		$('#approved').val('');
		current_order.items.length = 0;
		$('#percentage_discount').val(0);
		$('#dollar_discount').val(0);
		displayOrder();
	};
	function applyPercentageDiscount(percentage) {
		// applies discount evenly to all menu items...
		for (i=0;i<current_order.items.length;i++)
		{
			current_order.items[i].price = current_order.items[i].price - current_order.items[i].price*percentage/100;
		}
		displayOrder();
	};
	function applyDollarDiscount(amountInPennies)
	{
		// applies discount evenly to all menu items...
		discountForEach = Math.round(amountInPennies/current_order.items.length);
		for (i=0;i<current_order.items.length;i++)
		{
			current_order.items[i].price -= discountForEach;
		}
		displayOrder();
	};
	function writeToDB()
	{
		// create an xml string for posting
		var orderXML = "<current_order>";
		for (l=0;l<current_order.items.length;l++)
		{
			id = current_order.items[l].id;
			item_name = order_listing.items[id].name;
			price = order_listing.items[id].price;
			orderXML += "<order_item>";
			orderXML += "<item_id>" + id + "</item_id>";
			orderXML += "<item_name>" + item_name + "</item_name>";
			orderXML += "<item_price>" + price + "</item_price>";
			orderXML += "</order_item>";
		}
		orderXML += "</current_order>";
		
		$.get("closeCheck.jsp",{"current_order":orderXML});
	};
	function removeItemFromOrder(id)
	{
		id = id.replace("current_order_item","");
		current_order.items.splice(id,1);
		displayOrder();	
	};
	
	function addToOrder(id)
	{
		next_item = current_order.items.length;
		item_name = order_listing.items[id].name;
		price = order_listing.items[id].price;
		current_order.items[next_item] = new order_item(id,item_name,price);
		displayOrder();
	};
	
	function displayOrder()
	{
		$('#order_list').html("");
		$('#total_area').html("");

		for (i=0;i<current_order.items.length;i++)
		{
			id = current_order.items[i].id;
			item_name = order_listing.items[id].name;
			price = Math.round(current_order.items[i].price);
			
			$("<li id='current_order_item"+i+"' class='ui-selectee'>"+item_name+" : "+price+"</li>")
				.appendTo('#order_list');
			$('#current_order_item'+i).click(function(){
				removeItemFromOrder(this.id);
			})
			displayTotals();
		}
		
	};
	

	
	function totalOrder() {
		var total = 0;
		for (k=0;k<current_order.items.length;k++)
		{
			total += eval(current_order.items[k].price);	  
		}

		total = Math.round(total);

		return total;
	};
	
	function displayTotals()
	{
		$('#total_area').html("<hr>Sub Total: $"+totalOrder()+"<br>With Tax: $"+addTax(totalOrder()));
	}
	function addTax(subTotal)
	{
		with_tax = subTotal*tax_rate*.01+subTotal;
		with_tax = Math.round(with_tax);
		return with_tax;

	};
	
	$('#tags li').click(function() {
		addToOrder(this.id);
	});

	$('#percentage_discount').blur(function() {
		applyPercentageDiscount(this.value);
	});
	$('#dollar_discount').blur(function() {
		applyDollarDiscount(this.value);
	});
	$('#pay_button').click(function() {
		writeToDB();
		alert("Amount to collect: "+ addTax(totalOrder()));
		clearOrder();
	});

	$('#clear').click(function() {
		clearOrder();

	});
	$('#total').click(function() {
		totalOrder();
	});
	
	// refactor here:
	
});