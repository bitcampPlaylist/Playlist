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
		<!-- songInfo div -->
		<div id="songInfo">
			<div id="albumArt"><img src=""></div>
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

	<audio id="audioPlayer" src=""></audio>
	
	<!-- Playlist Modal (initially hidden) -->
    <div id="playlistModal" class="playlist-modal">
        <div class="playlist-content">
            <span class="closeBtn">&times;</span>
            <h2>Playlist</h2>
            <ul id="playlist">
                <!-- Playlist items will be dynamically populated -->
            </ul>
        </div>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	const audioPlayer = $('#audioPlayer')[0];
	
	//노래 (로컬)
    const songs = [
     	{
    		path:  'http://localhost:8080/playlist2/music/iCantDream.mp3',
    		displayName: 'I Can\'t Dream',
    		cover: 'http://localhost:8080/playlist2/image/anonymousartists.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:   'http://localhost:8080/playlist2/music/thatsNotIt.mp3',
    		displayName: '그게 아니라..',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  'http://localhost:8080/playlist2/music/youJumpIJump.mp3',
    		displayName: 'you jump, i jump',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'MINDA',
    	},	
    	{
    		path:  'http://localhost:8080/playlist2/music/magneticRemix.mp3',
    		displayName: 'Magnetic(Remix)',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'Illit, MINDA',
    	},
    	{
    		path:  'http://localhost:8080/playlist2/music/someoneElse.mp3',
    		displayName: 'SomeOneelSe',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  'http://localhost:8080/playlist2/music/shutUp.mp3',
    		displayName: 'shut up!',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'MINDA',
    	},
    	{
    		path:  'http://localhost:8080/playlist2/music/drift.mp3',
    		displayName: 'Drift',
    		cover: 'http://localhost:8080/playlist2/image/ooo.jpg',
    		artist: 'MINDA',
    	},
    ];
	
    let currentSongIndex = 0;
    let isShuffle = false;
    let isRepeat = false;  
    let playedSongs = [];
    let timeInterval;
    
    //음악 플레이어 정보 업데이트
    function updateSongInfo() {
        const currentSong = songs[currentSongIndex];
        $('#albumArt img').attr('src', currentSong.cover);
        $('#songName a').text(currentSong.displayName);
        $('#artistName a').text(currentSong.artist);      
		audioPlayer.src = currentSong.path;
		
		$('#currentTime').text('00:00');
        audioPlayer.onloadedmetadata = function() {
            const totalDuration = audioPlayer.duration;
            $('#totalTime').text(formatTime(totalDuration));
            $('#timeSlider').attr('max', totalDuration);
        };
        
     	// Update the time slider as the song plays
        $('#timeSlider').off('input').on('input', function() {
            const value = $(this).val();
            audioPlayer.currentTime = value; // Set audio currentTimeupdateTimeFill();
            updateTimeFill();
        });
    }
    
 	// Format time function
    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const secs = Math.floor(seconds % 60);
        return String(minutes).padStart(2, '0') + ':' + String(secs).padStart(2, '0');
    }

    $('#playBtn').click(function() {
        audioPlayer.play();
        $('#playBtn').hide();
        $('#pauseBtn').show();
        startTimeUpdate();
    });
	
    $('#pauseBtn').click(function() {
        audioPlayer.pause();
        $('#playBtn').show();
        $('#pauseBtn').hide();
        clearInterval(timeInterval); // Clear the interval when paused
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
    
    const $volumeSlider = $('#volumeSlider');
    const $volumeFill = $('#volumeFill');	
 	// Add an event listener to update the fill width when the slider value changes
    $volumeSlider.on('input', function() {
        const volumeValue = $(this).val();  // Get the current slider value (0 to 100)
        audioPlayer.volume = volumeValue / 100;  // Update the audio volume as well (0 to 1 scale)
        $volumeFill.css('width', volumeValue + '%');  // Update the fill width based on the thumb position
    });
 	
    updateSongInfo();
    
	 // Function to update current time and slider
    function startTimeUpdate() {
        clearInterval(timeInterval); // Clear previous interval
        timeInterval = setInterval(() => {
            $('#currentTime').text(formatTime(audioPlayer.currentTime)); // Update current time display
            $('#timeSlider').val((audioPlayer.currentTime / audioPlayer.duration) * 100); // Update time slider
            
            // Update timeFill width based on currentTime
            const fillWidth = (audioPlayer.currentTime / audioPlayer.duration) * 100; // Calculate fill width percentage
            $('#timeFill').css('width', fillWidth + '%'); // Update timeFill width
        }, 1000); // Update every second
    }
	 
 	// Show playlist modal when the playlist button is clicked
    $('#playlistBtn').click(function() {
        $('#playlistModal').css('display', 'block');  // Show the modal
    });

    // Hide the modal when the close button is clicked
    $('.closeBtn').click(function() {
        $('#playlistModal').css('display', 'none');  // Hide the modal
    });

    // Hide modal if user clicks outside the modal content
    $(window).click(function(event) {
        if ($(event.target).is('#playlistModal')) {
            $('#playlistModal').css('display', 'none');  // Hide the modal
        }
    });

});

</script>
</body>
</html>