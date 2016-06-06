
$(document).ready(function(){
  getSelected();
  // $('#navbar ul li a').addClass('selected');
  // console.log($('a').attr('href'));
});

var getSelected = function(){
  var current = location.pathname.split('/').slice(-1)[0];
  $('#navbar a').removeClass('selected');
  $('a[href*='+'"'+current+'"'+']').parent().addClass('selected');
  // console.log($('#navbar li a[href*='+current+']').attr('href'));
};
