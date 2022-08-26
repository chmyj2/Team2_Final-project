<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616ab49f45cfb91e31f4cd32e312c1aa&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/t2_js/hospital_detail_function.js"></script>
</head>
<body>
	
			<div>
				<div class="detail-top-menu">
					<input type="hidden" id="detail_addr" value="${Hospital.hospital_addr}"/>
				  <h3 class="top-h3-name">${Hospital.hospital_name }</h3>
				</div>
				
				<div>
					<h3 id="detail_map"></h3>
				</div>
				
				<div class="detail-info">
				 <section class="detail-info-section">
				  	<div class="detail-info-inner">
				  		<div class="detail-info-place-3">
				  			<ul class="detail-info-list">
		  						<li>
		  							<span class="detail-info-list-title">전문분야</span>
		  							<span class="detail-info-list-text">항암치료</span>
		  						</li>
		  						<li>
		  							<span class="detail-info-list-title">주치의</span>
		  							<span class="detail-info-list-text">아무개</span>
		  						</li>
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-info-list">
				  				<li>
									<span class="detail-info-list-title">주소</span>				  				
									<span class="detail-info-list-text">${Hospital.hospital_addr}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">전화번호</span>				  				
									<span class="detail-info-list-text">${Hospital.hospital_tel}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">영업시간</span>				  				
									<span class="detail-info-list-text">9시까지</span>				  				
				  				</li>					  			
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-reserve-ul">
				  				<li>
									<a onclick="reservego_logincheck('${sessionScope.loginMember.member_ID}','${Hospital.hospital_no }')">예약하기</a>	  				
				  				</li>					  			
				  			</ul>
				  		</div>
				  	</div>
				 </section>
				</div>

				<div class="detail-review-container">
				<section class="detail-review">  
					<div>
						<div class="detail-review-total">
							<div class="up">
								<span class="title">후기</span>
								<span class="text">0개의 후기<button type="button" class="Reviewbutton">+ 후기 작성하기</button></span>
							</div>
							<div>
								<div class="detail-review-star">
									<div class="detail-review-star-total">"총점" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
										</div>
									</div>
									<div class="detail-review-star-score">"친절" <em >0.0점</em> 
										<div class="detail-review-star-container">
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"설명" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"진료" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"가격" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div></div>
								</div>
							
							</div>
						</div>		
						<div>
						
						<ul></ul>
						<div class="detail-bot-review-button">
							<button class="detail-bot-review-button-div">
								<span>후기더보기+</span>
							</button>
						</div>
						</div>		
				
					</div>
				</section>
				
				</div>
				
								
			</div>	
			
			
		
			
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616ab49f45cfb91e31f4cd32e312c1aa&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/t2_js/hospital_detail_function.js"></script>
</head>
<body>
	
			<div>
				<div class="detail-top-menu">
					<input type="hidden" id="detail_addr" value="${Hospital.hospital_addr}"/>
				  <h3 class="top-h3-name">${Hospital.hospital_name }</h3>
				</div>
				
				<div>
					<h3 id="detail_map"></h3>
				</div>
				
				<div class="detail-info">
				 <section class="detail-info-section">
				  	<div class="detail-info-inner">
				  		<div class="detail-info-place-3">
				  			<ul class="detail-info-list">
		  						<li>
		  							<span class="detail-info-list-title">전문분야</span>
		  							<span class="detail-info-list-text">항암치료</span>
		  						</li>
		  						<li>
		  							<span class="detail-info-list-title">주치의</span>
		  							<span class="detail-info-list-text">아무개</span>
		  						</li>
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-info-list">
				  				<li>
									<span class="detail-info-list-title">주소</span>				  				
									<span class="detail-info-list-text">${Hospital.hospital_addr}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">전화번호</span>				  				
									<span class="detail-info-list-text">${Hospital.hospital_tel}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">영업시간</span>				  				
									<span class="detail-info-list-text">9시까지</span>				  				
				  				</li>					  			
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-reserve-ul">
				  				<li>
									<a onclick="reservego_logincheck('${sessionScope.loginMember.member_ID}','${Hospital.hospital_no }')">예약하기</a>	  				
				  				</li>					  			
				  			</ul>
				  		</div>
				  	</div>
				 </section>
				</div>

				<div class="detail-review-container">
				<section class="detail-review">  
					<div>
						<div class="detail-review-total">
							<div class="up">
								<span class="title">후기</span>
								<span class="text">0개의 후기<button type="button" class="Reviewbutton">+ 후기 작성하기</button></span>
							</div>
							<div>
								<div class="detail-review-star">
									<div class="detail-review-star-total">"총점" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
										</div>
									</div>
									<div class="detail-review-star-score">"친절" <em >0.0점</em> 
										<div class="detail-review-star-container">
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"설명" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"진료" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"가격" <em >0.0점</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div></div>
								</div>
							
							</div>
						</div>		
						<div>
						
						<ul></ul>
						<div class="detail-bot-review-button">
							<button class="detail-bot-review-button-div">
								<span>후기더보기+</span>
							</button>
						</div>
						</div>		
				
					</div>
				</section>
				
				</div>
				
								
			</div>	
			
			
		
			
</body>
>>>>>>> Dev
</html>