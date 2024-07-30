<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <style>
        .site-wrap {
            background-color: black;
        }
        section {
            height: 100vh; /* Full screen height */
            color: white; /* White text */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0 30px;
            opacity: 0; /* Start hidden */
            transition: opacity 1.5s ease-out; /* Smooth transition for opacity */
        }
        .visible {
            opacity: 1; /* Make visible when the class is added */
        }
        #myElement {
            font-size: 30px;
        }
        .white-hr {
            border-color: white;
        }
        .nav-buttons {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            gap: 10px;
        }
        .nav-button {
            background-color: white;
            color: black;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .nav-button:hover {
            background-color: #f0f0f0;
        }
    </style>
	<div class="site-wrap">
        <section id="company" class="d-flex justify-content-center align-items-center bg-black">
            <div class="text-center w-50">
                <span id="myElement">Echo Works<br/>Next 버튼을 눌러주세요</span>
            </div>
        </section>
        <section>
            <div class="col-6">
                <p class="fs-2" id="title-1">회사소개</p>
                <hr class="border border-3 white-hr">
                <p class="fs-4">에코웍스는 고품질의 키보드를 제작하여 고객들에게 최상의 타이핑 경험을제공하기 위해 노력하는 전문 기업입니다. 에코웍스는 타이핑의 중요성을 이해하고, 각 사용자의 요구를 충족시키려 위해 지속적으로 제품을 연구하고 개발하고 있습니다.</p>
            </div>
        </section>
        <section>
            <div class="col-6">
                <p class="fs-2" id="title-2">Echo Works의 철학</p>
                <hr class="border border-3 white-hr">
                <p class="fs-4">타이핑은 단순한 입력을 넘어서 창의성과 생산성을 표현하는 중요한 수단입니다. 사용자 친화적이고 내구성이 강한 제품을 통해 누구나 편안하고 즐겁게 타이핑할 수 있도록 돕는 것이 에코웍스의 목표입니다.</p>
            </div>
        </section>
        <section>
            <div class="col-6">
                <p class="fs-2" id="title-3">제품 특징</p>
                <hr class="border border-3 white-hr">
                <p class="fs-4">에코웍스의 키보드는 세련된 디자인과 뛰어난 내구성을 자랑하며, 최신 기술을 적용하여 사용자의 타이핑 경험을 혁신합니다.</p>
            </div>
        </section>
        <section>
            <div class="col-6">
                <p class="fs-2" id="title-4">고객 중심 서비스</p>
                <hr class="border border-3 white-hr">
                <p class="fs-4">에코웍스는 고객의 목소리에 귀 기울이며, 이를 제품과 서비스에 반영하고 있습니다. 에코웍스는 고객 지원 팀을 통해 신속하고 정확한 서비스를 제공하며, 고객 만족을 최우선으로 생각합니다.</p>
            </div>
        </section>
        <section id="vision">
            <div class="col-6">
                <p class="fs-2" id="title-5">에코웍스의 비전</p>
                <hr class="border border-3 white-hr">
                <p class="fs-4">미래의 타이핑 경험을 혁신하는 것, 이것이 에코웍스의 비전입니다. 에코웍스는 항상 더 나은 제품을 제공하기 위해 노력하며, 전 세계의 타이핑 애호가들에게 사랑받는 브랜드로 성장해 나가고자 합니다.</p>
            </div>
        </section>

        <div class="nav-buttons">
            <button class="nav-button" id="backButton" style="display: none;">Back</button>
            <button class="nav-button" id="nextButton">Next</button>
            <button class="nav-button" id="topButton" style="display: none;">Top</button>
        </div>
    </div>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            new TypeIt("#myElement")
                .pause(1000)
                .go();
        });

        let observer = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    let title = entry.target.querySelector("[id^='title']");
                    if (title) {
                        new TypeIt(title, {
                            speed: 100,
                            cursor: false
                        }).go();
                    }
                    // Check if the section is the vision section
                    if (entry.target.id === "vision") {
                        backButton.style.display = 'none';
                        nextButton.style.display = 'none';
                        topButton.style.display = 'block';
                    } else {
                        topButton.style.display = 'none';
                    }
                } else {
                    entry.target.classList.remove('visible');
                }
            });
        }, {
            threshold: 0.1
        });

        let sections = document.querySelectorAll('section');
        sections.forEach((section) => {
            observer.observe(section);
        });

        const nextButton = document.getElementById('nextButton');
        const backButton = document.getElementById('backButton');
        const topButton = document.getElementById('topButton');

        nextButton.addEventListener('click', function() {
            let currentSection = document.querySelector('section.visible');
            let nextSection = currentSection.nextElementSibling;

            if (nextSection) {
                nextSection.scrollIntoView({ behavior: 'smooth' });
                backButton.style.display = 'block';
                if (!nextSection.nextElementSibling) {
                    nextButton.style.display = 'none';
                    topButton.style.display = 'block';
                }
            }
        });

        backButton.addEventListener('click', function() {
            let currentSection = document.querySelector('section.visible');
            let previousSection = currentSection.previousElementSibling;

            if (previousSection) {
                previousSection.scrollIntoView({ behavior: 'smooth' });
                nextButton.style.display = 'block';
                topButton.style.display = 'none';
                if (!previousSection.previousElementSibling) {
                    backButton.style.display = 'none';
                }
            }
        });

        topButton.addEventListener('click', function() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
            nextButton.style.display = 'block';
            backButton.style.display = 'none';
            topButton.style.display = 'none';
        });

        if (document.querySelector('section') === document.querySelector('section.visible')) {
            backButton.style.display = 'none';
        }
    </script>