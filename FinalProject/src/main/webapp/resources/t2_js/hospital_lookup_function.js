function reservecancleGo(a) {
	
	if (confirm("本当にキャンセルしますか") == true){    //확인
		
		window.open("http://localhost:8080/main/reserveCanclego?reserve_no="+a, "비밀번호확인", "top=200px, left=600px, height=540px, width=680px");
		
	   
	    
	    
	 }else{                                         //취소
		 
	     return false;
	     
	 }
}

