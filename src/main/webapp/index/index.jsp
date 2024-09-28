<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Music Layout</title>
</head>
<body>
 <div class="container-fluid">
        <!-- 상단바 -->
        <div class="row">
            <div class="col-12 top-bar bg-light p-3 d-flex justify-content-between">
                <a class="navbar-brand space-grotesk" href="${ pageContext.request.contextPath }/index.do">
                	<img class="logoimage" alt="logo2.png" src="${ pageContext.request.contextPath }/image/logo2.png">
                	WATER MELON
                </a>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="검색창" aria-label="Search">
                    <button class="btn btn-outline-success me-2" type="submit">검색</button>&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.memId == 'admin' }">
                    	&nbsp;&nbsp;
	                	<a href="#" id="song-upload-btn" class="btn btn-outline-success">업로드</a>
	                	&nbsp;&nbsp;
	                </c:if>
                   	<c:if test="${sessionScope.memId != null }">
                   		<a href="#" id="logout-btn" class="btn btn-outline-success">로그아웃</a>
					</c:if>
					<c:if test="${sessionScope.memId == null }">               
                    	<a href="#" id="login-btn" class="btn btn-outline-success">로그인</a>
                    	&nbsp;&nbsp;
                    	<a href="#" id="signup-btn" class="btn btn-outline-success">회원가입</a>
                    </c:if>
                </form>
            </div>
        </div>

        <!-- 사이드바 및 메인 콘텐츠 -->
        <div class="row">
            <!-- 사이드바 -->
            <div class="col-md-2 sidebar bg-light p-3">
                <jsp:include page="nav2.jsp"></jsp:include>
            </div>

        <!-- 메인 콘텐츠 -->
	    <div id="main-content" class="content-wrapper col-md-10 content-area p-3">
	        <!-- 메인페이지에 jsp가 로드되는 위치 -->
	        <a href="#" class="songArt" data-song-id="1"><img src="http://localhost:8080/playlist2/image/anonymousartists.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="2"><img src="http://localhost:8080/playlist2/image/imperfect.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="3"><img src="http://localhost:8080/playlist2/image/try.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="4"><img src="http://localhost:8080/playlist2/image/ooo.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="5"><img src="http://localhost:8080/playlist2/image/ooo.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="6"><img src="http://localhost:8080/playlist2/image/ooo.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="7"><img src="http://localhost:8080/playlist2/image/magnetic.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="8"><img src="http://localhost:8080/playlist2/image/naye.jpg" width="100" height="100" style="border: 1px solid black"></a>
	        <a href="#" class="songArt" data-song-id="9"><img src="http://localhost:8080/playlist2/image/vanilla.jpg" width="100" height="100" style="border: 1px solid black"></a>
	    </div>	
	    </div>	
        </div>

        <!-- 하단바(음악 재생 버튼) -->
        <%@ include file="/footer.jsp" %>
    </div>
<script src="${ pageContext.request.contextPath }/js/musicPlayer.js"></script>
<script type="text/javascript">
function register_page_move() {
	event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
	$("#main-content").load("/playlist2/member/register.do");
}
</script>
</body>
</html>



