document.addEventListener('turbolinks:load', () => {
  $input = $('*[data-behavior="autocomplete"]')
  var options = {
    url: function(phrase) {
      return "/onsens/search.json?q=" + phrase;
    },
    getValue: "name",
  };
  $input.easyAutocomplete(options);
})