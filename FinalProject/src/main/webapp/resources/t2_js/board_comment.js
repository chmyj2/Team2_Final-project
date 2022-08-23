
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
    			if(data >= 1){
    				let commentPK = data;
    				console.log("댓글 작성 성공---"+commentPK)
    				
    				let now = new Date();
    				let month = now.getMonth() + 1;  
    				let day = now.getDate();  
    				let hour = now.getHours();
    				let minute = now.getMinutes();
    				
    				let date = month +"-"+ day +"  "+ hour +":"+ minute
    				
    				let inputData = `<div class="commentDiv"><div class="col-sm-8 commentBorder"><div>user : <strong class="cStrong">${id}</strong> <em class="cEm">${date}</em></div><div style="margin-bottom: 10px"><span class="commentSpan">${txt}</span> <img class="replyIMG" src="resources/img/reply.png"> <input class="form-control input-sm toggleInput" type="text"> <button class="btn btn-success btn-sm togglebtn">완료</button></div></div><div><p class="commentPtag" style="display: none" name="0">답글 보기 (0)</p><div class="childCmtCon"></div></div><div class="col-sm-1"><a id="${commentPK}" class="deleteAtag"><i class="fa fa-times">삭제</i></a> <a id="${commentPK}" class="updateAtag"><i class="fa fa-edit">수정</i></a></div><div class="childComment" style="display: none"><div class="row"><div class="col-sm-6"><input class="form-control input-sm commentChildInput" type="text" placeholder="답글 입력..."></div><div class="col-sm-2"><button id="${commentPK}" class="btn btn-success btn-sm commentChildBtn">완료</button></div></div></div></div>`
    				
    				$('#commentContainer').prepend(inputData);
    				
    			}
    			
    			
    		},
    		error : function () {
				return false;
			}
    	
    	});//ajax
    	
    	

			

		

    	
    	
	});
	
}

//페이지 누를 시 댓글 10개 가져오기
function getComments() {
	
	$('.commentPage').click(function() {
		
		let page = $(this).html();
		let board_num = $('#boardNum').val();
		let loginid = $('#memberID').val();
		let start = page * 10 - 9;
		let end = page * 10;
		
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
    				let commentPK = c.comment_num
    				let id = c.comment_member_id;
    				let txt = c.comment_txt
    				let date = c.comment_date;
    				let total = c.comment_child_total;
    				let inputData = `<div class="commentDiv"><div class="col-sm-8 commentBorder"><div>user : <strong class="cStrong">${id}</strong> <em class="cEm">${date}</em></div><div><span class="commentSpan">${txt}</span> <input class="form-control input-sm toggleInput" type="text"><button class="btn btn-success btn-sm togglebtn">완료</button></div></div><div class="col-sm-1"><a id="${commentPK}" class="deleteAtag"><i class="fa fa-times">삭제</i></a> <a id="${commentPK}" class="updateAtag"><i class="fa fa-edit">수정</i></a></div></div>`
    				
    				if(loginid != id){ //본인 작성 댓글에만 수정 삭제버튼 노출 
    					inputData = `<div class="commentDiv"><div class="col-sm-8 commentBorder"><div>user : <strong class="cStrong">${id}</strong> <em class="cEm">${date}</em></div><div><span class="commentSpan">${txt}</span> <input class="form-control input-sm toggleInput" type="text"><button class="btn btn-success btn-sm togglebtn">완료</button></div></div><div class="col-sm-1"></div></div>
`
    				}
    				
    					
    					$('#commentContainer').append(inputData);
    				
    			});
    			
    			
    		}
    	
    	});//ajax
		
		
	});
	
	
}


