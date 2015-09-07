// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_mares_ready;

admin_mares_ready = function() {

	// HORSE MODAL AJAX
	$('.edit_mare').on('click', function(e) {
		e.preventDefault();
		var $mareId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/mares/'+$mareId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_mare_modal').find('form');
				$form.attr('action','/mares/'+$mareId);
				$('#edit_mare_name').attr('value',serverData.name);
				$('#edit_mare_description').text(serverData.description);

				$('#edit_mare_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_mares_ready);
$(document).on('page:load',admin_mares_ready);