<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="memberDeleteAgree-outline">
<h1>회원 탈퇴 동의서</h1>
<h4>-비즈니스-</h4><br>
</div>
<span class="memberDeleteAgree-text">회원님 '산책가자' 서비스를 이용하시는 데, 불편함이 있으셨나요?</span><br>
<span class="memberDeleteAgree-text">이용 불편 및 각종 문의 사항은 아래 적힌 고객센터로 문의 주시면 성심 성의껏 답변드리겠습니다.</span><br>
<span class="memberDeleteAgree-text">전화문의:010-1234-1234 /이메일 문의 go_outFor_a_walk@naver.com</span><br><br>

<div class="memberDeleteAgree-outline2">
<textarea rows="15" cols="120">
회원 탈퇴전, 유의사항을 확인해 주시기 바랍니다.
-회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.
-거래정보가 있는 경우, 전자상 거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존이 됩니다.
-유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 탈퇴시 삭제됩니다.
-재가입(회원탈퇴 후 신규가입)하시면 신규회원 대상 이벤트(할인쿠폰 증정,경품증정 등)에 응모되지 않습니다.
-회원 탈퇴 후 '산책가자'서비스에 입력하신 상품문의 및 후기, 게시글,댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원칙적으로 불가능합니다.
-상품문의 및 후기,게시글, 댓글 등 삭제를 원하시는 경우, 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기를 바랍니다.
-이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.
-회원 탈퇴 후 환불 교환 문의는 고객센터로 문의해주셔야합니다.
-회원 탈퇴 후 회원정보는 2개월동안 보관 후 삭제됩니다.
-탈퇴 후 동일한 계정으로 2개월 내 재가입 불가합니다. 2개월 이후 재가입을 하셔도 전에 작성하신 상품문의 및 후기,게시글,댓글 등은 연동되지 않습니다.







 저희는 회원님이 다시 돌아오실 그 날까지 더욱 좋은 서비스를 제공할 수 있도록 최선을 다하겠습니다.
 언제나 저희 '산책가자'서비스를 사용해주셔서 감사합니다
</textarea>
<br><br>
<label for="agree">
<input type="checkbox" id="agree" onchange="deleteAgree2()">위의 내용을 읽었으며, 내용에 동의합니다.
</label><br>
<form action="businessDelte.DO">

<button id="member_Deletebtn" disabled="disabled">탈 퇴 하 기</button>
</form>

</div>
</body>
<script type="text/javascript">
function deleteAgree2() {
	let btn = document.getElementById('member_Deletebtn');
	let a= btn.disabled;
	
	if (a) {
		btn.disabled = false;
	}else {
		btn.disabled = true;
	}
	
}
</script>
</html>