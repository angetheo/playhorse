// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_faq_ready;

admin_faq_ready = function() {

	// ARTICLE MODAL AJAX
	$('.edit_faq').on('click', function(e) {
		e.preventDefault();
		var $faqId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/faq/'+$faqId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_faq_modal').find('form');
				$form.attr('action','/faq/'+$faqId);
				$('#edit_faq_category').attr('value',serverData.category);
        		$('#edit_faq_question').attr('value',serverData.question);
        		$('#edit_faq_answer').text(serverData.answer);

				$('#edit_faq_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_faq_ready);
$(document).on('page:load',admin_faq_ready);