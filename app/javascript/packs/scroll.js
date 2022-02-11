document.addEventListener('turbolinks:load', () => {
var windowHeight = $(window).height(); //ウインドウの高さを取得
var distance = 0;
var scrollend = $('.bottom__spnav').offset().top ; //ページ上部からの距離を取得
    window.onscroll = function () {
        var check = window.pageYOffset ;       //現在のスクロール地点 
        var docHeight = $(document).height();   //ドキュメントの高さ
        var dispHeight = $(window).height();    //表示領域の高さ
 
        if(check > docHeight-dispHeight-50){   //判別式100はフッターからの距離です（ここはサイトのフッターに合わせて変更しましょう）
            $('.bottom__spnav').fadeOut(500);  //1000 はフェードインの速度です。調整可
        }else{
            $('.bottom__spnav').fadeIn(200); //1000 はフェードアウトの速度です。調整可
        }
    };

})