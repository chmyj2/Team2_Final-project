var oTbl;
//Row 추가
function insRow() {
  oTbl = document.getElementById("addTable");
  var oRow = oTbl.insertRow();
  oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
  var oCell = oRow.insertCell();

  //삽입될 Form Tag
  var frmTag = "<input id='productTag' class='regInput' type=text name='productTag' style='margin-left:40px;margin-right:4px;padding-top:2px;' >";
  frmTag += "<input class='DeleteBtn' type=button value='削除' onClick='removeRow()'>";
  oCell.innerHTML = frmTag;
}
//Row 삭제
function removeRow() {
  oTbl.deleteRow(oTbl.clickedRowIndex);
}





function frmCheck(){

    var pet_category = document.getElementById("pet_category").value;
    var toy_category = document.getElementById("toy_category").value;
    var productName = document.getElementById("productName").value;
    var productPrice = document.getElementById("productPrice").value;
    var productInfo = document.getElementById("productInfo").value;
    var productStock = document.getElementById("productStock").value;
    var productThumbnail = document.getElementById("productThumbnail").value;
    var productImg = document.getElementById("productImg").value;
    var productTag = document.getElementsByName("productTag");


    if (pet_category == 1) {
        alert("カテゴリを入力してください。")
        return false;
    } else if(toy_category == 1){
        alert("商品分類を入力してください。")
        return false;
    } else if(productName == ""){
        alert("商品名を入力してください。")
        return false;
    } else if(productPrice == ""){
        alert("価格を入力してください。")
        return false;
    } else if(productInfo == ""){
        alert("商品情報を入力してください。")
        return false;
    } else if(productStock == ""){
        alert("在庫を入力してください。")
        return false;
    } else if(productThumbnail == ""){
        alert("代表イメージを入力してください。")
        return false;
    } else if(productImg == ""){
        alert("ディテールイメージを入力してください。")
        return false;
    }  else {
        for (let index = 0; index < productTag.length; index++) {
            const element = productTag[index];
            
            if (element.value == "") {
                alert('タグを入力してください.');
                return false;
            }
        }
    }


    var frm = document.form;
    return frm.submit();
    
   
    
    

   
 }
 
 
function removeinput_value(){
	var el = document.getElementsByClassName('regInput');
	for(var i=0; i<el.length; i++){	
		el[i].value = '';}
}



function productDelete(num,thumbnail,img){

    var con_test = confirm("本当に削除しますか");
    if(con_test == true){
    location.href="product.delete?num=" + num +"&thumbnail=" + thumbnail + "&img=" + img;
    }
    else if(con_test == false){
    return false;
    }
    
   

}

   $(function() {
	var loginBox = document.querySelector('.outBox');
	var loginInputBox = document.querySelector('#sampleId');
	loginInputBox.addEventListener('keyup', function(){
	    if(!loginInputBox.value == ''){
	        loginBox.classList.add('existence');   
	    }else{
	        loginBox.classList.remove('existence');   
	    }
	});
});

   