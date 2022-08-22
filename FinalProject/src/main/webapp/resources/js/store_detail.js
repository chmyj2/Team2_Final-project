function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}

let rating = new Rating(); // 별점 인스턴스 생성

$(document).addEventListener('DOMContentLoaded',function() {
	//별점선택 이벤트 리스너
	document.querySelector('.star_rating').addEventListener('click', function(e){
	 let elem = e.target;
	 if (elem.classList.contains('rate_radio')) {
		rating.setRate(parseInt(elem.value));
	}
	})
});

/*document.querySelector('button').addEventListener('click', function(e){
	// 별점 선택 안했으면 메세지 표시
	if (rating.rate == 0) {
		rating.showMessage('rate');
		return false;
	}
});*/