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
					$('#like_btn').html(total+' 좋아요');
					
				} else{
					alert("실패")
				}
				
				
			}
		
		});
	
}


function likeCheck(board_num,member_ID) {
	
	
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

