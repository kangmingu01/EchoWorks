$(document).ready(function () {
  const carouselImg = [
    {
      id: 1,
      img: "../assets/Carousel/keyboard_image1.jpg",
      name: "MODE The New SixtyFive",
    },
    {
      id: 2,
      img: "../assets/Carousel/keyboard_image2.jpg",
      name: "",
    },
    {
      id: 3,
      img: "../assets/Carousel/keyboard_image3.jpg",
      name: "Bridge75",
    },
    {
      id: 4,
      img: "../assets/Carousel/keyboard_image4.jpg",
      name: "Matrix MrTaxi",
      sub: "Coming Soon..",
    },
  ];

  const carouselInner = $("#carouselInner");

  carouselImg.forEach((item, index) => {
    const isActive = index === 0 ? " active" : "";
    const carouselItem = `
      <div class="carousel-item${isActive} c-item">
        <img src="${item.img}" class="d-block w-100 object-fit-cover c-img" alt="${item.name}" />
        <div class="carousel-caption">
          <h2>${item.name}</h2>
        </div>
      </div>
    `;
    carouselInner.append(carouselItem);
  });
});
