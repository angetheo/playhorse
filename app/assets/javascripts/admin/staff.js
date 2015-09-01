// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_staff_ready;

admin_staff_ready = function() {

	// PRODUCT MODAL AJAX
	$('.edit_staff').on('click', function(e) {
		e.preventDefault();
		var $staffId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/staff/'+$staffId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_staff_modal').find('form');
				$form.attr('action','/staff/'+$staffId);
				$('#edit_staff_division option').prop('selected', false)
                   	.filter('[value="'+serverData.division+'"]')
                   	.prop('selected', true);
				$('#edit_staff_name').attr('value', serverData.name);
				$('#edit_staff_role').attr('value', serverData.role);
				$('#edit_staff_order').attr('value', serverData.order);
				$('#edit_staff_phone').attr('value', serverData.phone);
				$('#edit_staff_mail').attr('value', serverData.mail);
				$('#edit_staff_facebook').attr('value', serverData.facebook);
				$('#edit_staff_linkedin').attr('value', serverData.linkedin);

				$('#edit_staff_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_staff_ready);
$(document).on('page:load',admin_staff_ready);