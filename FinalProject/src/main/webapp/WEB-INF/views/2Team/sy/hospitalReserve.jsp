<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약을 원하시는 날짜를 선택해 주세요</title>
<script type="text/javascript" src="resources/t2_js/hospital_reserve_function.js"></script>
<script type="text/javascript" src="resources/t2_js/hospital_reserve_button_function.js"></script>
</head>
<body>
	<div class="reserve-main">
		<section class="abcdin">
			<div class="patient-info">
				<div class="human-info">
					<div class="reserve-div-title">
						<div class="reserve-div-title-text" >1.보호자정보</div>
						
					</div>
					<div class="reserve-box-sub">
					
							<li class="reservie-list4">	
								<span class="span-text">보호자자명</span>
								<span class="span-textin">김이박</span> <p>
							</li>
							<li class="reservie-list4">			
								<span class="span-text">생년월일</span>
								<span class="span-textin">2000.2.31</span><p>
							</li>
							<li class="reservie-list4">	
								<span class="span-text">연락처</span>
								<input class="span-text-input" value="010-0000-0000" disabled="disabled"><input id="reserve-phnBtn" onclick="btnCorrection()" type="image" value="수정" src="resources/t2_img/free-icon-edit-8036025 (1).png"/>
							</li class="reservie-list4">
							
					
					</div>

				</div>
				<div class="pet-info">
					<div class="reserve-div-title">
						<div class="reserve-div-title-text">2.반려동물정보</div>
						
					</div>
					<div class="reserve-box-sub">
							<li class="reservie-list4">	
								<span class="span-text">반려동물명</span>	
								<input class="span-text-petName-input" value="초코" disabled="disabled"><input id="reserve-petNameBtn" onclick="petNamebtnCorrection()" type="image" value="수정" src="resources/t2_img/free-icon-edit-8036025 (1).png"/>
							</li>	
							<li class="reservie-list4">
								<span class="span-text">나이</span>
								<input class="span-text-petAge-input" value="5" disabled="disabled"><input id="reserve-petAgeBtn" onclick="petAgebtnCorrection()" type="image" value="수정" src="resources/t2_img/free-icon-edit-8036025 (1).png"/>
							</li>
							<li class="reservie-list4">	
								<span class="span-text">종</span>
								<input class="span-text-petType-input" value="진돗개" disabled="disabled"><input id="reserve-petTypeBtn" onclick="petTypebtnCorrection()" type="image" value="수정" src="resources/t2_img/free-icon-edit-8036025 (1).png"/>
							</li>
					
					</div>

				</div>

			</div>
			<div class="calendar-selector">
				<div class="reserve-div-title2">
					
						<div class="reserve-div-title-text" >3.날짜시간선택</div>
					
				</div>
				<div class="reserve-box-sub2">
				
						<table class="scriptCalendar" >
    						<thead>
       							<tr>
             						<td onClick="prevCalendar();" style="cursor:pointer;">&#60;&#60;</td> 
            						<td colspan="5" >
               							 <span id="calYear">YYYY</span>년
                							<span id="calMonth">MM</span>월
           							</td>
           							<td onClick="nextCalendar();" style="cursor:pointer;">&#62;&#62;</td> 
        						</tr>
        						<tr>
           							<td style="color: #FF4D4D;">일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td style="color: #4D4DFF;">토</td>
       							</tr>
    						</thead>
  								<tbody></tbody>
						</table>
		<div>진료시간을 선택해주세요</div>
		<div class="reserve-time-list" style="text-align: center;" ></div>
				
				</div>
			</div>
			<div class="reserve-all-result">
				<div class="reserve-div-title2">
					<div class="reserve-div-title-text">4.예약정보확인</div>
					
				</div>
				<div class="reserve-box-sub3">
                        	<li class="reservie-list4">
								<span class="span-text">보호자명</span>
                                <span class="span-textin">김이박</span>
                            </li>
                        	<li class="reservie-list4">
								<span class="span-text">생년월일</span>
                                <span class="span-textin">2000.2.31</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">연락처</span>
                                <span id="reserve-phNmn" class="span-textin">010-0000-0000</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">동물이름</span>
                                <span id="reserve-pet-name" class="span-textin">초코</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">동물나이</span>
                            	<span id="reserve-pet-age" class="span-textin">5살</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">동물종 </span>
                            	<span id="reserve-pet-type" class="span-textin">진돗개</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">예약날짜 </span>
                            	<span id="reserve-date" class="span-textin">-</span>
                            </li>
                            <li class="reservie-list4">
								<span class="span-text">기타정보</span>
                            </li>
                            <li class="reservie-list4">
                                <textarea class="reserve-textarea" placeholder="증상 및 치료 이력등을 기입해주세요."></textarea>
                            </li>
				</div>
			</div>
		
		</section>
		
		<div class="reserve-confirm-div">
				  			<ul class="reserve-confirm-btn">
				  				<li>
									<a>예약확인</a>	  				
				  				</li>					  			
				  			</ul>
				  		</div>
		
		
	</div>
	
		
	
	
		
</body>
</html>