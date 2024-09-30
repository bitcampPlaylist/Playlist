$(document).ready(function() {
    // 페이지가 처음 로드될 때 main.do를 로드
	if (!sessionStorage.getItem('mainLoaded')) {
/*	    $("#main-content").load("/playlist2/main.do");*/
		$("#main-content").load("/playlist2/dj/djToday.do");
	    sessionStorage.setItem('mainLoaded', 'true'); // 한 번 로드했음을 기록
	}
    // 회원가입 버튼 클릭 시 register.do를 비동기 로드
    $(document).on("click", "#signup-btn", function(event) {
        event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
        $("#main-content").load("/playlist2/member/register.do");
    });
	
	$(document).on("click", "#song-upload-btn", function(event) {
	    event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
	    $("#main-content").load("/playlist2/songupload/songUploadForm.do");
	});

	$(document).on("click", "#login-btn", function(event) {
	    event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
	    $("#main-content").load("/playlist2/member/loginForm.do");
	});
	
	$(document).on("click", "#logout-btn", function() {
		// AJAX 요청
		$.ajax({
		    url: "/playlist2/member/logout.do",
		    type: "POST",
		    success: function() {
				alert("로그아웃 되었습니다.");
				document.location.reload();
		    },
		    error: function() {
		        alert("로그아웃 중 오류가 발생했습니다.");
		    }
		});
	});
	
});

function register_page_move() {
	$("#main-content").load("/playlist2/member/register.do");
}

 // AJAX를 통한 폼 전송
$(document).on("submit", "#songUploadForm", function(event) {
    event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)

    // 폼 데이터 생성
    var formData = new FormData(this);

    // 타이틀 곡 여부 처리
    if ($("#titleyn").is(":checked")) {
        formData.set("titleyn", "1");
    } else {
        formData.set("titleyn", "0");
    }

    // AJAX 요청
    $.ajax({
        url: "/playlist2/songupload/songUpload.do",
        type: "POST",
        data: formData,
        processData: false, // 필수: 파일 전송을 위해 사용
        contentType: false, // 필수: 파일 전송을 위해 사용
        success: function(response) {
            alert("노래가 성공적으로 업로드되었습니다.");
            // 필요 시 성공 후 처리 (예: 폼 초기화, 메시지 출력 등)
    	    $("#main-content").load("/playlist2/songupload/songUploadForm.do");
        },
        error: function(xhr, status, error) {
            alert("업로드 중 오류가 발생했습니다.");
        }
    });
});


