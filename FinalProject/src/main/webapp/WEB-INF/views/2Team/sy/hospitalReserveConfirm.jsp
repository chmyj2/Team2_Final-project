<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/t2_css/hospital_success.css' rel="stylesheet" type="text/css">
 <script type="text/javascript">
  var MOVE = function(param){
    var self=this;
    this.object = document.getElementById(param.id);
    this.time = param.time||5;      //페이지 이동 시간을 정해 준다. 여기선 10초
    this.url = param.url||'';
    this.timer = null;
    this.run = function(){
     timeString.innerHTML = this.time + '秒後に自動的に移動します。';
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
	<div class="receipt">
	<div>
		<div class="text">ご利用いただき<br>ありがとございました。</div>
	</div>
	<div id="dog_Class">
<div class="dog">
  <div class="dog-body">
    <div class="dog-tail">
      <div class="dog-tail">
        <div class="dog-tail">
          <div class="dog-tail">
            <div class="dog-tail">
              <div class="dog-tail">
                <div class="dog-tail">
                  <div class="dog-tail"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="dog-torso"></div>
  <div class="dog-head">
    <div class="dog-ears">
      <div class="dog-ear"></div>
      <div class="dog-ear"></div>
    </div>
    <div class="dog-eyes">
      <div class="dog-eye"></div>
      <div class="dog-eye"></div>
    </div>
    <div class="dog-muzzle">
      <div class="dog-tongue"></div>
    </div>
  </div>
</div>

<div class="ball" tabindex="0"></div>
</div>
<div class="timeString-div">
<span id="timeString" class="timeString-text"></span> 
</div>
</div>
</body>
</html>