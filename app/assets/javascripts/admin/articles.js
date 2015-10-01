// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_article_ready;

admin_article_ready = function() {

	// ARTICLE MODAL AJAX
	$('.edit_article').on('click', function(e) {
		e.preventDefault();
		var $articleId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/articles/'+$articleId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_article_modal').find('form');
				$form.attr('action','/articles/'+$articleId);
				$('#edit_article_title').attr('value',serverData.title);
        $('#edit_article_subtitle').attr('value',serverData.subtitle);
        $('#edit_article_content').val(serverData.content);

				$('#edit_article_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_article_ready);
$(document).on('page:load',admin_article_ready);