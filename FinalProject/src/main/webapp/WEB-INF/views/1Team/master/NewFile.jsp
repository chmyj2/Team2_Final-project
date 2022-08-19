<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="main">
        <div class="tabs"> 
            <div class="tab" data-tab-target="#tab1">
                <p>tab1</p>
            </div>
            <div class="tab" data-tab-target="#tab2">
                <p>tab2</p>
            </div>
            <div class="tab" data-tab-target="#tab3">
                <p>tab3</p>
            </div>
        </div>
    </div>
    <div class="content">
        <div id="tab1" data-tab-content class="items active">
            <h2>Tab1에 들어갈 내용</h2>
        </div>
        <div id="tab2" data-tab-content class="items">
            <h2>Tab2에 들어갈 내용</h2>
        </div>
        <div id="tab3" data-tab-content class="items">
            <h2>Tab3에 들어갈 내용</h2>
        </div>

    </div>
    <script src="index.js"></script>
</body>
</html>