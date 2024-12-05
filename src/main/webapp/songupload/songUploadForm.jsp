<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrap">
	<div id="header">
		<h1>
			<img alt="사과" src="${ pageContext.request.contextPath }/image/apple.png" 
			     width="50" height="50"
			     onclick="location.href='${ pageContext.request.contextPath }/index.do'"
			     style="cursor: pointer;">
			노래 업로드
		</h1>
		<hr style="border-color: #483D8B; border-width: 3px;" />
	</div>
	
	<div id="container">
		<div id="section">
            <form id="songUploadForm" method="post" enctype="multipart/form-data">
				<table border="1">
					<!-- 노래 제목 -->
					<tr>
			        	<th width="150">노래 제목</th>
				        <td>
				            <input type="text" id="song_name" name="song_name" placeholder="노래 제목을 입력하세요">
				            <div id="songNameDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<!-- 아티스트 -->
			    	<tr>
			        	<th>아티스트</th>
				        <td>
				            <input type="text" id="song_artist" name="song_artist" placeholder="아티스트 이름을 입력하세요">
				            <div id="songArtistDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<!-- 앨범 -->
			    	<tr>
			        	<th>앨범명</th>
				        <td>
				            <input type="text" id="song_album" name="song_album" placeholder="앨범명을 입력하세요">
				            <div id="songAlbumDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<!-- 태그 -->
			    	<tr>
			        	<th>태그</th>
				        <td>
				            <input type="text" id="song_tag" name="song_tag" placeholder="태그 입력 (예: 발라드, 락)">
				            <div id="songTagDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<!-- 트랙 번호 -->
			    	<tr>
			        	<th>트랙 번호</th>
				        <td>
				            <input type="number" id="song_traknum" name="song_traknum" placeholder="트랙 번호">
				            <div id="songTraknumDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<!-- 타이틀 여부 -->
			    	<tr>
			        	<th>타이틀 여부</th>
				        <td>
							<input type="checkbox" id="titleyn" name="titleyn" value="1"> 타이틀 곡 여부
							<input type="hidden" id="hiddenTitleyn" name="titleyn" value="0"> <!-- 체크되지 않으면 0을 전송 -->				        </td>
			    	</tr>
			    	
			    	<!-- 앨범 아트 업로드 -->
				    <tr>
				    	<th>앨범 아트</th>
				    	<td>
				    		<img id="showAlbumArt" src="${ pageContext.request.contextPath }/image/placeholder.png" width="70" height="70" />
				    		<img src="${ pageContext.request.contextPath }/image/camera.png" alt="카메라" id="albumArtCamera" width="50" height="50">
				    		<input type="file" name="song_albumart_file" id="song_albumart_file">
				    		<div id="albumArtDiv"></div>
				    	</td>
				    </tr>
				    
				    <!-- 노래 파일 업로드 -->
				    <tr>
				    	<th>노래 파일</th>
				    	<td>
				    		<input type="file" name="song_file_name" id="song_file_name" accept=".mp3, .wav">
				    		<div id="songFileDiv"></div>
				    	</td>
				    </tr>
				    
				    <!-- 제출 및 초기화 버튼 -->
				    <tr>
				        <td colspan="2" align="center">
				        	<input type="submit" value="노래 업로드">
				            <input type="reset" value="다시작성">
				        </td>
				    </tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	// 앨범 아트 업로드
	$('#albumArtCamera').click(function(){
		$('#song_albumart').trigger('click');
	});

	// 앨범 아트 미리보기
	$('#song_albumart').change(function(){
		readURL(this, '#showAlbumArt');
	});

	// 파일 미리보기 함수
	function readURL(input, target){
		var reader = new FileReader();
		reader.onload = function(e){
			$(target).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	

</script>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
