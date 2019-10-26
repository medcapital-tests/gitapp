$(document).ready(function () {

  var height = $(window).height();
  $('body').css('height', height);

  $(window).resize(function () {
    var height = $(window).height();
    $('body').css('height', height);
  });

  progressBar()
  tooltip();

  $('.floating-label .custom-select, .floating-label .form-control').floatinglabel();

});