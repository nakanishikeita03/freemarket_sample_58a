$(function(){
  $('.header-bottom__left__list__category').hover(function() {
    var category_obj = $(this).children('.category_list');
    category_obj.show();
  }, function() {
    $(this).children('.category_list').hide();
  });

  $('.parent_list').hover(function() {
    var category_obj = $(this).children('.child_top');
    category_obj.show();
  }, function() {
    $(this).children('.child_top').hide();
  });

  $('.child_list').hover(function() {
    var category_obj = $(this).children('.gchild_top');
    category_obj.show();
  }, function() {
    $(this).children('.gchild_top').hide();
  });
});