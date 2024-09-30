<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="d-flex justify-content-center align-items-center">
    <form id="loginForm" class="bg-light p-4 rounded shadow" style="width: 100%; max-width: 400px; margin-top: 200px;">
        <div class="text-center mb-4 d-flex flex-column align-items-center">
		    <h1 class="d-flex align-items-center">
                <img src="${ pageContext.request.contextPath }/image/login.png" width="50" height="50" alt="홈"
		             onclick="location.href='${ pageContext.request.contextPath }/index.do'" 
		             style="cursor: pointer;">
		        <span class="ms-3 align-middle">로그인</span>
		    </h1>
		</div>

        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디 입력">
            <div id="idDiv" class="form-text text-danger"></div>
        </div>

        <div class="mb-3">
            <label for="pwd" class="form-label">비밀번호</label>
            <input type="password" class="form-control" name="member_pwd" id="member_pwd" placeholder="비밀번호 입력">
            <div id="pwdDiv" class="form-text text-danger"></div>
        </div>

        <div class="d-flex justify-content-between">
            <button type="button" class="btn btn-primary me-2" id="loginBtn">로그인</button>
            <button type="button" class="btn btn-secondary" onclick="register_page_move()">
                회원가입
            </button>
        </div>

        <div id="loginResult" class="mt-3 text-center"></div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#loginBtn').click(function(){
		$('#member_idDiv').empty();
		$('#pwdDiv').empty();
		
		if($('#member_id').val() == '')
			$('#member_idDiv').html('아이디를 입력하세요');
		else if($('#member_pwd').val() == '')
			$('#pwdDiv').html('비밀번호를 입력하세요');
		else
			$.ajax({
				type: 'post',
				url: '${ pageContext.request.contextPath }/member/login.do',
				
				//data: 'id=' + $('#member_id').val() + '&pwd=' + $('#pwd').val(),
				data: {
					'member_id': $('#member_id').val(),
					'member_pwd': $('#member_pwd').val()
				},
			
				dataType: 'text', //서버로부터 받는 타입, 'text' or 'xml' or 'json'
				success: function(data){
					//alert(data.trim());
					
					if(data.trim() == 'fail'){
						$('#loginResult').html('아이디 또는 비밀번호가 틀렸습니다.');
						$('#loginResult').css('font-size', '12pt');
						$('#loginResult').css('padding', '10px');
					
					} else {
						//alert(data.trim()+"님 로그인");						
						location.href = '/playlist2/index.do';
					}
				},
				error: function(e){
					console.log(e);
				}
			});
	});
});
</script>












