<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="join_wrapper">
            <div id="joinTable">
        <form action="member.update" method="post" enctype="multipart/form-data" name="updateMemberForm" onsubmit="return updateMemberCheck();">
                <div>
                    <div id="joinTableTitle"  align="center">
                        <input readonly="readonly" value="${sessionScope.loginMember.m_id }" name="jm_id" id="updateMemberIDInput" style="color:black;">
                    </div>
                </div>
                
                <div>
                    <div class="td1">PW</div>
                    <div class="td2"><input value="${sessionScope.loginMember.m_pw }" name="jm_pw" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></div>
                </div>
                
                <div>
                    <div class="td1">PW확인</div>
                    <div class="td2"><input value="${sessionScope.loginMember.m_pw }" name="jm_pwChk" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></div>
                </div>
                
                <div>
                    <div class="td1">이름</div>
                    <div class="td2"><input value="${sessionScope.loginMember.m_name }" name="jm_name" placeholder="필수" maxlength="10" autocomplete="off"></div>
                </div>
                
                <div>
                    <div class="td1">주소</div>
                    <div class="td2">
                        <input id="jm_addr3Input" readonly="readonly" value="${addr[2] }"  name="jm_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
                        <span id="addrSearchBtn">[검색]</span>
                        <br>
                        <input id="jm_addr1Input" readonly="readonly" value="${addr[0] }"  name="jm_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
                        <input value="${addr[1] }"  name="jm_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
                    </div>
                </div>
                
                <div>
                    <div align="center" style="background-color: #FFFFFF;">
                        <button>수정</button>
                        <button onclick="bye();" type="button">탈퇴</button>
                    </div>
                </div>
                <div>
                    <div class="td1">사진</div>
                    <div class="td2">
                        <img src="resources/files/${sessionScope.loginMember.m_photo }" id="updateMemberPhoto"><br>
                        <input name="jm_photo" type="file">
                    </div>
                </div>
                
                
        </form>
            </div>
        
        
            </div>
</body>
</html>