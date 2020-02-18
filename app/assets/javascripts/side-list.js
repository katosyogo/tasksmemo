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
