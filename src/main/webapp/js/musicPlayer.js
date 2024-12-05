$(function() {
    const audioPlayer = document.getElementById("audioPlayer");
	let isShuffle = false; // 셔플 상태 초기화
	let isRepeat = false; // 반복 상태 초기화

    // 시간을 MM:SS 형식으로 포맷하는 함수
    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${String(minutes).padStart(2, '0')}:${String(remainingSeconds).padStart(2, '0')}`;
    }

    // timeupdate 이벤트 리스너를 추가하여 진행 바와 현재 시간을 업데이트
    audioPlayer.addEventListener('timeupdate', function() {
        console.log("시간 업데이트 이벤트가 발생했습니다.");
        const currentTime = audioPlayer.currentTime;
        const duration = audioPlayer.duration;

        if (!isNaN(duration)) {
            $('#currentTime').text(formatTime(currentTime));
            $('#timeSlider').val(currentTime);
            const progress = (currentTime / duration) * 100;
            $('#timeFill').css('width', progress + '%');
        }
    });

    // 메타데이터가 로드될 때, 슬라이더와 시간 정보를 업데이트
    audioPlayer.onloadedmetadata = function() {
        const totalDuration = audioPlayer.duration;
        $('#totalTime').text(formatTime(totalDuration));
        $('#timeSlider').attr('max', totalDuration);
        $('#currentTime').text('00:00');
        $('#timeFill').css('width', '0%');
        $('#timeSlider').val(0);
    };

    // 노래 클릭 핸들러
    $('.songArt').click(function() {
        let songId = $(this).data('song-id');
		console.log('클릭한 노래 ID:', songId); // 노래 클릭 시 로그 확인

        $.ajax({
            url: '/playlist2/musicplayer/getSong.do',
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
	
	function updatePlaylist(songName, artistName, imageUrl, songId) {
	    const playlist = $('#playlist');
	    const newSongItem = '<li style="display: flex; align-items: center; margin-bottom: 20px;">' +
	        '<img src="' + imageUrl + '" alt="' + songName + '의 앨범 아트" style="width: 50px; height: auto; margin-right: 10px; border: 1px solid black;">' +
	        '<div style="flex-grow: 1;">' +
	        '<a href="#" class="playlistSong" data-song-id="' + songId + '" style="font-weight: bold; font-size: 12px; display: block;">' + songName + '</a>' +
	        '<span style="color: #666; font-size: 12px;">' + artistName + '</span>' +
	        '</div>' +
	        '</li>';
	    playlist.append(newSongItem);

		// 클릭 이벤트 핸들러 추가
		$('.playlistSong').last().off('click').on('click', function(e) {
		        e.preventDefault(); // 링크 클릭 기본 동작 방지
		        let songId = $(this).data('song-id'); // 클릭한 노래 ID 가져오기
		        console.log('클릭한 노래 ID:', songId); // 디버깅을 위한 로그 추가

	        // AJAX 요청을 통해 노래 정보 가져오기
	        $.ajax({
	            url: '/playlist2/musicplayer/getSong.do',
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
	                audioPlayer.src = audioUrl;
	                audioPlayer.play().then(() => {
	                    $('#playBtn').hide();
	                    $('#pauseBtn').show();
	                }).catch((error) => {
	                    console.error('오디오 재생 중 오류 발생:', error);
	                });
	            },
	            error: function(e) {
	                console.log('노래 데이터 가져오는 중 오류 발생:', e);
	            }
	        });
	    });
	}

    // 시간 슬라이더 입력으로 재생 위치 변경
    $('#timeSlider').on('input', function() {
        audioPlayer.currentTime = parseFloat($(this).val());
        updateTimeFill();
    });

    // 볼륨 슬라이더로 볼륨 조절
    $('#volumeSlider').on('input', function() {
        const volumeValue = $(this).val();
        audioPlayer.volume = volumeValue / 100;
        $('#volumeFill').css('width', volumeValue + '%');
    });

    // 시간 필을 업데이트하는 함수
    function updateTimeFill() {
        const progress = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        $('#timeFill').css('width', progress + '%');
    }
	
	//플레이, 일시정시 버튼
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
	        clearInterval(timeInterval); // 일시 정지할 때 인터벌 클리어
	    });
	
	// 셔플 기능
	$('#shuffleBtn').click(function() {
	    isShuffle = !isShuffle; // 셔플 상태 변경
	    $(this).toggleClass('active'); // CSS 초록색 빛

	    // 셔플이 켜지면 반복 끄기
	    if (isShuffle) {
	        isRepeat = false;
	        $('#repeatBtn').removeClass('active'); // CSS 초록색 빛 없애기
	    }
	});

	// 반복 기능
	$('#repeatBtn').click(function() {
	    isRepeat = !isRepeat; // 반복 상태 변경
	    $(this).toggleClass('active'); // CSS 초록색 빛

	    // 반복이 켜지면 셔플 끄기
	    if (isRepeat) {
	        isShuffle = false;
	        $('#shuffleBtn').removeClass('active'); // CSS 초록색 빛 없애기
	    }
	});
		
	// 슬라이드 효과로 재생 목록 팝업 표시/숨기기
	$('#playlistBtn').click(function(event) {
	    event.stopPropagation(); // 클릭 이벤트가 윈도우로 전파되는 것을 방지

	    const playlistPopup = $('#playlistPopup');
	    const musicPlayerContainer = $('#musicPlayerContainer');
	    const containerOffset = musicPlayerContainer.offset(); // 음악 플레이어 컨테이너의 오프셋 가져오기
	    const containerWidth = musicPlayerContainer.outerWidth(); // 컨테이너의 너비 가져오기
	    const popupWidth = playlistPopup.outerWidth(); // 팝업의 너비 가져오기

	    // 팝업의 위치를 음악 플레이어 컨테이너 바로 아래로 설정
	    playlistPopup.css({
	        top: containerOffset.top - playlistPopup.outerHeight() - 10, // 컨테이너 위에 위치
	        left: containerOffset.left + (containerWidth / 2) - (popupWidth / 2) + 750 // 컨테이너와 정렬하고 200px 오른쪽으로 이동
	    });

	    if (playlistPopup.css('display') === 'none') {
	        playlistPopup.css('display', 'block'); // 팝업 표시
	        setTimeout(() => {
	            playlistPopup.css('transform', 'translateY(0)'); // 보이는 위치로 애니메이션
	        }, 10); // 표시 변경을 허용하기 위한 지연
	    } else {
	        playlistPopup.css('transform', 'translateY(-10px)'); // 살짝 뒤로 이동
	        setTimeout(() => {
	            playlistPopup.css('transform', 'translateY(100%)'); // 아래로 이동하여 사라짐
	        }, 10); // 애니메이션 시작을 위한 지연
	        setTimeout(() => {
	            playlistPopup.css('display', 'none'); // 애니메이션 후 숨기기
	        }, 300); // CSS 전환 지속시간과 일치
	    }
	});
});
