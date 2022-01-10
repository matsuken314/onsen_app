$(document).on('turbolinks:load', function() {
     
      $(".clickslide").click(function(){
        $("#dropdown__header").addClass('dropdown__active');
        console.log('開く？')
      })
     


});

