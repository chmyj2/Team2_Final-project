<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">
 var MOVE = function(param){
    var self=this;
    this.object = document.getElementById(param.id);
    this.time = param.time||10;      //페이지 이동 시간을 정해 준다. 여기선 1분
    this.url = param.url||'';
    this.timer = null;
    this.run = function(){
     timeString.innerHTML = this.time + '초 후 자동으로 이동 합니다.';
     this.time--;
     if(this.time < 0){
     if(this.url!=''){
     location.href = this.url;
     window.clearTimeout(this.timer);
     }
     }else{
     this.timer = window.setTimeout(
     function(){self.run();}
     ,1000
     )
     }
  };
  this.run();
  }
  window.onload = function(){
  new MOVE({id:'prt',url:'hospitalGo'}); //이동할 URL
  }
  </script>
</head>
<body>
<span id="timeString"></span> 
</body>
</html>