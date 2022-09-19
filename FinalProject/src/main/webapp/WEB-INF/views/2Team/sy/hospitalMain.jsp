<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 넣으시면 됩니다."></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=616ab49f45cfb91e31f4cd32e312c1aa&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resources/t2_js/hospital_function2.js"></script>
<script type="text/javascript" src="resources/t2_js/hospital_list_pasing.js"></script>
<script type="text/javascript" src="resources/t2_js/hospitalpaging.js"></script>
 
<style type="text/css">
.table {
	margin-left: auto;
	margin-right: auto;
	width:60%;
	margin-top: 50px;
	text-align: center;
}

.table>thead:first-child>tr:first-child>th{
text-align: center;
}
</style>
</head>

<body>
 				<div id="my_modal">
 					<div class="mymodal_head">
 						<h1 class="mymodal_title">アドレス選択</h1>
            		<a class="modal_close_btn">X</a>
 				</div>
 				<div class="mymodal_body">
 					<div class="mymodal_address"> 
 					<select id="mymodal_adrselect">
 						<option value="" selected disabled hidden>市·郡·区</option>
 						<option value="gn">カンナムグ</option>
 						<option value="gd">カンドング</option>
 						<option value="gb">カンブッグ</option>
 						<option value="gs">カンソグ</option>
 						<option value="ga">クァナッグ</option>
 						<option value="gj">クァジング</option>
 						<option value="gr">クログ</option>
 						<option value="gc">クムチョング</option>
 						<option value="nw">ノウォング</option>
 						<option value="db">ドボング</option>
 						<option value="ddm">ドンデムング</option>
 						<option value="dj">ドンジャック</option>
 						<option value="mp">マポグ</option>
 						<option value="sdm">ソテムング</option>
 						<option value="sc">ソチョグ</option>
 						<option value="sd">ソンドング</option>
 						<option value="sb">ソンブック</option>
 						<option value="sp">ソンパグ</option>
 						<option value="yc">ヤンチョング</option>
 						<option value="ydp">ヨンドゥンポグ</option>
 						<option value="ys">ヨンサング</option>
 						<option value="ep">ウンピョング</option>
 						<option value="jr">チョンノグ</option>
 						<option value="jg">チュング</option>
 						<option value="jrg">チュンナング</option>
 					</select>
 					</div>
 				</div>
 				<div class="mymodal_foot">
 					<div class="mymodal_btn">
 						<button class="mymodal_btnclick">
 							<span>選ぶ</span>
 						</button>
 					</div>
 				</div>
 
        </div>
		<div class="hospital_map_addr" >
        <button class="hospital_map_addr_btn" id="popup_open_btn">アドレス探し</button>
		</div>
    <div id="map"></div>
<!--     <p><em>지도 중심좌표가 변경되면 지도 정보가 표출됩니다</em></p>
<p id="result"></p> -->

<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>病院名</th>
        <th>区</th>
        <th>電話番号</th>
        <th>しさいに</th>
      </tr>
    </thead>
    <tbody class="hospital_list">
      
    </tbody>
  </table>
</div>
<div class="pagination-div">
  <ul class="pagination"></ul>
</div>	
</body>
<script type="text/javascript">
function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });
    // 선택하기 눌렀을 시, 자동으로 닫기 처리 
    modal.querySelector('.mymodal_btnclick').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById('popup_open_btn').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});
</script>
</html>