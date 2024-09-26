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
<div id="musicPlayerContainer">
	<div id="songInfo">
		<div id="albumArt"><img src="../image/anonymousartists.jpg" /></div>
<!-- 		<div class="songDetails"> -->
			<div id="songName"><a href="#">I Can't Dream</a></div>
			<div id="artistName"><a href="#">MINDA</a></div>
		</div>
	</div>
	
	<div id="controlsWrapper">
		<div id="songController">
			<i class="bi bi-shuffle" id="shuffleBtn"></i>
			<i class="bi bi-skip-start" id="prevSongBtn"></i>
			<i class="bi bi-play-circle" id="playBtn"></i>
			<i class="bi bi-pause-circle" id="pauseBtn" style="display: none;"></i>
			<i class="bi bi-skip-end" id="nextSongBtn"></i>
			<i class="bi bi-repeat" id="repeatBtn"></i>
		</div>
	
		<div id="timeController">	
			<div id="progressTime"></div>
			<div id="musicDuration">
				<span id="currentTime">00:00</span>
				<span id="totalTime">00:00</span>	
			</div>
		</div>
	</div>
	
	<div id="volumeController">
		<i class="bi bi-list"><a href="#"></a></i>
		<i class="bi bi-volume-down"></i>
		<input type="range" min="1" max="100" value="99" class="volumeSlider" onchange="setVolume()">
	</div> 
</div>

<audio id="audioPlayer" src="../music/iCantDream.mp3"></audio>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	const audioPlayer = $('#audioPlayer')[0];
	
	//노래 (로컬)
    const songs = [
    	{
    		path:  '../music/iCantDream.mp3',
    		displayName: 'I Can\'t Dream',
    		cover: '../image/anonymousartists.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:   '../music/thatsNotIt.mp3',
    		displayName: '그게 아니라..',
    		cover: '../image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  '../music/youJumpIJump.mp3',
    		displayName: 'you jump, i jump',
    		cover: '../image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  '../music/magneticRemix.mp3',
    		displayName: 'Magnetic(Remix)',
    		cover: '../image/ooo.jpg',
    		artist: 'Illit, MINDA',
    	},
    	{
    		path:  '../music/someoneElse.mp3',
    		displayName: 'SomeOneelSe',
    		cover: '../image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  '../music/shutUp.mp3',
    		displayName: 'shut up!',
    		cover: '../image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  '../music/drift.mp3',
    		displayName: 'Drift',
    		cover: '../image/ooo.jpg',
    		artist: 'MINDA',
    	},
    ];
	
    let currentSongIndex = 0;
    let isShuffle = false;
    let isRepeat = false;  
    let playedSongs = [];  
    
    //음악 플레이어 정보 업데이트
    function updateSongInfo() {
        const currentSong = songs[currentSongIndex];
        
        $('#albumArt img').attr('src', currentSong.cover);
        $('#songName a').text(currentSong.displayName);
        $('#artistName a').text(currentSong.artist);      
		audioPlayer.src = currentSong.path;
    }

    $('#playBtn').click(function() {
        audioPlayer.play();
        $('#playBtn').hide();
        $('#pauseBtn').show();
    });
	
    $('#pauseBtn').click(function() {
        audioPlayer.pause();
        $('#playBtn').show();
        $('#pauseBtn').hide();
    });
	
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

                //재생된 노래 (array)에 넣기
                playedSongs.push(currentSongIndex);
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
    });

    //셔플 function
    $('#shuffleBtn').click(function() {
        isShuffle = !isShuffle; //셔플 on
        $(this).toggleClass('active'); //css 초록색 빛
        
        //셔플 on -> 반복 off
        if (isShuffle) {
            isRepeat = false;
            $('#repeatBtn').removeClass('active'); //css 초록색 빛 없애기
        }
    });

    //반복 function
    $('#repeatBtn').click(function() {
        isRepeat = !isRepeat; //반복 on
        $(this).toggleClass('active'); //css 초록색 빛

        //반복 on -> 셔플 off
        if (isRepeat) {
            isShuffle = false;
            $('#shuffleBtn').removeClass('active'); //css 초록색 빛 없애기
        }
    });
    
    updateSongInfo();
});

</script>
</body>
</html>