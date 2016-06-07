$(document).ready(function(){
  getSelected();
  var originalNavBarTop = $('#navbar').position().top;
  $(window).scroll(function(){
    var top = $(window).scrollTop();
    if(top >= $('#navbar').position().top){
      $('#navbar').addClass('floating');
      var newTopMargin = '46px';
      $('main').css('margin-top', newTopMargin);
    } if(top <= originalNavBarTop){
      var newTopMargin = '10px'
      $('#navbar').removeClass('floating');
      $('main').css('margin-top', newTopMargin);
    }
  });
});

var getSelected = function(){
  var current = location.pathname.split('/').slice(-1)[0];
  $('#navbar a').removeClass('selected');
  $('a[href*='+'"'+current+'"'+']').parent().addClass('selected');
  // console.log($('#navbar li a[href*='+current+']').attr('href'));
};
