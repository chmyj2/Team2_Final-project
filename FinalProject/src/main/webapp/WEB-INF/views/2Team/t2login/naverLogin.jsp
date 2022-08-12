<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("BuwruEVQIqPoVW9Sc3Uo", "http://localhost/main/joingo");
  // 접근 토큰 값 출력
 // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    let email =naver_id_login.getProfileData('email');
    let member_ID =  email.split('@');
   	member_ID =member_ID[0];
    alert(member_ID);
    
    $.ajax({
		url:"naverlogin.check",
		type:"GET",
		dataType :"text",
		data:{"member_ID":member_ID},
		success: function(getData) {
			console.log(getData);
			if (getData >=1) {
				//회원정보가 있다는 의미
				window.close();
				window.opener.location.href="http://localhost/main/naverlogin.do?member_ID="+member_ID;
			}else {
				//회원정보가 없다는 의미
				alert('회원가입을 해주세요');
				window.close();
				window.opener.location.href="http://localhost/main/naverjoin.go?member_ID="+member_ID;
			}
			
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
		}
	}); // ajax끝
  }
</script>
</body>
</html>