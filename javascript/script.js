$(function(){

  $('*#content-selector').hover(function(){
    $(this).toggleClass('hover', 200);
  });

  $('header li').click(function(){
    $('main').removeClass('hide');
    $('header').animate({height: '20vh'});
    $('header ul').css('flex-direction', 'row').css('justify-content', 'stretch');
  });

  $('*#content-selector').click(function(){
    if($(this).nodeName != "div"){
      var pagecontent = $('#'+$(this).attr('name'));
      $(this).addClass('active').siblings().removeClass('active');
      pagecontent.siblings().filter('section').fadeOut(500, function(){
        pagecontent.fadeIn(500);
      });
    }
  });

  $('div#content-selector').click(function(){
    if($(this).parent().attr('id') == 'dropdown'){
      var step = $(this).parents('section[id=imagine]').attr('id');
      var navbarSelection = $(this).parent().parent().parent().parent().attr('id');
      var tabSelection = $(this).attr('name');
      console.log('section #' + $(this).attr('name'));
      $('section #' + $(this).attr('name')).load('pages/'+step+'/'+navbarSelection+'/'+tabSelection+'.html');
    }
  });

  $('#tabs li').click(function(){
    $(this).children().slideDown(200);
  });

  $('#tabs li #dropdown').mouseleave(function(){
    if(!$(this).parent().is(':hover')){
      $(this).slideUp(200);
    }
  });
  $('#tabs li').mouseleave(function(){
    $(this).children().slideUp(200);
  });
});
