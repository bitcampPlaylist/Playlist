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
   admin의 <br>
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

</script>
</body>
</html>