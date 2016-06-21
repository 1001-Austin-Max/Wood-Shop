var currentImg = 1;
var timeouts = [];
var cleared = false;

$(function() {
	if(document.getElementsByClassName('image-carousel') !== null){ //if the document has an image carousel
		$('.image-carousel .image-wrapper').children(':first-child').addClass('current').fadeIn(1);
	}

	addTimeouts();

	$('.image-carousel .material-icons').click(function(){
		if(!cleared){
			$.each(timeouts, function(id){
				window.clearTimeout(timeouts[id]);
			});
			cleared = true;
		}
		var images = $(this).siblings('.image-wrapper').children();
		var current = images.filter('.current');

		if($(this).is(':first-child')){
			carPrevImage(current);
		}
		if($(this).is(':last-child')){
			carNextImage(current);
		}
	});
});

//general functions

function addTimeouts(){
	if(document.getElementsByClassName('image-carousel') !== null){
		addCarouselTimeouts();
	}
}

//img carousel functions

function carNextImage(current){
	current.removeClass('current').fadeOut(500, function(){
		if(current.is(':last-child')){
			current.siblings(':first-child').addClass('current').fadeIn(500);
			return;
		}
		current.next().addClass('current').fadeIn(500);
	});
}

function carPrevImage(current){
	current.removeClass('current').fadeOut(500, function(){
		if(current.is(':first-child')){
			current.siblings(':last-child').addClass('current').fadeIn(500);
			return;
		}
		current.prev().addClass('current').fadeIn(500);
	});
}

function addCarouselTimeouts(){
	$('.image-carousel').each(function(){
		var car = $(this);
		timeouts.push(window.setInterval(function(){
			carNextImage(car.children('.image-wrapper').children('.current'));
		},3000));
	});
}
