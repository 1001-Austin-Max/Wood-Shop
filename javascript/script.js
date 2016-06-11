$(function(){
  $('li#content-selector').hover(function(){
    $(this).toggleClass('hover', 200);
  });

  $('header li').click(function(){
    $('main').removeClass('hide');
    $('header').animate({height: '20vh'});
    $('header ul').css('flex-direction', 'row').css('justify-content', 'stretch');
  });

  $('li#content-selector').click(function(){
    var pagecontent = $('#'+$(this).attr('name'));
    $(this).addClass('active').siblings().removeClass('active');
    pagecontent.siblings().filter('section').fadeOut(500, function(){
      pagecontent.fadeIn(500);
    });
  });

  $('#tabs li').click(function(){
    var step = $(this).parent().parent().parent().parent().attr('id');
    var navbarSelction = $(this).parent().parent().attr('id');
    var tabSelection = $(this).attr('name');
    $('#'+$(this).attr('name')).load('pages/'+step+'/'+navbarSelction+'/'+tabSelection+'.html');
  });
});
