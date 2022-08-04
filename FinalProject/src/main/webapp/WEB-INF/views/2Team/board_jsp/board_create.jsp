<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>

	<div class="container">
		<form action="team2.createPost" enctype="multipart/form-data" method="post">
			<div>
				<input name="board_title" placeholder="제목을 입력하세요">
				<input name="${param.board_category}" type="hidden">
			</div>
			
			<div>
				<textarea id="summernote" name="board_txt"></textarea>
			</div>
			
			<div>
				<a href='' class="btn btn-success">작성완료</a>
			</div>
			
		</form>

	</div>





</body>
<script type="text/javascript">
var toolbar = [
    // 글꼴 설정
    ['fontname', ['fontname']],
    // 글자 크기 설정
    ['fontsize', ['fontsize']],
    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    // 글자색
    ['color', ['forecolor','color']],
    // 표만들기
    ['table', ['table']],
    // 글머리 기호, 번호매기기, 문단정렬
    ['para', ['ul', 'ol', 'paragraph']],
    // 줄간격
    ['height', ['height']],
    // 그림첨부, 링크만들기, 동영상첨부
    ['insert',['picture','link','video']],
    // 코드보기, 확대해서보기, 도움말
    ['view', ['codeview','fullscreen', 'help']]
  ];

var setting = {
    height : 300,
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

$('#summernote').summernote(setting);
</script>

</html>