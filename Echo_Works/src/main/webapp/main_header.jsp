<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<style>
/* Header */
/* 햄버거 아이콘 흰색으로 */
.navbar-toggler-icon {
	background-image:
		url('data:image/svg+xml;charset=UTF8,%3Csvg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"%3E%3Cpath stroke="rgba%28255, 255, 255, 1%29" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" d="M4 7h22M4 15h22M4 23h22"/%3E%3C/svg%3E');
}

@media ( min-width : 992px) {
	.nav-item.dropdown:hover .dropdown-menu {
		display: block;
	}
	.nav_box {
		width: 168px;
	}
	.nav-link::before {
		content: "";
		position: absolute;
		bottom: 0;
		left: 50%;
		transform: translateX(-50%);
		width: 0;
		height: 2px;
		background-color: white;
		visibility: hidden;
		transition: 0.3s ease-in-out;
	}
	.nav-link:hover::before, .nav-link.active::before {
		width: 100%;
		visibility: visible;
	}
}

/* 모바일 및 태블릿 화면에서 .dropdown-toggle::after 표시 */
@media ( max-width : 991.98px) {
	.nav-link.dropdown-toggle::after {
		display: inline-block;
	}
	.sidebar {
		background-color: rgb(74, 74, 74, 0.3);
		backdrop-filter: blur(10px);
	}
}

.offcanvas-header {
	height: 81px;
}

.nav-link {
	color: white;
	position: relative;
}

.nav-link:hover, nav-link.ac {
	color: rgb(212, 212, 212);
}

.dropdown-menu .dropdown-item:hover {
	color: gray;
}

/* 기본적으로 .dropdown-toggle::after 숨기기 */
.nav-link.dropdown-toggle::after {
	display: none;
}

.dropdown-item:hover {
	background-color: rgb(127, 129, 129);
}

body.offcanvas-open {
	padding-right: 15px;
}
</style>
<!--Navbar-->
<nav
	class="navbar navbar-expand-lg bg-transparent w-100 z-3 position-absolute sticky-top"
>
	<div class="container mt-2 align-items-center">
		<!-- Logo -->
		<a
			class="navbar-brand fs-4 m-0 p-0 d-flex align-items-center text-white nav_box"
			href="index.jsp?workgroup=main&work=main_page"
		> <img src="assets/img/logo_light.svg"
			style="width: auto; height: 55px" alt="Logo"
		/>
		</a>
		<!-- Toggle -->
		<button class="navbar-toggler shadow-none border-0" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
			aria-controls="offcanvasNavbar"
		>
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- SideBar -->
		<div class="sidebar offcanvas offcanvas-end" tabindex="-1"
			id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel"
		>
			<div
				class="offcanvas-header text-dark border-bottom border-2 justify-content-between align-items-center d-lg-none d-sm-flex"
			>
				<h5 class="offcanvas-title text-white" id="offcanvasNavbarLabel">
					EchoWorks</h5>

				<div class="d-flex gap-2 justify-content-center align-items-center">
					<!-- 로그인 성공 못했을 시 -->
					<a href="login.html" class="text-decoration-none text-white fs-5">Login</a>

					<!-- 로그인 성공하면 -->
					<!-- <a href="#마이페이지" class="text-decoration-none text-white fs-5"
                >Mypage</a
              >
              <a href="#장바구니" class="text-decoration-none text-white fs-5"
                >Cart</a
              > -->
					<button type="button" class="btn-close btn-close-white shadow-none"
						data-bs-dismiss="offcanvas" aria-label="Close"
					></button>
				</div>
			</div>

			<!-- SideBar Body -->
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-center fs-5 flex-grow-1">
					<li class="nav-item dropdown mx-2"><a
						class="nav-link dropdown-toggle keyboards" href="product.html"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false" name="keyboards"
						onclick="handleClick(event, 'keyboards')"
					> Keyboards </a>
						<ul class="dropdown-menu bg-dark mt-2"
							aria-labelledby="navbarDropdown"
						>
							<li><a class="dropdown-item text-white key_inStock"
								name="key_inStock" href="product.html"
							>KeyBoard In-Stock</a></li>
							<li><a class="dropdown-item text-white key_group"
								name="key_group" href="product.html"
							>KeyBoard Group-buy</a></li>
						</ul></li>
					<li class="nav-item dropdown mx-2">
						<!-- 부트스트랩 dropdown 고질병으로 인해 onclick이벤트 호출해서 강제 이동 --> <a
						class="nav-link dropdown-toggle switches" href="product.html"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false" name="switches"
						onclick="handleClick(event, 'switches')"
					> Switches </a>
						<ul class="dropdown-menu bg-dark mt-2"
							aria-labelledby="navbarDropdown"
						>
							<li><a class="dropdown-item text-white linear" href="#"
								name="linear"
							>리니어</a></li>
							<li><a class="dropdown-item text-white tactile" href="#"
								name="tactile"
							>택타일</a></li>
							<li><a class="dropdown-item text-white low" href="#"
								name="low "
							>저소음</a></li>
							<li><a class="dropdown-item text-white magnet" href="#"
								name="magnet"
							>마그네틱</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown mx-2">
						<!-- 부트스트랩 dropdown 고질병으로 인해 onclick이벤트 호출해서 강제 이동 --> <a
						class="nav-link dropdown-toggle keycaps" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false" name="keycaps"
						onclick="handleClick(event, 'keycaps')"
					> Keycaps </a>
						<ul class="dropdown-menu bg-dark mt-2"
							aria-labelledby="navbarDropdown"
						>
							<li><a class="dropdown-item text-white sw" href="#"
								name="sw"
							>SW</a></li>
							<li><a class="dropdown-item text-white fbb" href="#"
								name="fbb"
							>FBB</a></li>
							<li><a class="dropdown-item text-white gmk" href="#"
								name="gmk"
							>GMK</a></li>
							<li><a class="dropdown-item text-white hammerworks" href="#"
								name="hammerworks"
							>Hammerworks</a></li>
						</ul>
					</li>
					<li class="nav-item mx-2"><a href="#"
						class="nav-link deskpads" name="deskpads"
						onclick="window.location.href='product.html#deskpads'"
					>Deskpads</a></li>
				</ul>

				<!-- Login/ Sign up -->
				<div
					class="justify-content-center align-items-center flex-nowrap nav_box nav_box_display d-lg-flex d-sm-none"
				>
					<!-- 회원 로그인 전 -->
					<a href="login.html" class="text-decoration-none text-white fs-5">Login</a>

					<!-- 로그인 후 -->

					<!-- 아이콘으로 버전 -->
					<!-- <a href="#마이페이지" class="text-decoration-none text-white fs-5"
                ><i class="fa-regular fa-circle-user" style="color: #ffffff"></i
              ></a>
              <a href="#장바구니" class="text-decoration-none text-white fs-5"
                ><i class="fa-solid fa-cart-shopping" style="color: #ffffff"></i
              ></a> -->

					<!-- 글씨 버전 -->
					<!-- <a href="#마이페이지" class="text-decoration-none text-white fs-5"
                >Mypage</a
              >
              <a href="#장바구니" class="text-decoration-none text-white fs-5"
                >Cart</a
              > -->
				</div>
			</div>
		</div>
	</div>
</nav>