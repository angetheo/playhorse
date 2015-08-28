// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var admin_horses_ready;

admin_horses_ready = function() {

	// HORSE MODAL AJAX
	$('.edit_horse').on('click', function(e) {
		e.preventDefault();
		var $horseId = $(this).attr('href').replace( /^\D+/g, '');
		var $editIcon = $(this);
		$editIcon.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/horses/'+$horseId,
			dataType: 'json'
		})
			.done(function(serverData) {
				var $form = $('#edit_horse_modal').find('form');
				$form.attr('action','/horses/'+$horseId);
				$('#edit_horse_name').attr('value',serverData.name);
        		$('#edit_horse_father').attr('value',serverData.father);
        		$('#edit_horse_mother').attr('value',serverData.mother);
        		$('#edit_horse_year_of_birth').attr('value',serverData.year_of_birth);
        		$('#edit_horse_nation').attr('value',serverData.nation);
        		$('#edit_horse_category').attr('value',serverData.category);
        		$('#edit_horse_description').text(serverData.description);
        		$('#edit_horse_cv_url').attr('value',serverData.cv_url);
        		$('#edit_horse_video').attr('value',serverData.video);

				$('#edit_horse_modal').modal();
				$editIcon.html('<i class="fa fa-edit"></i>');
			})
			.fail(function(a, b, c) {
				console.log(a, b, c);
			})
	})
}

$(document).ready(admin_horses_ready);
$(document).on('page:load',admin_horses_ready);