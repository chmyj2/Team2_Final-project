<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/t2_css/yj_purchaseLogin.css">
</head>
<body>

	

	<div class="login_didididiv">
	
	<ul class="menu__tabs">
			<li><a class="active" href="#item-1"><i class="fa fa-user"></i> 개인회원 구매</a></li>
			<li><a href="#item-2"><i class="fa fa-building"></i> 기업회원 구매</a></li>	
			<li><a href="#item-3">비회원 구매</a></li>	
		</ul>
		<section class="menu__wrapper">
			<article id="item-1" class="menu__item item-active">
				<h3>개인 로그인</h3>
				
<form action="t2LoginDO.purchase" method="post" name="loginForm">

		<div class="login_txt">
			<h2 class="login_h2">Welcome!</h2>
			<div class="login-social">
				<a href=""><i class="fa fa-kakao">kakao</i></a>
				<a href=""><i class="fa fa-naver">naver</i></a>
				<a href=""><i class="fa fa-google-plus"></i></a>
							</div>
			
			<label class="login_label"> <span>ID</span> 
			<input class="login_input" name="member_ID" />
			</label> <label class="login_label"> <span>Password</span> 
			<input class="login_input" name="member_PW" />
			</label>
			<span class="pw_alert">${r}</span>
			<input type="checkbox" id="login_idSave">아이디 기억하기
			<button class="forgot-pass" type="button"  style="font-size: 12px;" onclick="location.href='t2join' ">회원가입</button>
			<p class="forgot-pass"  style="font-size: 12px;">아이디를 잊으셨나요?</p>
			<p class="forgot-pass"  style="font-size: 12px;">비밀번호를 잊으셨나요?</p>
			<div class="box bg-1">
			<input type="submit" class="login-btn" value="L o g i n"/>
			<input type="hidden" value="${Product.productNum }" name="productNum"/>
			</div>
		</div>
</form>

			</article>
			
			<article id="item-2" class="menu__item">
				<h3>기업 로그인</h3>
	<form action="t2LoginDO.business.purchase" method="post" name="loginForm">

		<div class="login_txt">
			<h2 class="login_h2">Welcome!</h2>
			
			<label class="login_label"> <span>ID</span> 
			<input class="login_input" name="vet_ID" />
			</label> <label class="login_label"> <span>Password</span> 
			<input class="login_input" name="vet_PW" />
			</label>
			<span class="pw_alert">${rb}</span>
			<input type="checkbox" id="login_idSave">아이디 기억하기
			<p class="forgot-pass"  style="font-size: 12px;">회원가입</p>
			<p class="forgot-pass"  style="font-size: 12px;">아이디를 잊으셨나요?</p>
			<p class="forgot-pass"  style="font-size: 12px;">비밀번호를 잊으셨나요?</p>
			<div class="box bg-1">
			<input type="submit" class="login-btn" value="L o g i n"/>
			<input type="hidden" value="${Product.productNum }" name="productNum"/>
			</div>
		</div>
</form>
			</article>
			
			<article id="item-3" class="menu__item">
				<h3>비회원 구매</h3>
<form action="t2LoginDO.business" method="post" name="loginForm">

		<div class="login_txt">
			<div style="overflow:auto; width:100%; height:150px;">
					<h4>비회원정보수집 동의</h4><br>
                    <br>비회원 개인정보보호정책은 비회원으로 주문하는 고객님의 개인정보 보호를 위하여
                    <br>산책가자가 실시하는 개인정보 수집의 목적과 그 정보의 정책에 관한 규정입니다.
                    <br>
                    <br>제1조 개인정보 수집 범위
                    <br>1.물품 구매 시
                    <br>필수항목: 구매자 정보,수령자 정보
                    <br>2.환불 요청 시
                    <br>필수항목: 환불계좌
                    <br>
                    <br>제2조 개인정보 수집 목적 및 이용목적
                    <br>산책가자((주)산책가자)는 고객님께서 비회원으로 재화 혹은 용역을 주문하거나 각종 서비스를 이용하는데 있어, 원활한 주문 및 서비스 접수, 물품 배송, 대금 결제 및 편리하고
                    유익한 맞춤정보를 제공하기 위한 최소한의 정보를 수집합니다.
                    <br>
                    <br>1.e-mail, 전화번호 : 고지의 전달. 불만처리나 주문/배송정보 안내 등 원활한 의사소통 경로의 확보.
                    <br>2.성명, 주소 : 고지의 전달, 청구서, 정확한 상품 배송지의 확보.
                    <br>3.은행계좌번호, 신용카드번호: 유료정보에 대한 이용 및 상품구매에 대한 결제
                    <br>4.전화번호, 휴대전화번호 : 상품구매 전/후 만족도조사, 회원가입권유(포인트 또는 적립금 지급 등)및 영업 목적 전화 및 SMS발송
                    <br>
                    <br>비회원 주문 시 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않습니다.
                    <br>단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 종교, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 등)는 수집하지
                    않습니다.
                    <div style="font-size: 14px; font-weight: bold;">
                        <br>제3조 개인정보의 보유기간 및 이용기간
                        <br>고객의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무
                        관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.
                        <br>1.계약 또는 청약철회 등에 관한 기록 : 5년
                        <br>2.대금결제 및 재화등의 공급에 관한 기록 : 5년
                        <br>3.소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
                    </div>

                    <br>제4조
                    <br>동의 거부시 불이익 귀하는 개인정보 수집 및 이용 등에 관해 동의하지 않을 권리가 있습니다. 다만, 필수수집 동의를 하지 않을 경우 구매가 제한될 수 있습니다.</br>
                    <br>고객의 동의를 받아 보유하고 있는 거래정보 등을 고객께서 열람을 요구하는 경우 산책가자는 지체 없이 그 정보를 열람·확인 할 수 있도록 조치합니다.
			</div>
		<input type="checkbox" id="agree" name="agree" onchange="changeBtn()">
		안내 사항을 모두 확인하였으며, 이에 동의합니다.
	</label><br><br>
  		<button type="button" id="checkButton" name="checkButton" disabled="disabled"
  		 onclick="location.href='purchasePage.NonMembers?productNum=${Product.productNum }'">구매하기</button>
		</div>
</form>
			</article>


		</section>
		
	
</div>

</body>
<script type="text/javascript">
$(function() {

	// Menu Tabular
	var $menu_tabs = $('.menu__tabs li a'); 
	$menu_tabs.on('click', function(e) {
		e.preventDefault();
		$menu_tabs.removeClass('active');
		$(this).addClass('active');

		$('.menu__item').fadeOut(300);
		$(this.hash).delay(300).fadeIn();
	});
	

	

});

function changeBtn() {
	let btn = document.getElementById('checkButton');
	let disabled = btn.disabled;
	if(disabled){
	btn.disabled = false;
	}else{
	btn.disabled = true;		
	}	
}

</script>
</html>