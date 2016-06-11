$(function(){
  $('header li').hover(function(){
    $(this).toggleClass('hover', 200);
  });

  $('header li').click(function(){
    $('#section-title').html("<h2>"+$(this).attr('name')+"</h2>");
  });
  $('html #content-selector').click(function(){
    $('main').removeClass('hide');
    $('header').animate({height: '50vh'});
    $(this).addClass('active').siblings().removeClass('active');
    $('#'+$(this).attr('name')).show(500).siblings().filter('section').hide(500);
  });
});
