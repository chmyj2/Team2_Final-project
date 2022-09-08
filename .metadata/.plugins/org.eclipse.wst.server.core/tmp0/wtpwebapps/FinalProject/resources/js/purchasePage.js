var prevStock = 0;

function quantityChange(quantity, price,stock){
	if( quantity.value>stock ){
		quantity.value = stock;
		alert("재고보다 많은 수량은 구매 불가능합니다");
		return false;
	}

	if(quantity.value<=0){
	quantity.value = 1;
	alert("1개 이상을 선택해주세요");
	return false;
	}	

	document.getElementById("totalPrice").innerHTML= quantity.value*price;
	document.getElementById("totalPrice2").innerHTML= quantity.value*price +3000;
	}




function purchasePageGo(product_num) {
	var check = document.getElementById("aaa").value;
	if(check == 0){
		
		alert("로그인 이후에 이용 가능합니다");
		$('#purchaseForm').submit();
	}else{
		$('#purchaseForm').submit();
	}
	
	
	
	
}