// 좋아요 ajax
function getBoardLike(board_num,member_ID) {
	$.ajax({
			url : "post.like",
			data : {
				"like_board_num" : board_num ,
				"like_member_id" : member_ID
			},
			success : function(data) {
				let result = data[0]
				let total = data[1]
				console.log(result,total);
				
				if (result == 0) {
					$('#like_btn').attr('class','btn btn-warning btn-sm center-block');
					
				} else{
					$('#like_btn').attr('class','btn btn-default btn-sm center-block');

				}
				
				$('#like_btn').html(total+' 좋아요');
				
			}
		
		});
	
}

// return total like
function likeCheck(board_num,member_ID) {
	
	if(member_ID == null){
		return;
	}
	
	
	$.ajax({
		url : "post.checkLike",
		data : {
			"like_board_num" : board_num ,
			"like_member_id" : member_ID
		},
		success : function(data) {
			console.log(data)
			if (data == 1) {
				$('#like_btn').attr('class','btn btn-warning btn-sm center-block');
			}
			
			
		}
	
	});
	
}

// 글쓰기 로그인 체크
function loginChek() {
	$('#writeBtn').click(function() {
		let id = $('#loginCheckId').val();
		
		if(id.length == 0){
			alert('로그인 후 사용가능합니다.')
			return false;
		}
		
		
	});
	

}

// 댓글 ajax
function createComment() {

    $('#commentBtn').click(function() {
		
    	let board_num = $('#boardNum').val();
    	let member_ID = $('#memberID').val();
    	let comment_txt = $('#commentTXT').val();
    	
    	$.ajax({//댓글 쓰기
    		type: "POST" ,
    		url : "comment.create",
    		data : {
    			"comment_board_num" : board_num ,
    			"comment_member_id" : member_ID ,
    			"comment_txt" : comment_txt
    		},
    		success : function(data) {
    			if(data == 1){
    				console.log("댓글 작성 성공")
    			}
    			
    			
    		}
    	
    	});//ajax
    	
    	
    	
	});
	
}

















$(function() {
	loginChek();
	createComment();
});





