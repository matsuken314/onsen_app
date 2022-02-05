$(document).on('turbolinks:load', function(event){
 
	   // モーダルのボタンをクリックした時
  	$('.js-modal').on('click', function () {
			var index = $('p.js-modal').index(this);
		 // 何番目のモーダルボタンかを取得
    $('.modal__area').eq(index).fadeIn(100); // クリックしたモーダルボタンと同じ番目のモーダルを表示する
  });

  // ×やモーダルの背景をクリックした時
	$('.modal__bg').on('click', function () {
   $('.modal__area').fadeOut(100);
	 console.log('閉じる背景')
 });
$('.closeModal').on('click', function () {
   $('.modal__area').fadeOut(100);
	 console.log('閉じるボタン')
 });

});

$(document).on('click', function(e) {
  if(!$(e.target).closest('#dropdown__header').length && !$(e.target).closest('#clickslide').length){
		$('#dropdown__header').fadeOut();
	}else if($(e.target).closest('#clickslide').length){
	
		if($('#dropdown__header').is(':hidden')){
			$('#dropdown__header').fadeIn();
		}else{
			$('#dropdown__header').fadeOut();
		}
	}
  });
	

	//  if(!$(e.target).closest('.user__edit__menu').length && !$(e.target).closest('.user__edit__icon').length){
	// 	$('.user__edit__menu').fadeOut();
	// }else if($(e.target).closest('.user__edit__icon').length){
	
	// 	if($('.user__edit__menu').is(':hidden')){
	// 		$('.user__edit__menu').fadeIn();
	// 	}else{
	// 		$('.user__edit__menu').fadeOut();
	// 	}
	// }

