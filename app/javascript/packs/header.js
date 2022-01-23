$(document).on('turbolinks:load', function() {
     
});

$(document).on('click', function(e) {
  if(!$(e.target).closest('#dropdown__header').length && !$(e.target).closest('#clickslide').length){
		$('#dropdown__header').fadeOut();
	}else if($(e.target).closest('#clickslide').length){
		// ３．ポップアップの表示状態の判定
		if($('#dropdown__header').is(':hidden')){
			$('#dropdown__header').fadeIn();
		}else{
			$('#dropdown__header').fadeOut();
		}
	}
  });