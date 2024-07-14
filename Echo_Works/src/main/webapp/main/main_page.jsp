<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<style>
/* Best Selling Keyboards */
.card img {
	width: 100%;
	height: 300px; /* 원하는 높이로 조정하세요 */
	object-fit: cover; /* 이미지 크기에 맞추어 자르기 */
}

small {
	color: rgb(66, 59, 59);
	font-size: 12px;
	margin: 0px 1px;
}

/* 카르셀 */
.carousel-caption {
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.details {
	color: white;
	border-color: white;
	border: 2px solid white;
	transition: color 0.3s, background-color 0.3s, border-color 0.3s;
}

/* hover시 컬러 바뀌게 */
.details:hover {
	color: black;
	background-color: rgb(231, 231, 231);
	border-color: black;
}

.c-item {
	height: 880px;
}

.c-img {
	height: 100%;
	object-fit: cover;
	filter: brightness(0.7);
}

.carousel-item {
	transition: transform 1.5s ease;
}

/* 스크롤 내릴때 사진내려가게 설계 */
.call-to-action {
	padding: 150px 0;
	position: relative;
	clip-path: inset(0);
}

.call-to-action img {
	position: fixed;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
	z-index: 1;
	filter: brightness(0.7);
}

.call-to-action:before {
	content: "";
	background: color-mix(in srgb, rgb(74, 74, 74), transparent 50%);
	position: absolute;
	inset: 0;
	z-index: 2;
}

.call-to-action .container {
	position: relative;
	z-index: 3;
}

.call-to-action h3 {
	font-size: 28px;
	font-weight: 700;
	color: white;
}

.call-to-action p {
	font-size: 18px;
	color: white;
}

.call-to-action .cta-btn {
	font-weight: 500;
	font-size: 16px;
	letter-spacing: 1px;
	display: inline-block;
	padding: 12px 40px;
	border-radius: 5px;
	transition: 0.5s;
	margin: 10px;
	border: 2px solid white;
	color: white;
}
</style>
<!-- Carousel -->
<div id="hero-carousel" class="carousel slide z-2"
	data-bs-ride="carousel"
>
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#hero-carousel"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"
		></button>
		<button type="button" data-bs-target="#hero-carousel"
			data-bs-slide-to="1" aria-label="Slide 2"
		></button>
		<button type="button" data-bs-target="#hero-carousel"
			data-bs-slide-to="2" aria-label="Slide 3"
		></button>
		<button type="button" data-bs-target="#hero-carousel"
			data-bs-slide-to="3" aria-label="Slide 4"
		></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active carousel-item c-item"
			data-bs-interval="5000"
		>
			<img src="assets/Carousel/keyboard_image1.jpg"
				class="d-block w-100 c-img" alt="..."
			/>
			<div class="carousel-caption d-none d-md-block">
				<h1 class="fs-1">The New SixtyFive</h1>
				<p class="btn fs-5 ps-3 mt-1 details">자세히 보기 ></p>
			</div>
		</div>
		<div class="carousel-item c-item" data-bs-interval="5000">
			<img src="assets/Carousel/keyboard_image2.jpg"
				class="d-block w-100 c-img" alt="..."
			/>
			<div class="carousel-caption d-none d-md-block"></div>
		</div>
		<div class="carousel-item c-item" data-bs-interval="5000">
			<img src="assets/Carousel/keyboard_image3.jpg"
				class="d-block w-100 c-img" alt="..."
			/>
			<div class="carousel-caption d-none d-md-block">
				<h1 class="fs-1">Bridge75</h1>
				<p class="btn fs-5 ps-3 mt-1 details">자세히 보기 ></p>
			</div>
		</div>
		<div class="carousel-item c-item" data-bs-interval="5000">
			<img src="assets/Carousel/keyboard_image4.jpg"
				class="d-block w-100 c-img" alt="..."
			/>
			<div class="carousel-caption d-none d-md-block">
				<h1 class="fs-1">Matrix MrTaxi</h1>
				<h1 class="fs-1">Coming soon...</h1>
			</div>
		</div>
	</div>
</div>

<!-- Best Selling Keyboards -->
<div class="container mt-5">
	<h2 class="text-center mb-4">BEST SELLING KEYBOARDS!</h2>
	<div class="album py-5">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 g-4">
				<div class="col">
					<a href="#FROG_MINI" class="text-decoration-none">
						<div class="card shadow-sm">
							<img src="assets/img/best1.jpg" alt="베스트 키보드1" />
							<div class="card-body">
								<h5 class="card-title">FROG MINI Barebone Kit</h5>
								<p class="card-text">설명글</p>
								<div class="d-flex justify-content-between">
									<div>
										<small>평점 5.0</small> <small>리뷰 47</small>
									</div>
									<span class="best_price">310,000원</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col">
					<a href="#FROG_MINI" class="text-decoration-none">
						<div class="card shadow-sm">
							<img src="assets/img/best2.jpg" alt="베스트 키보드1" />
							<div class="card-body">
								<h5 class="card-title">FROG MINI Barebone Kit</h5>
								<p class="card-text">설명글</p>
								<div class="d-flex justify-content-between">
									<div>
										<small>평점 5.0</small> <small>리뷰 47</small>
									</div>
									<span class="best_price">310,000원</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col">
					<a href="#FROG_MINI" class="text-decoration-none">
						<div class="card shadow-sm">
							<img src="assets/img/best3.jpg" alt="베스트 키보드1" />
							<div class="card-body">
								<h5 class="card-title">FROG MINI Barebone Kit</h5>
								<p class="card-text">설명글</p>
								<div class="d-flex justify-content-between">
									<div>
										<small>평점 5.0</small> <small>리뷰 47</small>
									</div>
									<span class="best_price">310,000원</span>
								</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col">
					<a href="#FROG_MINI" class="text-decoration-none">
						<div class="card shadow-sm">
							<img src="assets/img/best4.jpg" alt="베스트 키보드1" />
							<div class="card-body">
								<h5 class="card-title">FROG MINI Barebone Kit</h5>
								<p class="card-text">설명글</p>
								<div class="d-flex justify-content-between">
									<div>
										<small>평점 5.0</small> <small>리뷰 47</small>
									</div>
									<span class="best_price">310,000원</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<section id="call-to-action"
	class="call-to-action section dark-background"
>
	<img src="assets/img/cta-bg.jpg" alt="" />
	<div class="container">
		<div class="row justify-content-center" data-aos="zoom-in"
			data-aos-delay="100"
		>
			<div class="col-xl-10">
				<div class="text-center">
					<h3>ECHOWORKS</h3>
					<p>ECHOWORKS는 국내 커스텀 키보드 시장의 유통사로서 독보적인 존재가 되어가고 있습니다. 각종 키보드의
						벤더이고, 많은 GB도 진행을 하고 있습니다. 유통사가 있다는 것만으로도 충분히 반가운 부분입니다. 제조사인 ITI
						특주축 제조로는 나름 알려진 곳 입니다.</p>
				</div>
			</div>
		</div>
	</div>
</section>