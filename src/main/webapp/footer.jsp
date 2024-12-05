<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:include page="/musicplayer/musicPlayer.jsp"></jsp:include>
    <!-- 공통적으로 불러올 JS 파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- nav -->
    <script src="https://kit.fontawesome.com/dec34c372f.js" crossorigin="anonymous"></script>
    <script src="${ pageContext.request.contextPath }/js/nav2.js"></script>
    
    <!-- djPlaylist -->    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${ pageContext.request.contextPath}/js/djPlaylist.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<!--  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${ pageContext.request.contextPath}/js/djToday.js"></script>
	    
</body>
</html>