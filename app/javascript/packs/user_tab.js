document.addEventListener('turbolinks:load', () => {
$(function () {
    $('.js-tab-trigger').on('click', function () {
        $('.js-tab-trigger').removeClass('is-active');
        $('.js-tab-target').removeClass('is-active');
        $(this).addClass('is-active');
        let id = $(this).data("id");
        $('#' + id).addClass('is-active')
    });
});
})