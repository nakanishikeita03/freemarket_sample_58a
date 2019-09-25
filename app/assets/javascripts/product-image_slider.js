$(function(){
  $('.image-sub').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    $('.image').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
  });
});