<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/community.css">
<title>Insert title here</title>
</head>
<body>
    <div class="board_title">

        <div class="board_wrapper">

            <div class="board_header">
                <h2>DengStiny</h2>
            </div>
            
            <div class="board_write">
                <input class="write_btn" type="button" value="Write" onclick="">
                <img class="board_pencil" src="resources/img/update.png">
            </div>

            <table summary="">
                <colgroup class="">
                    <col style="width:50px;">
                    <col style="width:auto;">
                    <col style="width:180px;">
                    <col style="width:100px;">
                    <col style="width:80px;">
                </colgroup>
                
                <thead class="board_list_header">
                    <tr>
                <th>No.</th>
                <th>Title</th>
                <th>User</th>
                <th>Date</th>
                <th>View</th>
            </tr>
        </thead>

        <!-- 게시판 글이 출력될 영역입니다 아래는 text 내용은 지우셔도 되요 by.용굥 -->
        <tbody>
            <tr>
                <!-- 글 no -->
                <td>1</td>
                <!-- 제목 -->
                <td><a href="">안녕하세요</a></td>
                <!-- 작성자 -->
                <td>이영경</td>
                <!-- 작성일 -->
                <td>2022-08-10</td>
                <!-- 조회수 -->
                <td>1</td>
            </tr>
            <tr>
                <td>2</td>
                <td>제목없음</td>
                <td>이영경</td>
                <td>2022-08-10</td>
                <td>1</td>
            </tr>
        </tbody>
    </table>

    <!-- 여기에 페이징 추가해주시면 되요 -->
</div>
</div>
</body>
</html>