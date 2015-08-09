var ready;

ready = function() {

	// CAROUSEL MODAL AJAX

	$('[id^=carousel_modal_]').on('click', function(e) {
		e.preventDefault();
		var carouselId = $(this).attr('id').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/admin/home/carousel/'+carouselId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_carousel_modal').find('form');
				$form.attr('action','/admin/home/carousel/'+carouselId);
				$('#edit_carousel_title').attr('value',serverData.title);
				$('#edit_carousel_subtitle').attr('value',serverData.subtitle);
				$('#edit_carousel_button').attr('value',serverData.button);
				$('#edit_carousel_button_url').attr('value',serverData.button_url);

				$('#edit_carousel_modal').modal();
				$editIcon.html('<i class="fa fa-pencil"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	});

	// SERVICE GET AJAX REQUEST

	$('.service-select').on('change', function(e) {
		var serviceId = $(this).find(':selected').val();
		$.ajax({
			url: '/admin/home/services/'+serviceId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#service-form');
				$form.attr('action', '/admin/home/services/'+serviceId)
				$('#edit_service_title').attr('value',serverData.title);
				$('#edit_service_description').html(serverData.description);

				$('#edit_service_title').prop('disabled',false);
				$('#edit_service_description').prop('disabled',false);

				$('#service-preview i').addClass('fa '+serverData.icon);
				$('#service-preview h2').html(serverData.title);
				$('#service-preview p').html(serverData.description);
				$('#service-preview').removeClass('hidden');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})

	// SERVICE EDIT AJAX REQUEST
	$('#service-form').on('submit', function(e) {
		e.preventDefault();
		var serviceId = $('.service-select').find(':selected').val();
		$('#service-form button').html('<i class="fa fa-spinner fa-pulse"></i>');
		$formData = $('#service-form').serialize();

		$.ajax({
			url: '/admin/home/services/'+serviceId,
			dataType: 'json',
			type: 'put',
			data: $formData
		})
			.done(function(serverData) {
				$('#service-form button').html('<i class="fa fa-check"></i> Salvato!');
				setTimeout(function(){$('#service-form button').html('Salva')}, 5000);
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})

	// SERVICE LIVE PREVIEW

	$('#edit_service_title').keyup(function() {
		$('#service-preview h2').html($(this).val());
	})

	$('#edit_service_description').keyup(function() {
		$('#service-preview p').html($(this).val());
	})

}

$(document).ready(ready);
$(document).on('page:load',ready);
