<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA=Compatible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/musicPlayer.css' />">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

	<div id="playlistPopup">
    <h1 style="text-align: center">
    ~~의 <br>
    플레이리스트</h1>
		<ul id="playlist">
		</ul>
	</div>
	
	<input type="hidden" name="song_id" value="${SonglistDTO.song_id }" />	
	
	<div id="musicPlayerContainer">
		<!-- songInfo div -->
		<div id="songInfo">
			<div id="albumArt">
			<div id="albumart_src">
			</div>
			<!--  <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/${SonglistDTO.song_albumart }"> -->
			</div>
			<div class="songDetails">
				<div id="songName"><a href="#"></a></div>
				<div id="artistName"><a href="#"></a></div>
			</div>
		</div>

		<!-- controlsWrapper div -->
		<div id="controlsWrapper">
			<div id="songController">
				<i class="bi bi-shuffle" id="shuffleBtn"></i> <i
					class="bi bi-skip-start" id="prevSongBtn"></i> <i
					class="bi bi-play-circle" id="playBtn"></i> <i
					class="bi bi-pause-circle" id="pauseBtn" style="display: none;"></i>
				<i class="bi bi-skip-end" id="nextSongBtn"></i> <i
					class="bi bi-repeat" id="repeatBtn"></i>
			</div>

			<div id="timeController">
				<div id="musicDuration">
					<span id="currentTime">00:00</span>
				<div id="timeSliderContainer">
					<span id="timeBar"><span id="timeFill"></span></span> 
					<input id="timeSlider" type="range" min="0" max="100" value="0">
				</div>
				 <span id="totalTime">00:00</span>
				 </div>
			</div>
		</div>

		<!-- volumeController -->
		<div id="volumeController">
			<i class="bi bi-list" id="playlistBtn"></i> 
			<i class="bi bi-volume-down"></i>
			<div id="volumeSliderContainer">
				<span id="volumeBar"> <span id="volumeFill"></span>
				</span> <input id="volumeSlider" type="range" min="0" max="100" value="50">
			</div>
		</div>
	</div>
	
	<audio id="audioPlayer"></audio>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	const audioPlayer = $('#audioPlayer')[0];
	
    let currentSongIndex = 0;  
    let playedSongs = [];
    let timeInterval;
    
    //다음 노래 버튼 
    $('#nextSongBtn').click(function() {
        if (isRepeat) {
            //반복 function if문
            audioPlayer.src = songs[currentSongIndex].path;
        } else {
            if (isShuffle) {
                //셔플 function if문
                if (playedSongs.length === songs.length) {
                    //모든 노래 플레이 -> reset
                    playedSongs = [];
                }
                //재생안된 노래중 선택
                do {
                    currentSongIndex = Math.floor(Math.random() * songs.length);
                } while (playedSongs.includes(currentSongIndex));
                playedSongs.push(currentSongIndex); //재생된 노래 (array)에 넣기
            } else {
                //셔플 X 반복 X
                currentSongIndex++;
                if (currentSongIndex >= songs.length) {
                    currentSongIndex = 0;
                }
            }
        }
        //노래 정보 업데이트
        updateSongInfo();
        audioPlayer.play();
        $('#playBtn').hide();
        $('#pauseBtn').show();
        startTimeUpdate();       
    });
    
    //이전 노래 버튼
    $('#prevSongBtn').click(function() {
        currentSongIndex--;
        if (currentSongIndex < 0) {
            currentSongIndex = songs.length - 1;
        }
        //노래 정보 업데이트
        updateSongInfo();
        audioPlayer.play();
        $('#playBtn').hide();
        $('#pauseBtn').show();
        startTimeUpdate();
    });
   
    updateSongInfo();

 
});

</script>
</body>
</html>