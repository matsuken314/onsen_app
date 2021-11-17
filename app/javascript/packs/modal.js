document.addEventListener('turbolinks:load', () => {

$('#openModal').on('click', function () {
   $('#modalArea').toggleClass('is-show');
 });
 $('#closeModal').on('click', function () {
   $('#modalArea').toggleClass('is-show');
 });
 $('#modalBg').on('click', function () {
   $('#modalArea').toggleClass('is-show');
 });

})