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
        },
        error: function(e){
            console.log(e);
        }
    });
});