<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title> <!-- 페이지별 타이틀을 동적으로 설정 -->
    
    <!-- 공통적으로 불러올 CSS 파일 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/common.css">
	
	<!--  font  -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"> 
   
	<!-- 공통적으로 불러올 JS 파일 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/common.js" defer></script>

	<!-- nav -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/nav2.css">
	
	<!-- DJ -->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/card.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/djToday.css">
	<!--  -->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/djApply.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/djPlaylist.css">
</head>
<body>