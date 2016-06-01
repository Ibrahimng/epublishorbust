$(function() {
  $('select').selectize({dropdownParent: 'body'});
});
$(window).load(function() {
  $('.slideshow').flexslider({pauseOnHover: true, slideshow:false});

  $('.snippet_slideshow').flexslider({
    animation: "slide",
    itemWidth: 515,
    controlNav: false
  });
});