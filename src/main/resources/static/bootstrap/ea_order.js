/*
		EA Order Form
					JavaScript Files
	Coder	: Evrim Altay KOLUACIK
	Help	: https://support.rimtay.com/
	
	All rights are reserved.
*///加
function floatAdd(arg1,arg2){
	var r1,r2,m;
	try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	m=Math.pow(10,Math.max(r1,r2));
	return (arg1*m+arg2*m)/m;
}

//减
function floatSub(arg1,arg2){
	var r1,r2,m,n;
	try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
	try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
	m=Math.pow(10,Math.max(r1,r2));
	//动态控制精度长度
	n=(r1>=r2)?r1:r2;
	return ((arg1*m-arg2*m)/m).toFixed(n);
}

//乘
function floatMul(arg1,arg2)   {
	var m=0,s1=arg1.toString(),s2=arg2.toString();
	try{m+=s1.split(".")[1].length}catch(e){}
	try{m+=s2.split(".")[1].length}catch(e){}
	return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
}


//除
function floatDiv(arg1,arg2){
	var t1=0,t2=0,r1,r2;
	try{t1=arg1.toString().split(".")[1].length}catch(e){}
	try{t2=arg2.toString().split(".")[1].length}catch(e){}

	r1=Number(arg1.toString().replace(".",""));

	r2=Number(arg2.toString().replace(".",""));
	return (r1/r2)*Math.pow(10,t2-t1);
}


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