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

.keyup {
	max-width: 690px;
}

#countdown {
    display: flex;
    gap: 10px;
    font-size: 2.5em;
    color: #fff;
    background: linear-gradient(45deg, #ff6b6b, #f06595);
    padding: 10px 20px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

#countdown div {
    background: rgba(255, 255, 255, 0.2);
    padding: 10px;
    border-radius: 5px;
    min-width: 60px;
    text-align: center;
    font-weight: bold;
}

#countdown span {
    display: block;
    font-size: 0.5em;
    margin-top: 5px;
    color: #f8f9fa;
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
	padding: 100px 0;
	position: relative;
	clip-path: inset(0);
	opacity: 0;
    transition: opacity 1s ease-in-out;
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

#call-to-action.visible {
    opacity: 1;
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
	transition-duration: 200ms;
	transition-property: transform, box-shadow;
	transition-timing-function: ease-out;
}

#light {
	position: absolute;
	width: 100%;
	height: 100%;
	border-radius: 9px;
}

/* 반응형 디자인: 작은 화면에서 크기 조정 */
@media (max-width: 768px) {
	#frame {
		width: 90%;
		height: auto;
	}

	#specialCard {
		width: 100%;
		height: 0; /* 높이를 0으로 설정하여 요소가 사라지지 않도록 함 */
		padding-bottom: 48.9%; /* 원래 비율을 유지하기 위해 padding-bottom 사용 */
		background-size: cover;
	}

	#light {
		width: 100%;
		height: 100%;
	}
}

@media (max-width: 576px) {
	#frame {
		width: 100%;
		height: auto;
	}

	#specialCard {
		width: 100%;
		height: 0; /* 높이를 0으로 설정하여 요소가 사라지지 않도록 함 */
		padding-bottom: 48.9%; /* 원래 비율을 유지하기 위해 padding-bottom 사용 */
		background-size: cover;
	}

	#light {
		width: 100%;
		height: 100%;
	}
}

.rounded-button {
    width: 100%;
    height: 0;
    padding-bottom: 100%; /* This makes the button a perfect square */
    border-radius: 50%; /* This makes the button a circle */
    border: 2px solid white; /* White border */
    background-color: transparent; /* Transparent background */
    color: white; /* White text */
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s;
    position: relative;
}

.rounded-button span {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.rounded-button:hover {
    background-color: rgba(255, 255, 255, 0.1); /* Slightly white background on hover */
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

<!-- 키보드 공중에 띄우기 -->
<section class="keyup mt-5 mb-5 d-flex flex-column justify-content-center mx-auto">
	<h3 class="text-center fs-2 fw-bold ">08.01 Cycle8 Open</h3>
	<div class="text-center fs-3 d-flex justify-content-center fw-bold mb-2 mt-2" id="countdown"></div>
	<div class="mt-2 d-flex align-items-center justify-content-center mt-3 mb-3">
		<div id="frame" >
			<a href="https://www.youtube.com/embed/qZ-n6h4zpfY?si=QuttSCa5tDJ5qLrf" target="_blank">
				<div id="specialCard">
				<div id="light"></div>
			</div>
			</a>
		</div>
	</div>
</section>
<!-- Best Selling Keyboards -->
<div class="container mt-5">
	<h2 class="text-center mb-2">BEST SELLING KEYBOARDS!</h2>
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
							<img class="" src="assets/img/best4.jpg" alt="베스트 키보드1" />
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
				<div class="d-flex justify-content-between align-items-center">
                    <div class="col-7">
                        <h3>ECHOWORKS</h3>
                        <p>ECHOWORKS는 국내 커스텀 키보드 <br/> 시장의 유통사로서 독보적인 존재가 되어가고 있습니다</p>
                    </div>
                    <div class="col-4" style="max-width:180px;">
                        <a href="<%=request.getContextPath()%>/index.jsp?workgroup=company&work=company" class="rounded-button text-center text-nowrap"><span>자세히 보기</span></a>
                    </div>
                </div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
const frame = document.getElementById('frame');
const card = document.getElementById('specialCard');
const light = document.getElementById('light');

function updateDimensions() {
    const rect = frame.getBoundingClientRect();
    return {
        x: rect.x,
        y: rect.y,
        width: rect.width,
        height: rect.height
    };
}

let { x, y, width, height } = updateDimensions();

function mouseMove(e) {
    const left = e.clientX - x;
    const top = e.clientY - y;
    const centerX = left - width / 2;
    const centerY = top - height / 2;
    const d = Math.sqrt(centerX ** 2 + centerY ** 2);

    card.style.transition = "box-shadow 200ms ease-out, transform 200ms ease-out";
    card.style.boxShadow = 
        (-centerX / 15) + "px " + (-centerY / 15) + "px 20px rgba(0, 0, 0, 0.5)";
    card.style.transform = 
        "rotate3d(" + (-centerY / 100) + ", " + (centerX / 100) + ", 0, " + (d / 80) + "deg)";

    light.style.backgroundImage = 
        "radial-gradient(circle at " + left + "px " + top + "px, " +
        "rgba(255, 0, 0, 0.1), rgba(255, 127, 0, 0.1), rgba(255, 255, 0, 0.1), " +
        "rgba(0, 255, 0, 0.1), rgba(0, 0, 255, 0.1), rgba(75, 0, 130, 0.1), rgba(139, 0, 255, 0.1))";
}

frame.addEventListener('mouseenter', () => {
    frame.addEventListener('mousemove', mouseMove);
});

frame.addEventListener('mouseleave', () => {
    frame.removeEventListener('mousemove', mouseMove);
    card.style.transition = "box-shadow 200ms ease-out, transform 200ms ease-out";
    card.style.boxShadow = '';
    card.style.transform = '';
    light.style.backgroundImage = '';
});

window.addEventListener('resize', () => {
    const dimensions = updateDimensions();
    x = dimensions.x;
    y = dimensions.y;
    width = dimensions.width;
    height = dimensions.height;
});

//카운트다운 타겟 날짜 설정 (2024년 8월 2일 18시)
var targetDate = new Date("August 2, 2024 18:00:00").getTime();

// 카운트다운 업데이트 함수
function updateCountdown() {
    var now = new Date().getTime();
    var timeRemaining = targetDate - now;

    if (timeRemaining < 0) {
        document.getElementById("countdown").innerHTML = "선착순 100대 지금 시작합니다!";
        return;
    }

    var hours = Math.floor(timeRemaining / (1000 * 60 * 60));
    var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

    hours = String(hours).padStart(2, '0');
    minutes = String(minutes).padStart(2, '0');
    seconds = String(seconds).padStart(2, '0');
    
    document.getElementById("countdown").innerHTML = 
       hours + ":" + minutes + ":" + seconds ;

    // 1초마다 업데이트
    setTimeout(updateCountdown, 1000);
}

// 초기 카운트다운 업데이트 호출
updateCountdown();

// 회사 설명
const targetElement = document.getElementById('call-to-action');

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('visible');
        } else {
            entry.target.classList.remove('visible');
        }
    });
}, {
    threshold: 0.1
});

observer.observe(targetElement);


</script>