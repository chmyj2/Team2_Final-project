<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/t2_js/hospital_lookup_function.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="reserve-lookup-div">
        <div class="reserve-lookup-menutab-div">
         <section class="reserve-lookup-section">
              <div class="reserve-div-inner">
                  <div class="reserve-lookup-info-place-1">
                      <ul class="reserve-lookup-info-list1">
                              <span class="reserve-lookup-info-list-title">予約番号</span>
                          </ul>
                  </div>
                  <div class="reserve-lookup-info-place-2">
                      <ul class="reserve-lookup-info-list2">
                            <span class="reserve-lookup-info-list-title">予約情報</span>				  				
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-5">
                      <ul class="reserve-lookup-info-list5">
                            <span class="reserve-lookup-info-list-title">お問い合わせ</span>				  				
                      </ul>
                  </div>
                  <div class="reserve-lookup-info-place-6">
                      <ul class="reserve-lookup-info-list6">
            
                            <span class="reserve-lookup-info-list-title">キャンセル</span>				  				
                         		  				
                        					  			
                         			  			
                      </ul>
                  </div>
               </div>
     
         </section>
         
         <c:forEach items="${reserveView }" var="r">
        	<div class="goods_group">
				<ul class="goods_group_list">

		<li id="_rowLi20210708001251CHK2021070820975530" class="goods_pay_item ">
			<div class="goods_item">
				<span class="goods_thumb">${r.reserve_no}</span>
				<div class="goods_info">
					<!-- NV_MID: -->
					<a href="hospitalDetailGo?hospital_no=${r.reserve_hospitalNo }" class="goods">
						<p class="name">
							${r.reserve_hospitalName }
						</p>
						<ul class="info12">
						<c:if test="${r.reserve_state eq'취소'}">
						<li class="cancle"><span class="blind">예약일시</span> ${r.reserve_date }</li>
						</c:if>
						<c:if test="${r.reserve_state eq'확정'}">
						<li class="date"><span class="blind">予約日時</span> ${r.reserve_date }</li>
						</c:if>
							<li class="subscription"><span class="blind">予約申込日</span> <fmt:formatDate  value="${r.reserve_writing_date }"/> </li>
						</ul>
					</a>
						<c:if test="${r.reserve_state eq'취소'}">
						<span class="state_statusNameCancle">予約キャンセル</span>
						</c:if>
						<c:if test="${r.reserve_state eq'확정'}">
						<span class="state statusNameConfirmation ">予約確定</span>
						</c:if>
					<p class="guide">
						<c:if test="${r.reserve_state eq'취소'}">
								<span>予約が キャンセルされました。</span> ご利用いただきありがとうございます。<br>予約確定後 <strong>病院に関するお問い合わせは、お問い合わせボタンでお問い合わせください。</strong>
						</c:if>
						<c:if test="${r.reserve_state eq'확정'}">
								<span>予約が 確定されました。</span> ご利用いただきありがとうございます。<br>予約確定後 <strong>病院に関するお問い合わせは、お問い合わせボタンでお問い合わせください。</strong>
						</c:if>
					</p>
				</div>
			</div>
			<div class="seller_item">
				<div class="inner">
						<a href="#" class="state_button qna _click(nmp.front.order.timeline.home.list.shoppingInquiry(/merchant/shoppingInquiry/2021070820975530)) _stopDefault">お問い合わせ</a>
				</div>
			</div>
				<div class="button_item">
                                <div class="area_layer">
                                	<c:if test="${r.reserve_state eq'확정'}">
                                    <a href="#" onclick="reservecancleGo('${r.reserve_no}');" class="state_button function _click(nmp.front.order.timeline.home.list.rebuyLayerShow(2021070820975530)) _stopDefault">予約キャンセル</a>
                                    </c:if>
                                </div>
				</div>
		</li>
				</ul>
			</div>
			
			</c:forEach>
        
        </div>
        
        
     
		
	</div>

</body>
</html>