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
            플레이리스트
        </h1>
		<ul id="playlist">
		    <c:forEach var="song" items="${songList}">
		        <li data-song-id="${song.song_id}">
		            <a href="#" class="song-item" data-song-url="${pageContext.request.contextPath}/storage/music/${song.song_file_name}">
		            <strong>${song.song_name}</strong> - ${song.song_artist} <br>
<%-- 		            <small>${song.song_album}</small> --%>
					</a>
		        </li>
		    </c:forEach>
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
//         updateSongInfo();
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
//         updateSongInfo();
        audioPlayer.play();
        $('#playBtn').hide();
        $('#pauseBtn').show();
        startTimeUpdate();
    });
   
//     updateSongInfo();


});

$(function() {
    // 플레이리스트 가져오는 버튼 이벤트
	$(function() {
        $('#playlistBtn').click(function() {
            $('#playlistPopup').show();
            
            var contextPath = '<%= request.getContextPath() %>';
            $.ajax({
                url: contextPath + '/musicplayer/getAllSongs.do',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                	var playlist = $('#playlist');
                    playlist.empty();
                    $.each(data, function(index, song) {
//                         playlist.append('<li><strong>' + song.song_name + '</strong> - ' + song.song_artist + '<br></li>');
                        playlist.append('<li><a href="#" class="song-item" data-song-url="' + contextPath + '/storage/music/' + song.song_file_name + '"><strong>' + song.song_name + '</strong> - ' + song.song_artist + '<br>' + '</a></li>');

                    });
                },
                error: function() {
                }
            });
        });

     // 노래 클릭 이벤트 처리
	 $('#playlist').on('click', 'li', function() {
		    var songId = $(this).data('song-id'); // 클릭한 노래의 song_id 가져오기
			var contextPath = '${pageContext.request.contextPath}';

            $.ajax({
                url: contextPath + '/musicplayer/getSong.do',
                type: 'GET',
                data: { song_id: songId },
                dataType: 'json',
                success: function(data) {
                    var imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/" + data.song_albumart;
                    var audioUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/music/" + data.song_file_name;

                    // 노래 정보를 업데이트
                    $('#songName a').text(data.song_name);
                    $('#artistName a').text(data.song_artist);

                    // 앨범 아트를 업데이트
                    var albumArtDiv = document.getElementById("albumart_src");
                    while (albumArtDiv.firstChild) {
                        albumArtDiv.removeChild(albumArtDiv.firstChild);
                    }
                    var imgElement = document.createElement("img");
                    imgElement.src = imageUrl;
                    imgElement.alt = "앨범 아트";
                    imgElement.style.width = "100%";
                    imgElement.style.height = "auto";
                    albumArtDiv.appendChild(imgElement);

                    // 오디오 소스를 설정하고 재생
                    var audioPlayer = $('#audioPlayer')[0];
                    audioPlayer.src = audioUrl;
                    audioPlayer.play().then(() => {
                        $('#playBtn').hide();
                        $('#pauseBtn').show();
                    }).catch((error) => {
                        console.error('오디오 재생 중 오류 발생:', error);
                    });

                    // DOM에서 직접 노래 이름과 아티스트 이름 가져오기
                    const songName = $('#songName a').text(); // 노래 이름 텍스트 가져오기
                    const artistName = $('#artistName a').text(); // 아티스트 이름 텍스트 가져오기

                    // 재생 목록 업데이트
                    updatePlaylist(songName, artistName, imageUrl, songId);
                },
                error: function(e) {
                    console.log('노래 데이터 가져오는 중 오류 발생:', e);
                }
            });
        });

        // 재생/일시정지 버튼 이벤트
        $('#playBtn').click(function() {
            $('#audioPlayer')[0].play();
            $(this).hide();
            $('#pauseBtn').show();
        });

        $('#pauseBtn').click(function() {
            $('#audioPlayer')[0].pause();
            $(this).hide();
            $('#playBtn').show();
        });

        // 팝업 닫기 버튼 이벤트
        $('#closePopupBtn').click(function() {
            $('#playlistPopup').hide();
        });

        // 재생 목록 업데이트 함수
        function updatePlaylist(songName, artistName, imageUrl, songId) {
            // 여기에서 재생 목록을 업데이트할 수 있는 코드를 작성하세요.
            console.log('재생 목록 업데이트:', songName, artistName, imageUrl, songId);
        }
    });
});

</script>
</body>
</html>