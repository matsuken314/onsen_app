console.log("testだよ")
$(function() {
  console.log("これ見れてる？")
        var names = ['RUN','RON','RXN','サウナー','ファイル'];
        $('.onsen_name').autocomplete({
          source: names,
          minLength: 0,
        });

})    