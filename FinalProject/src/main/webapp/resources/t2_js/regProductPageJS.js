
// var oTbll;
// //Row 추가
// function insRow() {
// oTbll = document.getElementById("addTable");
// var oRoww = oTbll.insertRow();
// oRoww.onmouseover=function(){oTbll.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
// var oCell = oRoww.insertCell();

// //삽입될 Form Tag
// var frmTag = "<input type=text id='cocktail_tag'  name='cocktail_tag' >";
// frmTag += "<input type=button value='삭제' onClick='removeRow()' class='erase'>";
// oCell.innerHTML = frmTag;
// }
// //Row 삭제
// function removeRow() {
// oTbll.deleteRow(oTbll.clickedRowIndex);
// }






// function removeinput_value(){
// 	var el = document.getElementsByClassName('drink_reg_input');
// 	for(var i=0; i<el.length; i++){	
// 		el[i].value = '';}
	
// }

// function CheckSubmit() {
//     var inputVal = document.getElementById( 'searchProduct' ).value;
//     if (inputVal == "") {
//     	swal("검색어를 입력해주세요.", "Please Enter The CockTails").then(function() {
// 		})
// 	 	return false;
// 	}
//   }




//   function frmCheck(){
	
 	
// 	var frm = document.form;
   	
	
  
//    frm.submit();
  
   
 
 
 
//  }
   


var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input  id='cocktail_tag' type=text name='cocktail_tag'style='height: 30px;width: 400px;border-radius: 5px;' >";
  frmTag += "<input type=button value='삭제' onClick='removeRow()' class='erase' style='cursor:hand'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}














function frmCheck(){
	console.log(11)
 	
  var frm = document.form;
   
   return frm.submit();
  
 
 }
 
 
function removeinput_value(){
	var el = document.getElementsByClassName('drink_reg_input');
	for(var i=0; i<el.length; i++){	
		el[i].value = '';}
	
	
}



var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    } else {
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file);

                // 목록 추가
                let htmlData = '';
                htmlData += '<div id="file' + fileNo + '" class="filebox">';
                htmlData += '   <p class="name">' + file.name + '</p>';
                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
                htmlData += '</div>';
                $('.file-list').append(htmlData);
                fileNo++;
            } else {
                continue;
            }
        }
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        alert("확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        alert("첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteFile(num) {
    document.querySelector("#file" + num).remove();
    filesArr[num].is_delete = true;
}

/* 폼 전송 */
function submitForm() {
    // 폼데이터 담기
    var form = document.querySelector("form");
    var formData = new FormData(form);
    for (var i = 0; i < filesArr.length; i++) {
        // 삭제되지 않은 파일만 폼데이터에 담기
        if (!filesArr[i].is_delete) {
            formData.append("attach_file", filesArr[i]);
        }
    }

    $.ajax({
        method: 'POST',
        url: '/register',
        dataType: 'json',
        data: formData,
        async: true,
        timeout: 30000,
        cache: false,
        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
        success: function () {
            alert("파일업로드 성공");
        },
        error: function (xhr, desc, err) {
            alert('에러가 발생 하였습니다.');
            return;
        }
    })
}

   
   