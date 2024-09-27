<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<header>
		<h1>투데이</h1>
		<select>
			<option>태그</option>
			<option>플레이리스트</option>
			<option>닉네임</option>
		</select>
		<div>
			<input type="text" placeholder="select 선택하는 거에 따라서 바껴서 들어와야하나?">
			<input type="button" value="검색">
		</div>
		<button type="button" class="btn btnDjApply">DJ 신청하기</button>
	</header>

	<section>
		<div id="carouselExampleIndicators" class="carousel slide">
			<!-- 캐러셀 인디케이터(위치표시) -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			</div>
			<!-- 캐러셀 -->
			<div class="carousel-inner">
				<h3>
					<span>9월 27일</span> 오늘은 뭐 듣지
				</h3>
				<!-- 1 -->
				<div class="carousel-item active">
					<!-- 이미지 대신 card가 들어갈 부분 -->
					<div class="row">
						<%-- <c:forEach var="item" items="${객체 }"> --%>
						<c:forEach begin="1" end="4" step="1">
							<div class="col-3">
								<section class="card">
									<article class="profile">
										<img class="djplayImg" src="/playlist2/image/blackBG.jpg" alt="DJ PlayList Image"> 
										<img class="djprofileImg" src="/playlist2/image/anonymousartists.jpg" alt="DJ Profile Image">
										<h1 class="djTitle">HOT TRENDY: K-POP 신곡</h1>
									</article>
									<ul class="contact">
										<li>
											<i class="fa-regular fa-circle-user" style="color: rgb(85, 85, 85);"></i>
											<span>K-POP마스터</span>
										</li>
										<li>
											<i class="fa-regular fa-heart" style="color: rgb(85, 85, 85);"></i> <span>615</span> <span style="font-size: 10px;">| 200곡</span>
										</li>
									</ul>
									<nav class="tags">
										<a href="#" class="badge rounded-pill djTag">#휴식</a> 
										<a href="#" class="badge rounded-pill djTag">#발라드</a>
										<a href="#" class="badge rounded-pill djTag">#KPOP</a>
									</nav>
								</section>
							</div> <!-- div.col-3 -->
						</c:forEach>
					</div> <!-- div.row -->
				</div>
				<!-- 2 -->
				<div class="carousel-item">
					<!-- 이미지 대신 card가 들어갈 부분 -->
					<div class="row">
						<%-- <c:forEach var="item" items="${객체 }"> --%>
						<c:forEach begin="1" end="4" step="1">
							<div class="col-3">
								<section class="card">
									<article class="profile">
										<img class="djplayImg" src="/playlist2/image/blackBG.jpg" alt="DJ PlayList Image"> 
										<img class="djprofileImg" src="/playlist2/image/anonymousartists.jpg" alt="DJ Profile Image">
										<h1 class="djTitle">HOT TRENDY: K-POP 신곡</h1>
									</article>
									<ul class="contact">
										<li>
											<i class="fa-regular fa-circle-user" style="color: rgb(85, 85, 85);"></i>
											<span>K-POP마스터</span>
										</li>
										<li>
											<i class="fa-regular fa-heart" style="color: rgb(85, 85, 85);"></i> <span>615</span> <span style="font-size: 10px;">| 200곡</span>
										</li>
									</ul>
									<nav class="tags">
										<a href="#" class="badge rounded-pill djTag">#휴식</a> 
										<a href="#" class="badge rounded-pill djTag">#발라드</a>
										<a href="#" class="badge rounded-pill djTag">#KPOP</a>
									</nav>
								</section>
							</div> <!-- div.col-3 -->
						</c:forEach>
					</div> <!-- div.row -->
				</div>
			</div>
		</div>
	</section>

	<section>
		<div>
			<h3>인기태그</h3>
			<div>
				<c:forEach begin="1" end="8" step="1">
					<a href="#" class="badge rounded-pill djTag">#휴식</a>
				</c:forEach>
			</div>
		</div>
		<article>
			<h5>이제 막 펼쳐진 가을의 첫 페이지</h5>
			<!-- 이미지 대신 card가 들어갈 부분 -->
			<div class="row">
				<%-- <c:forEach var="item" items="${객체 }"> --%>
				<c:forEach begin="1" end="4" step="1">
					<div class="col-3">
						<section class="card">
							<article class="profile">
								<img class="djplayImg" src="/playlist2/image/blackBG.jpg" alt="DJ PlayList Image"> 
								<img class="djprofileImg" src="/playlist2/image/anonymousartists.jpg" alt="DJ Profile Image">
								<h1 class="djTitle">HOT TRENDY: K-POP 신곡</h1>
							</article>
							<ul class="contact">
								<li>
									<i class="fa-regular fa-circle-user" style="color: rgb(85, 85, 85);"></i>
									<span>K-POP마스터</span>
								</li>
								<li>
									<i class="fa-regular fa-heart" style="color: rgb(85, 85, 85);"></i> <span>615</span> <span style="font-size: 10px;">| 200곡</span>
								</li>
							</ul>
							<nav class="tags">
								<a href="#" class="badge rounded-pill djTag">#휴식</a> 
								<a href="#" class="badge rounded-pill djTag">#발라드</a>
								<a href="#" class="badge rounded-pill djTag">#KPOP</a>
							</nav>
						</section>
					</div> <!-- div.col-3 -->
				</c:forEach>
			</div> <!-- div.row -->
		</article>
		<article>
			<h5>장르별로 모아듣는 드라마 OST</h5>
			<!-- 이미지 대신 card가 들어갈 부분 -->
			<div class="row">
				<%-- <c:forEach var="item" items="${객체 }"> --%>
				<c:forEach begin="1" end="4" step="1">
					<div class="col-3">
						<section class="card">
							<article class="profile">
								<img class="djplayImg" src="/playlist2/image/blackBG.jpg" alt="DJ PlayList Image"> 
								<img class="djprofileImg" src="/playlist2/image/anonymousartists.jpg" alt="DJ Profile Image">
								<h1 class="djTitle">HOT TRENDY: K-POP 신곡</h1>
							</article>
							<ul class="contact">
								<li>
									<i class="fa-regular fa-circle-user" style="color: rgb(85, 85, 85);"></i>
									<span>K-POP마스터</span>
								</li>
								<li>
									<i class="fa-regular fa-heart" style="color: rgb(85, 85, 85);"></i> <span>615</span> <span style="font-size: 10px;">| 200곡</span>
								</li>
							</ul>
							<nav class="tags">
								<a href="#" class="badge rounded-pill djTag">#휴식</a> 
								<a href="#" class="badge rounded-pill djTag">#발라드</a>
								<a href="#" class="badge rounded-pill djTag">#KPOP</a>
							</nav>
						</section>
					</div> <!-- div.col-3 -->
				</c:forEach>
			</div> <!-- div.row -->
		</article>
	</section>
