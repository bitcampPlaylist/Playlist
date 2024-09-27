//노래 클릭했을때 
$('.songArt').click(function(){
    let songId = $(this).data('song-id');
	

    $.ajax({
        url: '/playlist2/musicplayer/getSong.do',
        type: 'GET',
        data: { song_id: songId },
        dataType: 'json', // JSON 응답을 기대
        success: function(data){
            // data는 SonglistDTO 객체로 가정
            $('#albumArt img').attr('src', data.song_albumart);
            $('#songName a').text(data.song_name);
            $('#artistName a').text(data.song_artist);
            $('#audioPlayer').attr('src', data.song_file_name); // 오디오 소스 설정
            $('#audioPlayer')[0].play(); // 노래 재생
			var imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/album/" + data.song_albumart;

			        // div 요소 가져오기
			        var albumArtDiv = document.getElementById("albumart_src");
					
			        // img 요소 생성
			        var imgElement = document.createElement("img");
			        imgElement.src = imageUrl;
			        imgElement.alt = "Album Art";
			        imgElement.style.width = "100%";  // 원하는 스타일 설정
			        imgElement.style.height = "auto";  // 이미지 비율 유지

			        // div에 img 요소 추가
			        albumArtDiv.appendChild(imgElement);
					
			var audioUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-144/storage/music/" + data.song_file_name;

			// 오디오 플레이어 태그 가져오기
			       var audioPlayer = document.getElementById("audioPlayer");

			       // 오디오 플레이어에 src 속성 설정
			       audioPlayer.src = audioUrl;

			       // 오디오 자동 재생 (옵션)
			       audioPlayer.autoplay = true;
				   
        },
        error: function(e){
            console.log(e);
        }
    });
});