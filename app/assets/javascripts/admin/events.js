// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_events_ready;

admin_events_ready = function() {

	$('.datepicker').datepicker({
		dateFormat: 'yy-mm-dd'
	});

	// COMMUNICATION AJAX
	$('#communication-form').on('submit', function(e) {
		e.preventDefault();

		var formData = $(this).serialize();

		$.ajax({
			url: '/communications',
			dataType: 'json',
			data: formData,
			type: 'put'
		})
			.done(function(serverData) {
				console.log(serverData);
				$('.edit-success').fadeIn();
				setTimeout(function(){$('.edit-success').fadeOut()}, 3000);
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			});
	});

	// EVENT MODAL AJAX
	$('.edit_event').on('click', function(e) {
		e.preventDefault();
		var $eventId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/events/'+$eventId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_event_modal').find('form');
				$form.attr('action','/events/'+$eventId);
				$('#edit_event_date').attr('value',serverData.date);
        		$('#edit_event_name').attr('value',serverData.name);

				$('#edit_event_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_events_ready);
$(document).on('page:load',admin_events_ready);