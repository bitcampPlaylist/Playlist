<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header.jsp" %>

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
                    <button class="btn btn-outline-success me-2" type="submit">검색</button>
                    <a href="#" class="btn btn-outline-success">로그인</a>
                    <a href="#" id="signup-btn" class="btn btn-outline-success">회원가입</a>
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
	    <div id="main-content" class="content-wrapper col-md-10 content-area p-3">
	        <!-- 메인페이지에 jsp가 로드되는 위치 -->
	    </div>
        </div>

        <!-- 하단바(음악 재생 버튼) -->
        <%@ include file="/footer.jsp" %>
    </div>



