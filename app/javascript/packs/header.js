$(document).on('turbolinks:load', function() {
     
      $(".clickslide").click(function(){
        $("#dropdown__header").addClass('dropdown__active');
        console.log('開く？')
        if( $('#dropdown__header').hasClass('dropdown__active')) {
           $("#dropdown__header").removeClass('dropdown__active');
            console.log('条件式は？')
          }
      })
     


});

