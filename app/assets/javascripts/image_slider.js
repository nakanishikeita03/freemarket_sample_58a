$(function() {
  $('.slider').slick({
      prevArrow:'.slick-prev',
      nextArrow:'.slick-next',
      dots: true,
      autoplay: true,
      autoplaySpeed: 2500,
      speed: 800
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});






















// const carouselSlide = document.querySelector('.carousel-slide');
// const carouselImages = document.querySelectorAll('.carousel-slide img');

// //Buttons
// const prevBtn = document.querySelector('#prevBtn');
// const nextBtn = document.querySelector('#nextBtn');

// //Counter
// let counter = 1;
// // var size = carouselImages[0].clientWidth;

// carouselSlide.style.transform = 'translateX(1000px)';



// var sliderImages = document.querySelectorAll('.slide');
// var arrowRight = document.getElementById('arrow-right');
// var arrowLeft = document.getElementById('arrow-left');
// var current = 0;

// function startSlide(){
//   sliderImages[0].style.display = 'block';
// }

// arrowRight.addEventListener('click', function() {
//   sliderImages[current].style.display = 'none';
//   if(current === sliderImages.length - 1){
//       current = -1;
//   }
//   sliderImages[current + 1].style.display = 'block';
//   current++;
// })

// arrowLeft.addEventListener('click', function() {
//   sliderImages[current].style.display = 'none';
//   if(current === 0){
//       current = sliderImages.length;
//   }
//   sliderImages[current - 1].style.display = 'block';
//   current--;
// })

// startSlide();
