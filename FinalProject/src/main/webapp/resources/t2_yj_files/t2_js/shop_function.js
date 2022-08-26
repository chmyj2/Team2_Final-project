function shop_check_menu(){
var $menu_tabs = $('.menu__tabs li a'); 
	$menu_tabs.on('click', function(e) {
		e.preventDefault();
		$menu_tabs.removeClass('active');
		$(this).addClass('active');

		$('.menu__item').fadeOut(300);
		$(this.hash).delay(300).fadeIn();
	});

}


function agreeChangeBtn() {
	let btn = document.getElementById('nonmember_checkButton');
	let disabled = btn.disabled;
	if(disabled){
	btn.disabled = false;
	}else{
	btn.disabled = true;		
	}	
}


function setPrice(){
var checkArr = new Array();
var total = 0;
$("#cart .full-price").each(function( i, e ) {
     console.log($(this).text());
     checkArr.push($(this).text());
     total += Number(checkArr[i]);
   });
     $('#subPrice').text(total);
     $('#totalPrice').text(total + 2500);
     
     
}
     
function addressClick(){
 $('#sameAddressControl').click(function(){
     $("#addrSearchBtn").css("display","inline");
     var same = this.checked;
     $('#billAddress').val(same ? $('#shipAddress').text():'');
     $('#billCity').val(same ? $('#shipCity').text():'');
     $('#billState').val(same ? $('#shipState').text():'');
     $('#billState1').val(same ? $('#shipState1').text():'');
     $('#billState2').val(same ? $('#shipState2').text():'');
     $('#billZip').val(same ? $('#shipZip').val():'');
          if(same == true){
              $('#billingAddress input').filter('input:text')
             	 .attr('readonly',true)
             	 .css('opacity', 0.5);
             $("#addrSearchBtn").css("display","none");
             	}else{
              $('#billingAddress input').filter('input:text').attr('readonly',false)
           	 .css('opacity', 1);
          }
   });
}




function goPurchasePage(productNum) {
	$('#purchaseForm').submit();
	
}

function goCartView(productNum){
	var cart_UserID = document.getElementById("cart_UserID").value;
	location.href = "CartView.go?productNum=" + productNum + "&cart_UserID=" + cart_UserID;
}

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
	}







//   cartPage

function loadPrice(){
    var checkArr = new Array();
		var total = 0;
		$("#cart .full-price").each(function( i, e ) {
		     console.log($(this).text());
		     checkArr.push($(this).text());
		     total += Number(checkArr[i]);
		   });
		     $('#subPrice').text(total);
		     $('#totalPrice').text(total + 2500);



}


function CheckOutFunc() {
  if(document.getElementById("name") == null){
    alert("장바구니가 비어있습니다.")
    return false;

  }else{
	$('#CheckOutForm').submit();
}
}


var check = false;

function changeVal(el) {
  var qt = parseFloat(el.parent().children(".qt").html());
  var price = parseFloat(el.parent().children(".price").html());
  var eq = Math.round(price * qt * 100) / 100;
  
  el.parent().children(".full-price").html( eq );
  
  changeTotal();			
}

function changeTotal() {
  
  var price = 0;
  
  $(".full-price").each(function(index){
    price += parseFloat($(".full-price").eq(index).html());
  });
  
  price = Math.round(price * 100) / 100;
  var tax = 2500
  var fullPrice = Math.round((price + tax) *100) / 100;
  
  if(price == 0) {
    fullPrice = 0;
  }
  
  $(".subtotal span").html(price);
  $(".tax span").html(tax);
  $(".total span").html(fullPrice);
}
	








$(document).ready(function(){
	
    let thisCategory = '';
    $('input', $('.cart')).each(function(i, e){
        
    });
  
$(".remove").click(function(){
    
    let cartNum = $(this).parent().find('.cartNum').val() 
  alert(cartNum);
    
   $.ajax({
          url : "delete.cart",
          type : "GET",
          dataType : "text",
          data :	{"cartNum" : cartNum},
          success : function(getData) {
              console.log(getData);
              if (getData == 1) {
                  console.log("성공");
                  
                  
              }else {
                  console.log("실패");
              }
              
          }
          
      });
    
    
    var el = $(this);
      el.parent().parent().addClass("removed");
      window.setTimeout(
        function(){
          el.parent().parent().slideUp('fast', function() { 
            el.parent().parent().remove(); 
            if($(".product").length == 0) {
              if(check) {
                $("#cart").html("<h1>The shop does not function, yet!</h1><p>If you liked my shopping cart, please take a second and heart this Pen on <a href='https://codepen.io/ziga-miklic/pen/xhpob'>CodePen</a>. Thank you!</p>");
              } else {
                $("#cart").html("<h1>장바구니가 비어있어요!</h1>");
              }
            }
            changeTotal(); 
          });
        }, 200);
 
  
  
  
  
});

$(".qt-plus").click(function(){
  let plusval = parseInt($(this).parent().children(".qt").html()) + 1;
  $(this).parent().children(".qt").html(plusval);
  $(this).parent().find('input').val(plusval);
  

  $(this).parent().children(".full-price").addClass("added");
  
  var el = $(this);
  window.setTimeout(function(){el.parent().children(".full-price").removeClass("added"); changeVal(el);}, 150);
});

$(".qt-minus").click(function(){
  child = $(this).parent().children(".qt");
  
  childInput = child.parent().find("input");
  if(parseInt(child.html()) > 1) {
    child.html(parseInt(child.html()) - 1);
    childInput.val(parseInt(child.html()));
  }
  
  $(this).parent().children(".full-price").addClass("minused");
  
  var el = $(this);
  window.setTimeout(function(){el.parent().children(".full-price").removeClass("minused"); changeVal(el);}, 150);
});

window.setTimeout(function(){$(".is-open").removeClass("is-open")}, 1200);


});









// ready function
$(function() {
	shop_check_menu();
    setPrice();
    addressClick();
    loadPrice();
    
})