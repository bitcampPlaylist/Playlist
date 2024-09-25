<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA=Compatible" content="IE-edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/musicPlayer.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<div id="musicPlayerContainer">
	<div id="songInfo">
		<div id="albumArt"><img src="../image/anonymousartists.jpg" /></div>
		<div class="songDetails">
			<div id="songName"><a href="#">I Can't Dream</a></div>
			<div id="artistName"><a href="#">MINDA</a></div>
		</div>
	</div>
	
	<div id="controlsWrapper">
		<div id="songController">
			<i class="bi bi-shuffle"></i>
			<i class="bi bi-skip-start"></i>
			<i class="bi bi-play-circle"></i>
			<i class="bi bi-skip-end"></i>
			<i class="bi bi-repeat"></i>
		</div>
	
		<div id="timeController">
			<div id="currentTime">00:00</div>
			<input type="range" min="1" max="100" value="0" class="seekSlider" onchange="seekTo()">
			<div id="totalTime">03:29</div>
		</div>
	</div>
	
	<div id="volumeController">
		<i class="bi bi-list"></i>
		<i class="bi bi-volume-down"></i>
		<input type="range" min="1" max="100" value="99" class="volumeSlider" onchange="setVolume()">
	</div>
	
</div>
</body>
</html>