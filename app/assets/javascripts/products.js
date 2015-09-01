// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var products;

products = function() {

	$cat = $('#category');
	$typ = $('#type');
	$cat.change(function(){
		if ($cat.val() === 'van') {
			$('#trasporto').removeAttr('disabled');
			$('#noleggio').attr('disabled','disabled');
			$('.type').removeClass('hidden');
		} else if ($cat.val() === 'box') {
			$('#noleggio').removeAttr('disabled');
			$('#trasporto').attr('disabled','disabled');
			$('.type').removeClass('hidden');
		} else if ($cat.val() === 'ostacoli') {
			$('#noleggio, #trasporto').attr('disabled','disabled');
			$('.type').removeClass('hidden');
		} else {
			$('.type').addClass('hidden');
		}
	});

	$typ.change(function() {
		if ($typ.val() !== '') {
			$('#search-button').removeClass('hidden');
		} else {
			$('#search-button').addClass('hidden');
		}
	});

	$('#search-form').on('submit', function(e) {
		e.preventDefault();
		var formData = $('#search-form').serialize();
		$('#search-button').html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/products/search',
			type: 'post',
			data: formData
		})
			.done(function(serverData) {
				$('#search-results').html(serverData);
				$('#search-results').fadeIn('slow');
				$('#search-button').html('Cerca');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			});
	});

}

$(document).ready(products);
$(document).on('page:load',products);

