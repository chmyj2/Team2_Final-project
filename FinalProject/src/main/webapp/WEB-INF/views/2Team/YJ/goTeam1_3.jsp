<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function openTeam1() {
	
opener.parent.openTeam1();
window.close();

}
</script>
<link href='resources/t2_css/openTeam1.css' rel="stylesheet" type="text/css">
</head>
<body style="background-color: rgba(255, 217, 111, 0.7); ">

<div style="text-align: center;">
	<div>
		 <img class="logo_dengstiny" src="resources/img/dengstiny.png">
	</div>
	<div>
 <img class="main_page_img2" src="resources/img/mainP.jpg" style="height: 300px; width: 300px;">	<div>
		<h1>買わずに養子にしてください。</h1>
	</div>
	<div>
		<h2>この子が気になるなら</h2>
	</div>
	<div class="btnDiv">
	<a onclick="openTeam1()" class="cta">
  <span>会いに行く</span>
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
	</a>
<a onclick="window.close()" class="cta">
  <span>閉じる</span>
    <path d="M1,5 L11,5"></path>
    <polyline points="8 1 12 5 8 9"></polyline>
  </svg>
</a>
	</div>
</div>


</body>
</html>