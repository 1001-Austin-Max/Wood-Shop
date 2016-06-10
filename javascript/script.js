$(function(){
  $('*').click(function(){
    var clicked = $(this);
    $('div[id='+clicked.attr('href')+']').siblings().hide(600, function(){
      $('div[id='+clicked.attr('href')+']').show(600);
    });
  });
  $('header button').click(function(){
    $('main').removeClass('hide');
    $('header').animate({height: '80vh'}, 600, function(){
      $('main').show(600);
    });
  });
});
