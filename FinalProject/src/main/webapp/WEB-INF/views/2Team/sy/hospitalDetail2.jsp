<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div style="height: 1300px;">
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
		  							<span class="detail-info-list-title">専門分野</span>
		  							<span class="detail-info-list-text">動物</span>
		  						</li>
		  						<li>
		  							<span class="detail-info-list-title">獣医師</span>
		  							<span class="detail-info-list-text">田中</span>
		  						</li>
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-info-list">
				  				<li>
									<span class="detail-info-list-title">アドレス</span>				  				
									<span class="detail-info-list-text">${9Hospital.hospital_addr}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">電話番号</span>				  				
									<span class="detail-info-list-text">${Hospital.hospital_tel}</span>				  				
				  				</li>					  			
				  				<li>
									<span class="detail-info-list-title">営業時間</span>				  				
									<span class="detail-info-list-text">９時まで</span>				  				
				  				</li>					  			
				  			</ul>
				  		</div>
				  		<div class="detail-info-place-3">
				  			<ul class="detail-reserve-ul">
				  				<li>
									<a onclick="reservego_logincheck('${sessionScope.loginMember.member_ID}','${Hospital.hospital_no }')">予約する</a>	  				
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
								<span class="title">口コミ</span>
								<span class="text">0個の口コミ<button type="button" class="Reviewbutton">+ 口コミを書く</button></span>
							</div>
							<div>
								<div class="detail-review-star">
									<div class="detail-review-star-total">"頂点" <em >0.0点</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
										</div>
									</div>
									<div class="detail-review-star-score">"親切" <em >0.0点</em> 
										<div class="detail-review-star-container">
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"説明" <em >0.0点</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"診療" <em >0.0点</em> 
										<div>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											<span>★</span>
											</div>
									</div>
									<div class="detail-review-star-score">"値段" <em >0.0点</em> 
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
								<span>口コミもっと見る+</span>
							</button>
						</div>
						</div>		
				
					</div>
				</section>
				
				</div>
				
								
			</div>	
			
			
		
			
</body>
</html>