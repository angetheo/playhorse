// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_product_ready;

admin_product_ready = function() {

	// PRODUCT MODAL AJAX
	$('.edit_product').on('click', function(e) {
		e.preventDefault();
		var $productId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/products/'+$productId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_product_modal').find('form');
				$form.attr('action','/products/'+$productId);
				$('#edit_product_category option').prop('selected', false)
                   	.filter('[value="'+serverData.category+'"]')
                   	.prop('selected', true);
                $('#edit_product_type option').prop('selected', false)
                   	.filter('[value="'+serverData.product_type+'"]')
                   	.prop('selected', true);
				$('#edit_product_name').attr('value', serverData.name);
				$('#edit_product_description').text(serverData.description);

				$('#edit_product_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_product_ready);
$(document).on('page:load',admin_product_ready);