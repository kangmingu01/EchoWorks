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

#frame {
	width: 690px;
	height: 338px;
	transition: transform 200ms;
	
}

#frame:hover {
	transform: scale3d(1.05, 1.05, 1.05);
}

#specialCard {
	width: 100%;
	height: 100%;
	border-radius: 9px;
	background-image: url("assets/img/cycle1.jpg");
	background-position: center;
	background-repeat: no-repeat;
	box-shadow: 0 0 10px 2px rgba(0,0,0,0.1);
	position: relative;
	transition-duration: 250ms;
	transition-property: transform, box-shadow;
	transition-timing-function: ease-out;
}

#light {
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 9px;
}

#specialCard > h1 {
  font-size: 50px;
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
			<div class="col-8">
				<div class="text-center">
					<h3>ECHOWORKS</h3>
					<p class="mt-3 fs-5">맞춤형 키보드에 관한 모든 것을 제공하는 ECHOWORKS에 오신 것을 환영합니다. 최고의 유통업체로서 당사는 다양한 키보드를 제공하며 최신 키보드 혁신을 제공하기 위해 항상 흥미로운 그룹 구매(GB)를 진행하고 있습니다.
					</p>
					<p class="mt-3 fs-5">
독특한 맞춤형 스위치로 유명한 제조업체인 ITI와의 파트너십을 통해 우리는 진정으로 특별한 제품을 제공할 수 있습니다. 맞춤형 키보드를 처음 사용하는 분이든 오랜 열성팬이든 관계없이 우리는 당신을 위한 무언가를 준비했습니다.
</p>
<p class="mt-3 fs-5">
ECHOWORKS는 단순한 매장 그 이상입니다. 최고의 타이핑 경험을 선사하기 위해 헌신하는 키보드 팬 커뮤니티입니다. 우리와 함께 맞춤형 키보드의 세계를 탐험해보세요.</p>
</p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="d-flex align-items-center justify-content-center mt-3 mb-3">
	<div id="frame" >
		<div id="specialCard">
			<div id="light"></div>
		</div>
	</div>
</section>

<script type="text/javascript">
const frame = document.getElementById('frame')
const card = document.getElementById('specialCard')
/* const light = document.getElementById('light') */

let { x, y, width, height } = frame.getBoundingClientRect()

function mouseMove(e) {
  const left = e.clientX - x
  const top = e.clientY - y
  const centerX = left - width / 2
  const centerY = top - height / 2
  const d = Math.sqrt(centerX**2 + centerY**2)

  card.style.boxShadow = 
      (-centerX / 20) + "px " + (-centerY / 20) + "px 5px rgba(0, 0, 0, 0.2)";

  card.style.transform = 
      "rotate3d(" + (-centerY / 200) + ", " + (centerX / 200) + ", 0, " + (d / 80) + "deg)";

  /* light.style.backgroundImage = 
      "radial-gradient(circle at " + left + "px " + top + "px, #00000040, #ffffff00, #ffffff99)"; */
}

frame.addEventListener('mouseenter', () => {
  frame.addEventListener('mousemove', mouseMove)
})

frame.addEventListener('mouseleave', () => {
  frame.removeEventListener('mousemove', mouseMove)
  card.style.boxShadow = ''
  card.style.transform = ''
  light.style.backgroundImage = ''
})

window.addEventListener('resize', () => {
  rect = frame.getBoundingClientRect()
  x = rect.x
  y = rect.y
  width = rect.width
  height = rect.height
})



</script>