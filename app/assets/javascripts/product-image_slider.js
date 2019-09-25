$(function(){
  $('.image-sub').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    if (selectedSrc.match(/mp4/) || selectedSrc.match(/mov/) || selectedSrc.match(/webm/)) {
      $('.image').addClass('display_none')
    } else {
      $('.image').removeClass('display_none')
      $('.image').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
    }
  });
});