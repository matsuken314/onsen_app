document.addEventListener('turbolinks:load', () => {
$(function() {
        var names = ['RUN','RON','RXN','サウナー','ファイル'];
        $('.onsen_name').autocomplete({
          source: names,
          minLength: 0,
        });

})    
})