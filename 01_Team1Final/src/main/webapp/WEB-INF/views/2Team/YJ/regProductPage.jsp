<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
<script type="text/javascript">





var oTbll;
//Row 추가
function insRow() {
oTbll = document.getElementById("addTable");
var oRoww = oTbll.insertRow();
oRoww.onmouseover=function(){oTbll.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
var oCell = oRoww.insertCell();

//삽입될 Form Tag
var frmTag = "<input type=text id='cocktail_tag'  name='cocktail_tag' >";
frmTag += "<input type=button value='삭제' onClick='removeRow()' class='erase'>";
oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
oTbll.deleteRow(oTbll.clickedRowIndex);
}






function removeinput_value(){
	var el = document.getElementsByClassName('drink_reg_input');
	for(var i=0; i<el.length; i++){	
		el[i].value = '';}
	
}

function CheckSubmit() {
    var inputVal = document.getElementById( 'searchProduct' ).value;
    if (inputVal == "") {
    	swal("검색어를 입력해주세요.", "Please Enter The CockTails").then(function() {
		})
	 	return false;
	}
  }


</script>

</head>
<body>
<div class="">
		<form action="Search_drinkController" id="searchProduct" onsubmit="return CheckSubmit()" method="post">  
			<div>
				<input  class="" id="" name="" placeholder="SEARCH">
				<input id="" type="submit" value="검색">
			</div>
		</form>
	</div>

<h1>등록페이지</h1>


<form name="regProductForm" action="" method="post"
		enctype="multipart/form-data">

		<table>
			<tr>
				<td>카테고리</td>
				<td><select name="pets" id="pet-select">
    				<option value="">동물 분류</option>
    				<option value="dog">Dog</option>
    				<option value="cat">Cat</option>
    				<option value="etc">etc</option>
					</select></td>
			</tr>
			<tr>
				<td>상품 분류</td>
				<td><select name="pets" id="pet-select">
    				<option value="">상품 분류</option>
    				<option value="snack">Snack</option>
    				<option value="toy">toy</option>
					</select></td>
			</tr>
			<tr>
				<td>제품 이름</td>
				<td><input  id="" class="" name=""></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="number" id="" min="0"step="100" class="" name=""></td>
			</tr>
			<tr>
				<td>제품 정보</td>
				<td><textarea id=""name=""></textarea></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="number" id="" min="0" class="" name=""></td>
			</tr>
			<tr>
				<td>진열 여부</td>
				<td>공개  <input type = "radio" name = "onExhibition" value= "Y">
					비공개 <input type = "radio" name = "onExhibition" value= "N"></td>
			</tr>
			<tr>
				<td>대표 사진</td>
				<td><input type="file" name="" id=""></td>
			</tr>
			<tr>
				<td>상세 이미지</td>
				<td><input type="file" name="" id=""></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<table id="addTable">
						<tr>
							<td>태그</td>
						</tr>
						<tr>
							<td><input id="" class="" name="">
								<input class="erase" type=button value='삭제' onClick='removeinput_value()'>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
		</table>
	</form>
	
	
	

	<table>
		<tr>
			<td>
				<input class="" name="" type="button"onClick="insRow()" value="태그 추가">
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<td><input class="" type="button" name="" value="등록"
				onClick="frmCheck();" >
			</td>
		</tr>
	</table>



</body>
</html>