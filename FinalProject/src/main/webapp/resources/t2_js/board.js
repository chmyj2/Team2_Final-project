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

//페이지 누를 시 댓글 10개 가져오기
function getComments() {
	
	$('.commentPage').click(function() {
		
		let page = $(this).html();
		let board_num = $('#boardNum').val();
		let start = page * 10 - 9;
		let end = page * 10;
		let btn ="<div class=\"col-sm-1\"> <a href=\"#\" class=\"float-right btn-box-tool replyDelBtn\"> <i class=\"fa fa-times\"> 삭제</i> </a> <a href=\"#\" class=\"float-right btn-box-tool replyModBtn\"> <i class=\"fa fa-edit\"> 수정</i> </a> </div>";
		
		$.ajax({//댓글 쓰기
    		type: "GET" ,
    		dataType : 'json',
    		url : "comment.get",
    		data : {
    			"comment_board_num" : board_num ,
    			"start" : start ,
    			"end" : end
    		},
    		success : function(data) {
    			console.log(data);
    			$('#commentContainer').empty();
    			$.each(data.comments, function(i, c) {
    				let comment_member_id = c.comment_member_id;
    				let comment_txt = c.comment_txt
    				let comment_date = c.comment_date;
    				let div = "<div class=\"row\" id=\"commentContainer\"> <div class=\"col-sm-8\" style=\"border: solid 1px;\"><div>user : "+comment_member_id+"&nbsp&nbsp"+comment_date+"</div><div>"+comment_txt+"</div></div>"+btn
    				$('#commentContainer').append(div);
    				
    			});
    			
    			
    		}
    	
    	});//ajax
		
		
	});
	
	
}


// 댓글삭제
function deleteComment() {
	let result = 0;
	
	$('.deleteAtag').click(function() {
		let num = $(this).attr('id')
		
		$.ajax({//댓글 쓰기
		type: "GET" ,
		url : "comment.delete",
		data : {
			"comment_num" : num ,
		},
		success : function(data) {
			if(data == 1){
				console.log("댓글 삭제 성공")
				result = data
				
			}
			
			
		}
	
	});//ajax
		
			$(this).parent().parent().empty();
		
	});
	
}












$(function() {
	loginChek();
	createComment();
	getComments();
	deleteComment();
});





