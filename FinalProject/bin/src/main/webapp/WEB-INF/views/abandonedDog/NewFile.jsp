<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
    $(function() {
        $.ajax({
        	url: "https://yts.mx/api/v2/list_movies.json?sort_by=download_count",
            type: "GET", 
            success: function(data) {
                $('#content').html(JSON.stringify(data));
            }
        })
    })
    </script>
</head>
<body>

 <p id="content"></p>


</body>
</html>