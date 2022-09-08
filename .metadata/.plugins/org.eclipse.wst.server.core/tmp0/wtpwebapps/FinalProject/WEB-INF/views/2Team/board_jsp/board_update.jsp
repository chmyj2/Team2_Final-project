<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script type="text/javascript">var $j341 = jQuery.noConflict();</script>
</head>
<body>

<div class="container">
	<form action="post.update" method="POST">
	
		<div class="form-group">
			<label for="title">Title:</label>
			<input type="text" class="form-control" placeholder="title" id="title" name="board_title" value="${p.board_title}">
            <input name="board_category" value="${param.board_category}" type="hidden">
            <input name="board_num" value="${param.board_num}" type="hidden">
            <input id="board_img_input" name="board_img" value="${p.board_img}" type="hidden"> 
            
		</div>
	
		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="summernote" name="board_txt">${p.board_txt}</textarea>
		</div>
	
		<button type="submit" class="btn btn-primary">수정 완료</button>
	</form>
</div>


<script type="text/javascript">
var imgs = "";
var toolbar = [
    ['fontname', ['fontname']],
    ['fontsize', ['fontsize']],
    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    ['color', ['forecolor','color']],
    ['table', ['table']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']],
    ['insert',['picture','link']],
    ['view', ['codeview','help']]
  ];

var setting = {
    height : 600,
    minHeight : null,
    maxHeight : null,
    focus : true,
    lang : 'ko-KR',
    toolbar : toolbar,
    callbacks : { //여기 부분이 이미지를 첨부하는 부분
    onImageUpload : function(files, editor,
    welEditable) {
    for (var i = files.length - 1; i >= 0; i--) {
    uploadSummernoteImageFile(files[i],
    this);
    		}
    	}
    }
 };


$j341('#summernote').summernote(setting);

function uploadSummernoteImageFile(file, el) {
data = new FormData();
data.append("file", file);

imgs = $j341('#board_img_input').val();
if(imgs.length == 1){
	imgs = "";
}

console.log('이미지	:'+imgs);


$.ajax({
	data : data,
	type : "POST",
	url : "uploadSummernoteImageFile",
	contentType : false,
	enctype : 'multipart/form-data',
	async:false,
	processData : false,
	success : function(data) {
		$j341(el).summernote('editor.insertImage', data.url);
			
		imgs = imgs + data.url+"!";
		imgs = imgs.replace('resources/team2_files/', '')
		$j341('#board_img_input').attr('value', imgs);
		console.log(imgs);

	  
	} 
});
}


</script>


</body>
</html>