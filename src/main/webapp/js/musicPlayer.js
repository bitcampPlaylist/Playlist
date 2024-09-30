$(function () {
    const audioPlayer = document.getElementById("audioPlayer");
    let isShuffle = false; // 셔플 상태 초기화
    let isRepeat = false;  // 반복 상태 초기화
    let currentSongIndex = -1; // 현재 재생 중인 노래의 인덱스 (-1은 재생 중인 노래가 없음을 의미)
    let playlistSongs = [];     // 플레이리스트에 있는 노래들의 ID를 담을 배열
    let playedSongs = [];       // 셔플 재생 시 이미 재생된 노래의 인덱스 추적

    // 시간을 MM:SS 형식으로 포맷하는 함수
    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${String(minutes).padStart(2, '0')}:${String(remainingSeconds).padStart(2, '0')}`;
    }

    // timeupdate 이벤트 리스너를 추가하여 진행 바와 현재 시간을 업데이트
    audioPlayer.addEventListener('timeupdate', function () {
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
    audioPlayer.onloadedmetadata = function () {
        const totalDuration = audioPlayer.duration;
        $('#totalTime').text(formatTime(totalDuration));
        $('#timeSlider').attr('max', totalDuration);
        $('#currentTime').text('00:00');
        $('#timeFill').css('width', '0%');
        $('#timeSlider').val(0);
    };

    // 오디오 재생이 끝났을 때 다음 노래 재생
    audioPlayer.onended = function () {
        nextSong();
    };

    // 노래 클릭 핸들러
    $('.songArt').click(function () {
        let songId = $(this).data('song-id');
        console.log('클릭한 노래 ID:', songId); // 노래 클릭 시 로그 확인

        // 노래가 이미 플레이리스트에 있는지 확인
        if (!playlistSongs.includes(songId)) {
            playlistSongs.push(songId);
            // AJAX 요청을 통해 노래 정보 가져오기 및 재생 목록에 추가
            $.ajax({
                url: '/playlist2/musicplayer/getSong.do',
                type: 'GET',
                data: { song_id: songId },
                dataType: 'json',
                success: function (data) {
                    const imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/" + data.song_albumart;
                    const audioUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/music/" + data.song_file_name;

                    // 노래 정보를 업데이트
                    $('#songName a').text(data.song_name);
                    $('#artistName a').text(data.song_artist);

                    // 앨범 아트를 업데이트
                    const albumArtDiv = document.getElementById("albumart_src");
                    while (albumArtDiv.firstChild) {
                        albumArtDiv.removeChild(albumArtDiv.firstChild);
                    }
                    const imgElement = document.createElement("img");
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
                        // 현재 노래 인덱스를 업데이트
                        currentSongIndex = playlistSongs.length - 1;
                    }).catch((error) => {
                        console.error('오디오 재생 중 오류 발생:', error);
                    });

                    // 재생 목록 업데이트
                    updatePlaylist(data.song_name, data.song_artist, imageUrl, songId);
                },
                error: function (e) {
                    console.log('노래 데이터 가져오는 중 오류 발생:', e);
                }
            });
        } else {
            // 노래가 이미 플레이리스트에 있는 경우 해당 노래 재생
            currentSongIndex = playlistSongs.indexOf(songId);
            playSongByIndex(currentSongIndex);
        }
    });

    // 재생 목록에 노래 추가 및 UI 업데이트
    function updatePlaylist(songName, artistName, imageUrl, songId) {
        const playlist = $('#playlist');
        const newSongItem = `
            <li style="display: flex; align-items: center; margin-bottom: 20px;">
                <img src="${imageUrl}" alt="${songName}의 앨범 아트" style="width: 50px; height: auto; margin-right: 10px; border: 1px solid black;">
                <div style="flex-grow: 1;">
                    <a href="#" class="playlistSong" data-song-id="${songId}" style="font-weight: bold; font-size: 12px; display: block;">${songName}</a>
                    <span style="color: #666; font-size: 12px;">${artistName}</span>
                </div>
            </li>`;
        playlist.append(newSongItem);

        // 클릭 이벤트 핸들러 추가
        $('.playlistSong').last().off('click').on('click', function (e) {
            e.preventDefault(); // 링크 클릭 기본 동작 방지
            let songId = $(this).data('song-id'); // 클릭한 노래 ID 가져오기
            console.log('클릭한 노래 ID:', songId); // 디버깅을 위한 로그 추가

            let songIndex = playlistSongs.indexOf(songId);
            if (songIndex !== -1) {
                currentSongIndex = songIndex;
                playSongByIndex(currentSongIndex);
            }
        });

        // 처음 노래 추가 시 재생 시작
        if (currentSongIndex === -1) {
            currentSongIndex = 0;
            playSongByIndex(currentSongIndex);
        }
    }

    // 다음 노래 버튼 클릭 핸들러
    $('#nextSongBtn').click(function () {
        nextSong();
    });

    // 이전 노래 버튼 클릭 핸들러
    $('#prevSongBtn').click(function () {
        prevSong();
    });

    // 다음 노래 재생 함수
    function nextSong() {
        if (isRepeat) {
            // 반복 기능이 활성화된 경우, 현재 노래 재생
            playSongByIndex(currentSongIndex);
        } else if (isShuffle) {
            // 셔플 기능이 활성화된 경우, 랜덤한 노래 재생
            if (playedSongs.length === playlistSongs.length) {
                // 모든 노래가 재생된 경우 재생 목록 초기화
                playedSongs = [];
            }

            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * playlistSongs.length);
            } while (playedSongs.includes(randomIndex) && playedSongs.length < playlistSongs.length);

            if (playedSongs.length < playlistSongs.length) {
                playedSongs.push(randomIndex);
                currentSongIndex = randomIndex;
                playSongByIndex(currentSongIndex);
            } else {
                console.log("모든 노래가 재생되었습니다.");
            }
        } else {
            // 다음 노래 재생
            if (currentSongIndex < playlistSongs.length - 1) {
                currentSongIndex++;
                playSongByIndex(currentSongIndex);
            } else {
                if (isRepeat) {
                    // 반복 기능이 활성화된 경우, 처음으로 돌아가기
                    currentSongIndex = 0;
                    playSongByIndex(currentSongIndex);
                } else {
                    // 재생 목록의 끝에 도달한 경우, 재생 중지
                    audioPlayer.pause();
                    $('#playBtn').show();
                    $('#pauseBtn').hide();
                    console.log("재생 목록의 끝에 도달했습니다.");
                }
            }
        }
    }

    // 이전 노래 재생 함수
    function prevSong() {
        if (isRepeat) {
            // 반복 기능이 활성화된 경우, 현재 노래 재생
            playSongByIndex(currentSongIndex);
        } else if (isShuffle) {
            // 셔플 기능이 활성화된 경우, 이전에 재생한 노래 중 마지막으로 재생한 노래 재생
            if (playedSongs.length > 1) {
                playedSongs.pop(); // 현재 노래 제거
                currentSongIndex = playedSongs.pop(); // 이전 노래 인덱스 가져오기
                playSongByIndex(currentSongIndex);
            } else {
                console.log("이전 재생한 노래가 없습니다.");
            }
        } else {
            // 이전 노래 재생
            if (currentSongIndex > 0) {
                currentSongIndex--;
                playSongByIndex(currentSongIndex);
            } else {
                // 재생 목록의 처음에 도달한 경우, 마지막 노래로 이동
                currentSongIndex = playlistSongs.length - 1;
                playSongByIndex(currentSongIndex);
            }
        }
    }

    // 특정 인덱스의 노래를 재생하는 함수
    function playSongByIndex(index) {
        if (index < 0 || index >= playlistSongs.length) {
            console.log("유효하지 않은 노래 인덱스입니다.");
            return;
        }

        const songId = playlistSongs[index];
        console.log("재생할 노래 ID:", songId);

        $.ajax({
            url: '/playlist2/musicplayer/getSong.do',
            type: 'GET',
            data: { song_id: songId },
            dataType: 'json',
            success: function (data) {
                const imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/" + data.song_albumart;
                const audioUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/music/" + data.song_file_name;

                // 노래 정보를 업데이트
                $('#songName a').text(data.song_name);
                $('#artistName a').text(data.song_artist);

                // 앨범 아트를 업데이트
                const albumArtDiv = document.getElementById("albumart_src");
                while (albumArtDiv.firstChild) {
                    albumArtDiv.removeChild(albumArtDiv.firstChild);
                }
                const imgElement = document.createElement("img");
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
            error: function (e) {
                console.log('노래 데이터 가져오는 중 오류 발생:', e);
            }
        });
    }

    // 시간 슬라이더 입력으로 재생 위치 변경
    $('#timeSlider').on('input', function () {
        audioPlayer.currentTime = parseFloat($(this).val());
        updateTimeFill();
    });

    // 볼륨 슬라이더로 볼륨 조절
    $('#volumeSlider').on('input', function () {
        const volumeValue = $(this).val();
        audioPlayer.volume = volumeValue / 100;
        $('#volumeFill').css('width', volumeValue + '%');
    });

    // 시간 필을 업데이트하는 함수
    function updateTimeFill() {
        const progress = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        $('#timeFill').css('width', progress + '%');
    }

    // 플레이, 일시 정지 버튼
    $('#playBtn').click(function () {
        audioPlayer.play().then(() => {
            $('#playBtn').hide();
            $('#pauseBtn').show();
        }).catch((error) => {
            console.error('오디오 재생 중 오류 발생:', error);
        });
    });

    $('#pauseBtn').click(function () {
        audioPlayer.pause();
        $('#playBtn').show();
        $('#pauseBtn').hide();
    });

    // 셔플 기능
    $('#shuffleBtn').click(function () {
        isShuffle = !isShuffle;
        $(this).toggleClass('active');
        if (isShuffle) {
            isRepeat = false;
            $('#repeatBtn').removeClass('active');
        }
    });

    // 반복 기능
    $('#repeatBtn').click(function () {
        isRepeat = !isRepeat;
        $(this).toggleClass('active');
        if (isRepeat) {
            isShuffle = false;
            $('#shuffleBtn').removeClass('active');
        }
    });

    // 다음 노래 버튼 클릭 시 호출되는 함수
    function nextSong() {
        if (isRepeat) {
            // 반복 기능이 활성화된 경우, 현재 노래 재생
            playSongByIndex(currentSongIndex);
        } else if (isShuffle) {
            // 셔플 기능이 활성화된 경우, 랜덤한 노래 재생
            if (playedSongs.length === playlistSongs.length) {
                // 모든 노래가 재생된 경우 재생 목록 초기화
                playedSongs = [];
            }

            let randomIndex;
            do {
                randomIndex = Math.floor(Math.random() * playlistSongs.length);
            } while (playedSongs.includes(randomIndex) && playedSongs.length < playlistSongs.length);

            if (playedSongs.length < playlistSongs.length) {
                playedSongs.push(randomIndex);
                currentSongIndex = randomIndex;
                playSongByIndex(currentSongIndex);
            } else {
                console.log("모든 노래가 재생되었습니다.");
            }
        } else {
            // 다음 노래 재생
            if (currentSongIndex < playlistSongs.length - 1) {
                currentSongIndex++;
                playSongByIndex(currentSongIndex);
            } else {
                if (isRepeat) {
                    // 반복 기능이 활성화된 경우, 처음으로 돌아가기
                    currentSongIndex = 0;
                    playSongByIndex(currentSongIndex);
                } else {
                    // 재생 목록의 끝에 도달한 경우, 재생 중지
                    audioPlayer.pause();
                    $('#playBtn').show();
                    $('#pauseBtn').hide();
                    console.log("재생 목록의 끝에 도달했습니다.");
                }
            }
        }
    }

    // 이전 노래 재생 함수
    function prevSong() {
        if (isRepeat) {
            // 반복 기능이 활성화된 경우, 현재 노래 재생
            playSongByIndex(currentSongIndex);
        } else if (isShuffle) {
            // 셔플 기능이 활성화된 경우, 이전에 재생한 노래 중 마지막으로 재생한 노래 재생
            if (playedSongs.length > 1) {
                playedSongs.pop(); // 현재 노래 제거
                currentSongIndex = playedSongs.pop(); // 이전 노래 인덱스 가져오기
                playSongByIndex(currentSongIndex);
            } else {
                console.log("이전 재생한 노래가 없습니다.");
            }
        } else {
            // 이전 노래 재생
            if (currentSongIndex > 0) {
                currentSongIndex--;
                playSongByIndex(currentSongIndex);
            } else {
                // 재생 목록의 처음에 도달한 경우, 마지막 노래로 이동
                currentSongIndex = playlistSongs.length - 1;
                playSongByIndex(currentSongIndex);
            }
        }
    }

    // 셔플 모드에서 랜덤한 노래를 재생하는 함수
    function playRandomSong() {
        const playlistLength = playlistSongs.length;
        if (playlistLength === 0) {
            console.log("플레이리스트에 노래가 없습니다.");
            return;
        }

        let randomIndex;
        do {
            randomIndex = Math.floor(Math.random() * playlistLength);
        } while (playedSongs.includes(randomIndex) && playedSongs.length < playlistLength);

        if (playedSongs.length < playlistLength) {
            playedSongs.push(randomIndex);
            currentSongIndex = randomIndex;
            playSongByIndex(currentSongIndex);
        } else {
            console.log("모든 노래가 재생되었습니다.");
        }
    }

    // 특정 인덱스의 노래를 재생하는 함수
    function playSongByIndex(index) {
        if (index < 0 || index >= playlistSongs.length) {
            console.log("유효하지 않은 노래 인덱스입니다.");
            return;
        }

        const songId = playlistSongs[index];
        console.log("재생할 노래 ID:", songId);

        $.ajax({
            url: '/playlist2/musicplayer/getSong.do',
            type: 'GET',
            data: { song_id: songId },
            dataType: 'json',
            success: function (data) {
                const imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/" + data.song_albumart;
                const audioUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/music/" + data.song_file_name;

                // 노래 정보를 업데이트
                $('#songName a').text(data.song_name);
                $('#artistName a').text(data.song_artist);

                // 앨범 아트를 업데이트
                const albumArtDiv = document.getElementById("albumart_src");
                while (albumArtDiv.firstChild) {
                    albumArtDiv.removeChild(albumArtDiv.firstChild);
                }
                const imgElement = document.createElement("img");
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
            error: function (e) {
                console.log('노래 데이터 가져오는 중 오류 발생:', e);
            }
        });
    }

    // 슬라이드 효과로 재생 목록 팝업 표시/숨기기
    $('#playlistBtn').click(function (event) {
        event.stopPropagation(); // 클릭 이벤트가 윈도우로 전파되는 것을 방지

        const playlistPopup = $('#playlistPopup');
        const musicPlayerContainer = $('#musicPlayerContainer');
        const containerOffset = musicPlayerContainer.offset(); // 음악 플레이어 컨테이너의 오프셋 가져오기
        const containerWidth = musicPlayerContainer.outerWidth(); // 컨테이너의 너비 가져오기
        const popupWidth = playlistPopup.outerWidth(); // 팝업의 너비 가져오기

        // 팝업의 위치를 음악 플레이어 컨테이너 바로 아래로 설정
        playlistPopup.css({
            top: containerOffset.top - playlistPopup.outerHeight() - 10, // 컨테이너 위에 위치
            left: containerOffset.left + (containerWidth / 2) - (popupWidth / 2) + 750 // 컨테이너와 정렬하고 750px 오른쪽으로 이동
        });

        if (playlistPopup.css('display') === 'none') {
            playlistPopup.css('display', 'block'); // 팝업 표시
            setTimeout(() => {
                playlistPopup.css('transform', 'translateY(0)');
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
