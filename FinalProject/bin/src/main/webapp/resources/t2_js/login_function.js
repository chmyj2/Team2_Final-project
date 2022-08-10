function connectAddrSearchEvent() {
	$("#addrSearchBtn").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#join_addr3Input").val(data.zonecode);
				$("#join_addr1Input").val(data.roadAddress);
			}
		}).open();
	});
}

$(function() {
	connectAddrSearchEvent();
})