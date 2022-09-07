$(function() {

	reversephnNmb();
	reverseBirth();
	onlykorean();

});


function reversephnNmb() {
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}


	var phoneNum = document.getElementById('reserve-phnInput');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}
}

function reverseBirth() {
	let autoHypenBirth = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 5){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 4);
	          tmp += '-';
	          tmp += str.substr(4);
	          return tmp;
	      }else if(str.length < 9){
	          tmp += str.substr(0, 4);
	          tmp += '-';
	          tmp += str.substr(4, 2);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }
	      
	      return str;
	}


	let petBirth = document.getElementById('reverse-petBirthinput');

	petBirth.onkeyup = function(){
	  //console.log(this.value);
	  this.value = autoHypenBirth( this.value ) ;  
	}
	
}

function onlykorean() {
	
	 //input에 한글 이외에 글자들 입력시 검열 
	
	 $("#reverse-petName").keyup(function (event) {
		 // 한글 이외에 문자들 
         notKorean = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
         v = $(this).val();
         
         // test()는 주어진 문자열이 정규 표현식을 만족하는지 판별하고, 그 여부를 true 또는 false로 반환
         if (notKorean.test(v)) {
             alert("한글만 입력가능 합니다.");
             $(this).val(v.replace(notKorean, ''));
         }
     });
	 
	 
	 $("#reverse-petType").keyup(function (event) {
		 // 한글 이외에 문자들 
		 notKorean = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		 v = $(this).val();
		 
		 // test()는 주어진 문자열이 정규 표현식을 만족하는지 판별하고, 그 여부를 true 또는 false로 반환
		 if (notKorean.test(v)) {
			 alert("한글만 입력가능 합니다.");
			 $(this).val(v.replace(notKorean, ''));
		 }
	 });

	
}