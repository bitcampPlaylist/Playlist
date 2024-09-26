<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
    <div class="register-container bg-white">
        <h1 class="form-title">회원가입</h1>
        <form name="writeForm" id="writeForm">
            <!-- 이름과 아이디를 두줄로 배치 -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="이름 입력">
                    <div id="nameDiv" class="form-text"></div>
                </div>
                <div class="col-md-6">
                    <label for="register_id" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="register_id" name="register_id" placeholder="아이디 입력">
                    <input type="hidden" id="check" value="">
                    <div id="idDiv" class="form-text"></div>
                </div>
            </div>
            
			<div class="row mb-3">
	            <div class="col-md-6">
	                <label for="pwd" class="form-label">비밀번호</label>
	                <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호 입력">
	                <div id="pwdDiv" class="form-text"></div>
	            </div>
	            <div class="col-md-6">
	                <label for="repwd" class="form-label">비밀번호 재확인</label>
	                <input type="password" class="form-control" id="repwd" placeholder="비밀번호 재입력">
	            </div>
            </div>

            <div class="mb-3">
                <label class="form-label">성별</label><br/>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="gender" value="0" id="male" checked>
                    <label class="form-check-label" for="male">남자</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" class="form-check-input" name="gender" value="1" id="female">
                    <label class="form-check-label" for="female">여자</label>
                </div>
            </div>

            <!-- 이메일 입력 부분 -->
            <div class="row mb-3">
            	<label class="form-label">이메일</label>
            	<div class="col-md-6">
	                <div class="input-group">
	                    <input type="text" class="form-control" name="email1" placeholder="이메일" id="email1">
	                    <span class="input-group-text">@</span>
	                    <input type="text" class="form-control" name="email2" id="email2" placeholder="도메인">
	                </div>
	            </div>
	            <div class="col-md-6">
	                <!-- 이메일 도메인 선택 -->
	                <select class="form-select mt-2" id="emailDomain" onchange="fillEmailDomain()">
	                    <option value="">직접입력</option>
	                    <option value="naver.com">naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="daum.net">daum.net</option>
	                </select>
	            </div>
            </div>

            <div class="mb-3">
                <label for="tel1" class="form-label">휴대전화</label>
                <div class="input-group">
                    <select class="form-select" name="tel1" id="tel1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="019">019</option>
                    </select>
                    <span class="input-group-text">-</span>
                    <input type="text" class="form-control" name="tel2" maxlength="4">
                    <span class="input-group-text">-</span>
                    <input type="text" class="form-control" name="tel3" maxlength="4">
                </div>
            </div>

            <div class="mb-3">
                <label for="zipcode" class="form-label">주소</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편번호" readonly>
                    <button type="button" class="btn btn-outline-secondary" onclick="checkPost(); return false;">우편번호 검색</button>
                </div>
                <input type="text" class="form-control mt-2" id="addr1" name="addr1" placeholder="주소" readonly>
                <input type="text" class="form-control mt-2" id="addr2" name="addr2" placeholder="상세주소">
            </div>

           	<div class="mb-3">
               	<button type="button" class="btn btn-custom" onclick="checkWrite()">회원가입</button>
               	<button type="reset" class="btn btn-outline-secondary">다시작성</button>
            </div>
        </form>
    </div>
</div>


<script>
//아이디 중복 체크
$('#register_id').focusout(function() {
	$('#idDiv').empty();
	
	if($('#register_id').val() == '')
		$('#idDiv').html('먼저 아이디를 입력하세요.');
	else
		$.ajax({
			type: 'post',
			url: '/playlist2/member/checkId.do',
			data: 'id=' + $('#register_id').val(),
			dataType: 'text',
			success: function(data){
				//alert(data.trim());
				
				if(data.trim() == 'exist'){
					$('#idDiv').html('사용 불가능 한 ID입니다.').css('color', 'red');
				}else{
					$('#idDiv').html('사용 가능 한 ID입니다.').css('color', 'blue');
					$('#check').val($('#register_id').val());
				}
			},
			error: function(e){
				console.log(e);
			}
		});
});


//회원가입
function checkWrite() {
	document.getElementById("nameDiv").innerHTML = "";
	document.getElementById("idDiv").innerHTML = "";
	document.getElementById("pwdDiv").innerHTML = "";
	
	//if(document.getElementById("name").value == "") => id 속성
	if(document.writeForm.name.value == "")
		document.getElementById("nameDiv").innerHTML = "이름 입력";
	else if(document.getElementById("register_id").value == "")
		document.getElementById("idDiv").innerHTML = "아이디 입력";
	else if(document.getElementById("pwd").value == "")
			document.getElementById("pwdDiv").innerHTML = "비밀번호 입력";
	else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
			document.getElementById("pwdDiv").innerHTML = "비밀번호가 맞지 않습니다.";
	else if(document.getElementById("register_id").value != document.getElementById("check").value)
		document.getElementById("idDiv").innerHTML = "중복체크 하세요";
	else 
		//document.writeForm.submit();
	
		$.ajax({
			type: 'post',
			url: '/playlist2/member/write.do',
			data: $('#writeForm').serialize(),
			success: function(){
				alert('회원가입을 축하합니다.');
				location.href = '/playlist2/index.jsp';
			},
			error: function(e){
				console.log(e);
			}
		}); //$.ajax
}



//우편번호 - Daum API
function checkPost() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('zipcode').value = data.zonecode;
          document.getElementById("addr1").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("addr2").focus();
      }
  }).open();
}


// 이메일 도메인 선택 시 자동 입력
function fillEmailDomain() {
    var emailDomain = document.getElementById("emailDomain").value;
    document.getElementById("email2").value = emailDomain;  // 선택한 도메인을 이메일2에 입력
}

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
