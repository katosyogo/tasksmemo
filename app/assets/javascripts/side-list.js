$(function() {
  //クリックしたときのファンクションをまとめて指定
  $('.left-contents li').click(function() {
  //.index()を使いクリックされたタブが何番目かを調べ、
  //indexという変数に代入します。
    var index = $('.left-contents li').index(this);
    //コンテンツを一度すべて非表示にし、
      $('.right-contents li').css('display','none');
    // //クリックされたタブと同じ順番のコンテンツを表示します。
    $('.right-contents li').eq(index).css('display','block');
    //一度タブについているクラスselectを消し、
    $('.left-contents li').removeClass('list');
    //クリックされたタブのみにクラスselectをつけます。
    $(this).addClass('list')
  });
});
// $(function(){
//   $('.left-contents li').click(function(){
//     $('.text').show();
//   });
// });

// $(function() {
//   // ①タブをクリックしたら発動
//   $('.left-contents li').click(function() {
//     // ②クリックされたタブの順番を変数に格納
//     var index = $('.left-contents li').index(this);
//     // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
//     // $('.left-contents li').removeClass('list');
//     // ④クリックされたタブにクリック済みデザインを適用する
//     $(this).addClass('list');
//     // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
//     $('.right-contents li').eq(index).addClass('text');
//   });
// });