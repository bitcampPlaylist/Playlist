<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Music Layout</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="../css/common.css">
</head>
<body>
 <div class="container-fluid">
        <!-- 상단바 -->
        <div class="row">
            <div class="col-12 top-bar bg-light p-3 d-flex justify-content-between">
                <a class="navbar-brand" href="#">네비바(GNB)</a>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="검색창" aria-label="Search">
                    <button class="btn btn-outline-success me-2" type="submit">검색</button>
                    <a href="#" class="btn btn-outline-primary">로그인</a>
                    <a href="#" class="btn btn-outline-secondary ms-2">회원가입</a>
                </form>
            </div>
        </div>

       <!-- 사이드바 및 메인 콘텐츠 -->
        <div class="row">
            <!-- 사이드바 -->
            <div class="col-md-2 sidebar bg-light p-3">
                <nav>
                    <ul class="list-unstyled">
                        <li><a href="#">메뉴1</a></li>
                        <li><a href="#">메뉴2</a></li>
                    </ul>
                </nav>
            </div>

        <!-- 메인 콘텐츠 -->
	    	<div id="main-content" class="col-md-10 content-area p-3">
	        <!-- 메인페이지에 jsp가 로드되는 위치 -->
	    	</div>
        </div>

        <!-- 하단바(음악 재생 버튼) -->
        <div class="row">
          <jsp:include page="../musicplayer/musicPlayer.jsp" />
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
