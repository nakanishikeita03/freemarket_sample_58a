$(function(){


    // subカテゴリー選択画面を表示するための非同期通信（mainを選んだら発動）
    $(document).on('change', '#category_parent', function(){
      var parent_id = $(this).val()
      $('#category_children').parent().removeClass('display_none')
      $('#category_grandchildren').parent().addClass('display_none')
  
      $.ajax({
        type: 'GET',
        url: '/set_sub_category',
        data: {id: parent_id},
        dataType: 'json'
      })

      .done(function(category){
        $("#category_children").empty()
        $("#category_children").append('<option value="" selected>---</option>')
        $.each(category, function(i, cate){
          var children = `<option value="${cate.id}">${cate.name}</option>`
          $("#category_children").append(children)
        })
      })
     
      .fail(function(){
        alert('error')
      })
    })
  


　　 // sub2カテゴリー表示用の非同期通信（subを選んだら発動）
    $(document).on('change', '#category_children', function(){
      var sub2_id = $(this).val()
      $('#category_grandchildren').parent().removeClass('display_none')
  
      $.ajax({
        type: 'GET',
        url: '/set_sub2_category',
        data: {id: sub2_id},
        dataType: 'json'
      })

      .done(function(category){
        $("#category_grandchildren").empty()
        $("#category_grandchildren").append('<option value="" selected>---</option>')
        $.each(category, function(i, cate){
          var sub2category = `<option value="${cate.id}" name="category">${cate.name}</option>`
          $("#category_grandchildren").append(sub2category)
        })
      })

      .fail(function(){
        alert('error')
      })
    })

    $(document).on('click','#product_botton', function(){
      var category_id = $('#category_grandchildren').val()
      if (category_id.length !== 0) {
      $("#category_parent").empty()
      var test = `<option value='${category_id}'></option>`
      $('#category_parent').append(test)
      }
    })

})