$(document).ready(function() {
  $('.button').on('click', function() {
    $(this).find('a').trigger('click');
  });
});
