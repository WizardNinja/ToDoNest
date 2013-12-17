$(function(){
	$('.menu-trigger').click(function(event){
		event.preventDefault();
		$('#menu').toggleClass('menu-open');
	});
});