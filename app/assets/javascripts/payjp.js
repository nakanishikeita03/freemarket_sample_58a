// 現行のpayjpのホームページに記載されてたjsがこれ

// $(document).on('turbolinks:load',function() {
//   Payjp.setPublicKey('pk_test_7e69455f3e701137c2af4142');
//   var form = $("#charge-form"),
//       number = form.find('input[name="number"]'),
//       cvc = form.find('input[name="cvc"]'),
//       exp_month = form.find('select[name="exp_month"]'),
//       exp_year = form.find('input[name="exp_year"]');

//   $("#charge-form").submit(function() {
//     console.log("fire1");
//     form.find("input[type=submit]").prop("disabled", true);

//     var card = {
//         number: number.value,
//         cvc: cvc.value,
//         exp_month: exp_month.value,
//         exp_year: exp_year.value
//     };
//     Payjp.createToken(card, function(s, response) {
//       if (response.error) {
//         form.find('.payment-errors').text(response.error.message);
//         form.find('#token_submit').prop('disabled', false);
//       }
//       else {
//         $(".number").removeAttr("name");
//         $(".cvc").removeAttr("name");
//         $(".exp_month").removeAttr("name");
//         $(".exp_year").removeAttr("name");

//         var token = response.id;

//         form.append($('<input type="hidden" name="payjpToken" />').val(token));
//         console.log("fire2");
//         form.get(0).submit();
//       }
//     });
//   });
// });



// こちらは2017/12月のもの

// $(document).on('turbolinks:load', function() {
// document.addEventListener(
//   "DOMContentLoaded", e => {
//     if (document.getElementById("#token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
//       Payjp.setPublicKey("pk_test_7e69455f3e701137c2af4142"); //ここに公開鍵を直書き
//       let btn = document.getElementById("#token_submit"); //IDがtoken_submitの場合に取得されます
//       btn.addEventListener("click", e => { //ボタンが押されたときに作動します
//         console.log("fire1")
//         e.preventDefault(); //ボタンを一旦無効化します
//         let card = {
//           number: document.getElementById("number").value,
//           cvc: document.getElementById("cvc").value,
//           exp_month: document.getElementById("exp_month").value,
//           exp_year: document.getElementById("exp_year").value
//         }; //入力されたデータを取得します。
//         Payjp.createToken(card, (status, response) => {
//           if (status === 200) { //成功した場合
//             $("#number").removeAttr("name");
//             $("#cvc").removeAttr("name");
//             $("#exp_month").removeAttr("name");
//             $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
//             $("#card_token").append(
//               $('<input type="hidden" name="payjp-token">').val(response.id)
//             ); //取得したトークンを送信できる状態にします
//             document.inputForm.submit();
//             alert("登録が完了しました"); //確認用
//           } else {
//             alert("カード情報が正しくありません。"); //確認用
//           }
//         });
//       });
//     }
//   },
//   false
// );
// });



// もう少し簡単そうなの


$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_7e69455f3e701137c2af4142'); //(自身の公開鍵)

  $("#charge-form").on("click", "#token_submit", function(e) {
    console.log("fire1");
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
        number: parseInt($("#number").val()),
        cvc: parseInt($("#cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: 2020//parseInt($("#exp_year").val())
        
    };
    console.log(card);


    Payjp.createToken(card, function(status, response) {
                console.log("fire2");
                if (status === 200) { //成功した場合
                  $("#number").removeAttr("name");
                  $("#cvc").removeAttr("name");
                  $("#exp_month").removeAttr("name");
                  $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
                  $("#token_submit").append(
                    $('<input type="hidden" name="payjp-token">').val(response.id)
                  ); //取得したトークンを送信できる状態にします
                  console.log(response.id);
                  $("#charge-form").get(0).submit();
                  // document.inputForm.submit();
                  alert("登録が完了しました"); //確認用
                } else {
                  alert("カード情報が正しくありません。"); //確認用
                }
              });




    
    // Payjp.createToken(card, function(status, response) {
    //   console.log("fire2");
    //   if (stauts === 200) {
    //     $(".number").removeAttr("name");
    //     $(".cvc").removeAttr("name");
    //     $(".exp_month").removeAttr("name");
    //     $(".exp_year").removeAttr("name");

    //     var token = response.id;
    //     $("#charge-form").append($('<input type="hidden" name="payjp-token" class="payjp-token" />').val(token));
    //     $("#charge-form").get(0).submit();
    //     console.log("fire3");

    //   }
    //   else {
    //     alert("error")
    //     form.find('button').prop('disabled', false);
    //   }
    // });
  });
});