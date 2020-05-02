/*
		EA Order Form
					JavaScript Files
	Coder	: Evrim Altay KOLUACIK
	Help	: https://support.rimtay.com/
	
	All rights are reserved.
*/	
	function getPrice(id){
		var	quantity	= $("input[name=quantity-"+id+"]").val();
		var	price		= $("input[name=price-"+id+"]").val();
		if(yEdition){
			var	tax		= 0;
		}else{
			var tax 	= $("input[name=tax-" + id + "]").val();
		}
		var total		= (((quantity * price) * tax) / 100) + (quantity * price);
		if(quantity >= 0){
			total = total.toFixed(2);
			$("input[name=total-"+id+"]").val(total); 
			
			getTotal();
		}	
	}

	function getTotal(){
		var subtotal = 0;
		$("td.rimproducts .rimtotal").each(function(index,element){
		
			subtotal = subtotal + parseFloat($(element).val());
		});
		if(yEdition){
			var fees = calculateFees(subtotal);
			$("input[name=subtotalf]").val(subtotal); 
			subtotal = fees + subtotal;
			$("input[name=fees]").val(fees); 
		}
		subtotal = subtotal.toFixed(2);
		
		$("input[name=subtotal]").val(subtotal); 
	}

	function calculateFees(subTotal){
		var fees = 0;
		if(subTotal == 0){
			fees = 0.00;
		}else if(subTotal <= 10){
			fees = 1.00;
		}else if(subTotal <= 12.50){
			fees = 1.50;
		}else if(subTotal <= 15){
			fees = 2.00;
		}else{
			fees = 2.50;
		}
		return fees;
	}
	(function ($) {
		"use strict";
		lightbox.option({
			'resizeDuration': 200,
			'wrapAround': true
		})
	})(jQuery);