$(function(){
	
	$.ajax({
		url:"resources/t2_js/petHospital.json",
		type : "GET" ,
		dataType:"json",
		async : false,
		success:function(data){
				
				let hospital = data.DATA
						
				var table = $("<table class='main-hospital-list' border='1'/>");
				
				
				$.each(hospital , function(i , m) {
					
					let name = hospital[i].bplcnm;
					let addr = hospital[i].sitewhladdr;
					let tel = hospital[i].sitetel;
					let state = hospital[i].dtlstatenm;
					let mgtno = hospital[i].mgtno;
					
					let [city, ward] = addr.split(' ');
					
						
						if(addr != ""){
					var row = $("<tr>").append(
							
							$("<td/>").text(name),
							$("<td/>").text(ward),
							$("<td/>").text(tel),
							$("<td><a href='hospitalDetailGo?hospital_no="+mgtno+"'>자세히</a></td>")		
							)
						}
						//table.append(row);
					
					$(".hospital_list").append(row);
				});
				
				pagination(0);
				jQuery('.pagination li:first-child').hide("disabled");
		
		}
	});
	


	function pagination(st_row){
		var req_num_row=10;
		var $tr=jQuery('tbody tr');
		var total_num_row=$tr.length;
		var num_pages=0;
		
		var i = st_row+1;
		var paging = (i-1)+req_num_row;
		
		// console.log("st_row: "+ i);
		// console.log("paging: "+ paging);
		
		if(total_num_row % req_num_row ==0){
			num_pages=total_num_row / req_num_row;
		}
		if(total_num_row % req_num_row >=1){
			num_pages=total_num_row / req_num_row;
			num_pages++;
			num_pages=Math.floor(num_pages++);
		}
		
		jQuery('.pagination').append("<li><a class=\"prev\"><<</a></li>");
		
		if(paging >= num_pages) {
			paging = num_pages;
		}
		
		for(i; i<=paging; i++){
			
				jQuery('.pagination').append("<li><a>"+i+"</a></li>");
				jQuery('.pagination li:nth-child(2)').addClass("active");
				jQuery('.pagination a').addClass("pagination-link");
				

				$tr.each(function(i){
			    jQuery(this).hide();
				  if(i+1 <= req_num_row){
							$tr.eq(i).show();
						}
				});

				jQuery('.pagination a').click('.pagination-link', function(e){
					e.preventDefault();
					$tr.hide();
					var page=jQuery(this).text();
					var temp=page-1;
					var start=temp*req_num_row;
					var current_link = temp;
					
				jQuery('.pagination li').removeClass("active");
				jQuery(this).parent().addClass("active");
					for(var i=0; i< req_num_row; i++){
						$tr.eq(temp+i).show();
					}
					
					if(temp >= 1){
					   jQuery('.pagination li:first-child').removeClass("disabled");
					}else {
					   jQuery('.pagination li:first-child').addClass("disabled");
					 }
			        
				});
				
				if (i==paging && i!=num_pages) {
					jQuery('.pagination').append("<li><a class=\"next\">>><inuput type=\"hidden\" name=\"paging\" value=\""+i+"\"></a></li>");
				}
				
			// } // i <= req_num_row
			  
			jQuery('.prev').click(function(e){
			    e.preventDefault();
			    jQuery('.pagination li:first-child').removeClass("active");
			    jQuery('.pagination li').remove();
			    
			    var prev_page = st_row-req_num_row;
			    pagination(prev_page);
			    if(prev_page==0) {
			    	jQuery('.pagination li:first-child').hide("disabled"); 
			    }
			    
			});
		
			jQuery('.next').click(function(e){
			    e.preventDefault();
			    jQuery('.pagination li').addClass("active");
			    jQuery('.pagination li').remove();
			    pagination(paging);
			});

		} // for end

	

	} //pagination end
	




});



/*------------------------*/
