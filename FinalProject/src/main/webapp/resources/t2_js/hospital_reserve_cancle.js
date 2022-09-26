$(function() {
	
	$('.cancle-button').click(function (){
		
		var userid = $('.cancle-id').val();
		var userreserveNo = $('.cancle-reserveno').val();
		
		$.ajax({

			url : "reservePw.check",

			type : "GET",

			dataType : "text",

			data : {

				"member_ID" : userid

			},

			success : function(result) {
				
				 let p1 = $('.reserve-cancle-password1').val();
			     let p2 = $('.reserve-cancle-password2').val();
			     
			     
			     if(p1.length < 4) {
			         alert('入力した文字が4文字以上である必要があります。');
			         return false;
			     }
			     
			     if( p1 != p2 ) {
			       alert("パスワードの確認が一致しません。");
			       return false;
			     } else{
			       alert("パスワードの確認が一致します。");
			       		if (result != p2) {
					
			       			alert('パスワードが間違っています。');
					
			       		} else {
			       			location.href="hospitalReserveCancleDo?reserve_memberID="+userid+"&reserve_no="+userreserveNo;
			       			alert('予約がキャンセルされました。')
							opener.parent.location.reload();
			       			window.close();
			       		}
			     }

			
			},

			error : function(error) {
				alert("ERROR");
			},
			
		});
		

	})
	
})
