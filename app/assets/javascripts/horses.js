// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var horses;

horses = function() {
	$('.horse-details').on('click', function(e) {
		e.preventDefault();
		var horseId = $(this).attr('id');
		var $this_button = $(this);
		$this_button.html('<i class="fa fa-spinner fa-pulse"></i>');

		$.ajax({
			url: '/horses/'+horseId
		})
			.done(function(serverData) {
				// FIND THE FIELDS IN THE MODAL
				$modal = $('#horse_details').find('.modal-body');
				// CHANGE THE VALUE OF THE FIELDS WITH THE DATA FROM THE SERVER
				$modal.find('#horse_picture').attr('src', serverData.picture);
				$modal.find('#horse_name').html(serverData.name);
				$modal.find('#horse_father').html(serverData.father);
				$modal.find('#horse_mother').html(serverData.mother);
				$modal.find('#horse_year_of_birth').html(serverData.year_of_birth);
				$modal.find('#horse_nation').html(serverData.nation);
				$modal.find('#horse_description').html('"'+serverData.description+'"');

				if (serverData.cv_url === "") {
					$cv_url = $modal.find('#horse_cv_url')
					$cv_url.attr('disabled','disabled');
					$cv_url.html('Non disponibile');
				} else {
					$modal.find('#horse_cv_url').attr('href',serverData.cv_url);
				}

				if (serverData.video === "") {
					$modal.find('iframe').replaceWith('<p>Video non disponibile.</p>');
				} else {
					$modal.find('iframe').attr('src', serverData.video+'?showinfo=0&rel=0&controls=0');
				}
				// OPEN THE MODAL
				$('#horse_details').modal();
				$this_button.html('Maggiori info');
			})
	});
}

$(document).ready(horses);
$(document).on('page:load',horses);