// 댓글삭제
function deleteComment() {
	let result = 0;
	
	$(document).on("click",'.deleteAtag',function() {
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
	
	$(document).on("click",'.updateAtag',function() {
		$(this).parent().parent().find('input').fadeToggle('100') 
		$(this).parent().parent().find('span').toggle() 
		$(this).parent().parent().find('button').fadeToggle('100') 
		
		 num = $(this).attr('id')
		
	});
	
	$(document).on("click",'.togglebtn',function() {
		
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

//답글 쓰기
function createChildComment() {
	let select = "";
	
	$(document).on("click", '.replyIMG', function() {
		$(this).parent().parent().parent().children().last().fadeToggle('100');
		select = $(this).parent().parent().parent().children().last();
	});
	
	$(document).on("click", '.commentChildBtn', function() {
		let txt = $(select).find('input').val();
		let b_num = $('#boardNum').val();
    	let m_id = $('#memberID').val();
    	let p_num = $(this).attr('id')
    	
    	$.ajax({//답글달기
			type: "POST" ,
			url : "child.comment.create",
			data : {
				"c_child_board_num" : b_num ,
				"c_child_member_id" : m_id ,
				"c_child_parent_num" : p_num ,
				"c_child_txt" : txt 
			},
			success : function(data) {
				if(data == 1){
					console.log("등록 성공")
					$(select).fadeToggle('100');
					
					
				}
				
			}
		
		});//ajaxfunction
    	
		
	});
	
}

// 답글 얻기
function getchildComment() {
	
	
	let select = "";
	let ptag = "";
	
	$(document).on("click", '.commentPtag', function() {
	
		
		let p_num = $(this).parent().parent().parent().children().last().find('button').attr('id');
			select = $(this).parent().parent()
			
			$(this).toggle();
			
		$.ajax({
			type: "GET" ,
			url : "child.comment.get",
			async: false,
			data : {
				"c_child_parent_num" : p_num 
			},
			success : function(data) {
					console.log(data)
					
	    			$.each(data.childComments, function(i, c) {
	    				let b_num = c.c_child_board_num;
	    				
	    				let c_num = c.c_child_num;
	    				let c_id = c.c_child_member_id;
	    				let c_txt = c.c_child_txt;
	    				let c_parent = c.c_child_parent_num;
	    				let c_date = c.c_child_date;
	    				
	    				let inputData = `<div><strong class="cStrong">● ${c_id}</strong> <em class="cEm">${c_date}</em> <a id="${c_num}" class="childUpdateAtag"><i class="fa fa-edit">수정</i></a> <a id="${c_num}" class="childDeleteAtag"><i class="fa fa-times">삭제</i></a><br>&nbsp; <span class="commentSpan">${c_txt}</span><div class="row" style="display:none"><div class="col-sm-5"><input class="form-control input-sm"></div><div class="col-sm-1"><button class="btn btn-success btn-sm editChildBtn">완료</button></div></div></div>`
	    				
	    				$(select).last().append(inputData);
	    				
	    			});
				
			}
		
		});//ajaxfunction
		
	});
	
	
}


function childCommentUpdate() {
	
	let loginid = $('#memberID').val();
	if(loginid.length == 0){
		alert('로그인 후 댓글을 작성해 주세요')
		return false;
	}
	
	
	let c_comment_num = "";
	let select = "";
	
	$(document).on("click", '.childUpdateAtag', function() {
		 let txt = $(this).parent().find('span').text();
		 c_comment_num = $(this).attr('id');
		 
		 $(this).parent().find('span').toggle();
		 $(this).next().next().next().next().toggle();
		select = $(this);
	});
	
	
	$(document).on("click", '.editChildBtn', function() {
		let txt = $(this).parent().parent().find('input').val()
		
		$.ajax({   // 답글 수정 
			type: "POST" ,
			url : "child.comment.update",
			async: false,
			data : {
				"c_child_txt" : txt ,
				"c_child_num" : c_comment_num
			},
			success : function(data) {
					console.log(data)
					
					if(data == 0){
						alert('오류발생')
					}
					
					 $(select).parent().find('span').toggle();
					 $(select).next().next().next().next().toggle();
					 $(select).parent().find('span').text(txt);
					 
					
	
				
			}
		
		});//ajaxfunction
		
		
		
	});
	
	
	
	
	
}








$(function() {
	createComment();
	getComments();
	deleteComment();
	commentUpdate();
	createChildComment();
	getchildComment();
	childCommentUpdate();
});





