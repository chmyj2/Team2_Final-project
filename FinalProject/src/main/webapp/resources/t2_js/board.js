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


// 댓글작성 
function createComment() {

	
	
	$('#commentBtn').click(function() { 
    	
		let txt = $('#commentTXT').val();
			if(txt.length == 0){
				alert('내용을 입력해주세요')
				return false;
			}
		
		let loginid = $('#memberID').val();
			if(loginid.length == 0){
				alert('로그인 후 댓글을 작성해 주세요')
				return false;
			}
		
		
		let num = $('#boardNum').val();
    	let id = $('#memberID').val();
  
    	
    	$.ajax({//댓글 쓰기
    		type: "POST" ,
    		url : "comment.create",
    		data : {
    			"comment_board_num" : num ,
    			"comment_member_id" : id ,
    			"comment_txt" : txt
    		},
    		success : function(data) {
    			if(data == 1){
    				console.log("댓글 작성 성공")
    			}
    			
    			
    		},
    		error : function () {
				return false;
			}
    	
    	});//ajax
    	
		let now = new Date();
		let month = now.getMonth() + 1;  
		let day = now.getDate();  
		let hour = now.getHours();
		let minute = now.getMinutes();
		
		let date = month +"-"+ day +"  "+ hour +":"+ minute
		
		let inputData = `<div class="commentDiv"><div class="col-sm-8 commentBorder"><div>user : <strong class="cStrong">${id}</strong> <em class="cEm">${date}</em></div><div><span class="commentSpan">${txt}</span> <input class="form-control input-sm toggleInput" type="text"><button class="btn btn-success btn-sm togglebtn">완료</button></div></div><div class="col-sm-1"><a id="${num}" class="deleteAtag"><i class="fa fa-times">삭제</i></a> <a id="${num}" class="updateAtag"><i class="fa fa-edit">수정</i></a></div></div>`
		
		/*let buttons = `<a id="${num}" class="deleteAtag"><i class="fa fa-times">삭제</i></a> <a id="${num}" class="updateAtag"><i class="fa fa-edit">수정</i></a>`
		let buttonDiv = `<div class="col-sm-1"></div>`
			if(loginid != id){
				buttons = buttonDiv;
			}*/
		$('#commentContainer').prepend(inputData);
		

    	
    	
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
		
		$.ajax({//댓글 얻기
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
		
		$.ajax({//댓글 삭제
		type: "GET" ,
		url : "comment.delete",
		data : {
			"comment_num" : num 
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


// 댓글 수정 
function commentUpdate() {
	
	 let num = 0;
	 let txt = '';
	
	$('.updateAtag').click(function() {
		$(this).parent().parent().find('input').fadeToggle('100') 
		$(this).parent().parent().find('span').toggle() 
		$(this).parent().parent().find('button').fadeToggle('100') 
		
		 num = $(this).attr('id')
		
	});
	
	$('.togglebtn').click(function() {
		
		txt = $(this).parent().find('input').val();
		
		$.ajax({//댓글 삭제
			type: "POST" ,
			url : "comment.update",
			data : {
				"comment_num" : num ,
				"comment_txt" : txt 
			},
			success : function(data) {
				if(data == 1){
					console.log("수정 성공")
					
					
				}
				
			}
		
		});//ajaxfunction
	
			$(this).parent().find('input').fadeToggle('100');
			$(this).parent().find('button').fadeToggle('100');
			$(this).parent().find('span').toggle();
			$(this).parent().find('span').html(txt);
		
	});//버튼클릭function
	
	
}










//글쓰기 로그인 체크
function loginChekBoard() {
	$('#writeBtn').click(function() {
		let id = $('#loginCheckId').val();
		
		if(id.length == 0){
			alert('로그인 후 사용가능합니다.')
			return false;
		}
		
		
	});
	

}

// 댓글 쓰기 로그인 체크 






$(function() {
	loginChekBoard();
	createComment();
	getComments();
	deleteComment();
	commentUpdate();
});





