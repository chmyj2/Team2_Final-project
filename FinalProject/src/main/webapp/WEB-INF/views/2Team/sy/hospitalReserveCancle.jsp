<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/t2_css/hospital_reserve_cancle.css' rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/t2_js/jQuery.js"></script>
<script type="text/javascript" src="resources/t2_js/hospital_reserve_cancle.js"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="reserve-cancle-div">
        <header class="reserve-cancle-header">
            <h3>パスワード確認</h3>
            <small>パスワードを入力するとキャンセルが完了します。</small>
        </header>
        <div class="reserve-cancle-input-div">
            <form>
                <fieldset class="password-input">
                    <span>パスワード</span>
                    <input class="reserve-cancle-password1" type="password">
                    <span>パスワード確認</span>
                    <input class="reserve-cancle-password2" type="password">

                </fieldset>
                <fieldset class="cancle-fieldset">
                    <input class="cancle-button" type="button" value="予約キャンセル">
                    <input class="cancle-id" type="hidden" value="${sessionScope.loginMember.member_ID}"/>
                    <input class="cancle-reserveno" type="hidden" value="${param.reserve_no }" />
                </fieldset>
            </form>
        </div>

    </div>
</body>
</html>