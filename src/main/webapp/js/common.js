$(document).ready(function() {
    // 페이지가 처음 로드될 때 main.do를 로드
	if (!sessionStorage.getItem('mainLoaded')) {
	    $("#main-content").load("/playlist2/main.do");
	    sessionStorage.setItem('mainLoaded', 'true'); // 한 번 로드했음을 기록
	}
    // 회원가입 버튼 클릭 시 register.do를 비동기 로드
    $(document).on("click", "#signup-btn", function(event) {
        event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
        $("#main-content").load("/playlist2/member/register.do");
    });
});



