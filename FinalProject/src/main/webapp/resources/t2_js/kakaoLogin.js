function kakaoLogin() {
	Kakao.init('49c8594902864b161db4bab932b13d78');
	console.log(Kakao.isInitialized());
	
        Kakao.Auth.login({
            success: function (authObj) {
                console.log(authObj); // access토큰 값
                Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                getInfo();
            },
            fail: function (err) {
                console.log(err);
            }
        });
			  

	
	
}

function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // 이메일, 성별, 닉네임, 프로필이미지
            var email = res.kakao_account.email;
            var gender = res.kakao_account.gender;
            var nickname = res.kakao_account.profile.nickname;
            var birthday = res.kakao_account.birthday;
            
            checkEmail(email, gender, nickname, birthday);

            console.log(email, gender, nickname, birthday);
        },
        fail: function (error) {
            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
        }
    });
}





function checkEmail(email, gender, nickname, birthday) {
	
	$.ajax({
		url : "team2KakaoLogin",
		type : 'post',
		data : {
			"email" : email ,
			"gender" : gender ,
			"nickname" : nickname ,
			"birthday" : birthday ,
		},
		success : function(data) {
			console.log(data)
			if (data == 1) {
				console.log('good')
				location.reload()
			}
			
			
		}
	
	});
	
	
	
	
	
}



