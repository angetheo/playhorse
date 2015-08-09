var ready;
ready = function() {

	new WOW().init();

	/*----------------------------/
	/* TOP BAR COUNTRY-SELECTION
	/*---------------------------*/

	//comment code below if you want to treat the selector as link
	if($('.country-selector').length > 0) {
		$('.country-selector a').click( function(e) {
			$flagImg = $(this).clone();

			$btnToggle = $(this).parents('ul').siblings('.dropdown-toggle');
			$btnToggle.html('').append($flagImg).append(' <span class="caret"></span>');
		});
	}


	/*----------------------------/
	/* HERO UNIT
	/*---------------------------*/

	if($('#carousel-hero-animated').length > 0) {
			$('#carousel-hero-animated').carousel({
				interval: 4000
			})
			.on( 'slide.bs.carousel', function(slide) {
			$(this).find('.item .hero-right img').removeClass('bounceOutRight');
			$(this).find('.item.active .hero-right img').addClass('bounceOutRight');
		});
	}


	/*----------------------------/
	/* NAVBAR
	/*---------------------------*/

	if($('.navbar-fixed-top.shrinkable').length > 0) {
		$('.wrapper').css('padding-top', 97);

		$(window).scroll(function() {
			if($(document).scrollTop() > 300) {
				$('.navbar-fixed-top').addClass('shrink-active');
			}else {
				$('.navbar-fixed-top').removeClass('shrink-active');
			}
		});
	}


	/*----------------------------/
	/* CAROUSEL
	/*---------------------------*/

	if($('.slick-carousel').length > 0) {
		$('.recent-works.slick-carousel .container').slick({
			dots: true,
			slidesToShow: 3,
			cssEase: 'ease-in',
			prevArrow: '<button type="button" data-role="none" class="btn slick-prev">Previous</button>',
			nextArrow: '<button type="button" data-role="none" class="btn slick-next">Next</button>',
			responsive: [
				{
					breakpoint: 993,
					settings: {
						slidesToShow: 2
					}
				},
				{
					breakpoint: 481,
					settings: {
						slidesToShow: 1
					}
				}
			]
		});

		$('.testimonial').slick({
			speed: 500,
			fade: true,
			prevArrow: '<button type="button" data-role="none" class="btn slick-prev">Previous</button>',
			nextArrow: '<button type="button" data-role="none" class="btn slick-next">Next</button>',
		});

		$('#carousel-hero .carousel-inner').slick({
			speed: 800,
			dots: true,
			fade: true,
			autoplay: true,
			autoplaySpeed: 2500,
			prevArrow: '<button type="button" data-role="none" class="carousel-control left slick-prev">Previous</button>',
			nextArrow: '<button type="button" data-role="none" class="carousel-control right slick-next">Next</button>',
		});
	}
	

	/*----------------------------/
	/* PARALLAX
	/*---------------------------*/

	if($('.parallax').length > 0) {
		$('.parallax').stellar();
	}


	/*----------------------------/
	/* PORTFOLIO ISOTOPE INIT
	/*---------------------------*/

	if($('.portfolio-isotope').length > 0) {
		$container = $('.portfolio-isotope');

		var $isoObj = $container.isotope({
			itemSelector: '.portfolio-item',
			layoutMode: 'fitRows'
		});

		$container.parent().height($container.height());

		$('.portfolio-item-filters a').click( function(e) {
			e.preventDefault();

			var selector = $(this).attr('data-filter');
			$container.isotope({
				filter: selector
			});

			$container.parent().height($container.height());

			$('.portfolio-item-filters a').removeClass('active');
			$(this).addClass('active');
		});
	}

	if($('.media-carousel').length > 0) {
		$('.media-carousel').slick({
			dots: true,
			prevArrow: '<button type="button" data-role="none" class="btn slick-prev">Previous</button>',
			nextArrow: '<button type="button" data-role="none" class="btn slick-next">Next</button>'
		});
	}


	/*----------------------------/
	/* FITVIDS
	/*---------------------------*/

	if($('.featured-video').length > 0) {
		$('.featured-video').fitVids();
	}


	/*----------------------------/
	/* BOOTSTRAP MULTISELECT
	/*---------------------------*/

	if($('.multiselect').length > 0) {
		$('.multiselect').multiselect();
	}

	/*--------------------------------/
	/* SIDEBAR NAVIGATION TOGGLE
	/*-------------------------------*/

	$('.submenu-toggle').click( function() {
		if(!$(this).parent().hasClass('active')) {
			$(this).parent().addClass('active');
		} else {
			$(this).parent().removeClass('active');
		}
	});

	$('.sidebar-nav a').click( function() {
		$('.sidebar-nav a').removeClass('current');
		$(this).addClass('current');
	});

	/*--------------------------------/
	/* RESPONSIVE CALENDAR
	/*-------------------------------*/

	$('.responsive-calendar').responsiveCalendar({
		translateMonths: ['Gennaio','Febbraio','Marzo','Aprile','Maggio','Giugno','Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre']
	});


	/*--------------------------------/
	/* BOOTSTRAP TOOLTIP
	/*-------------------------------*/

	if($('[data-toggle="tooltip"]').length > 0) {
		$('[data-toggle="tooltip"]').tooltip({
			container: "body"
		});
	}


	/*--------------------------------/
	/* BOOTSTRAP POPOVER
	/*-------------------------------*/

	if($('.btn-popover').length > 0) {
		$('.btn-popover').popover();
	}

	if($('.demo-popover').length > 0) {
		$('.demo-popover #popover-title').popover({
			html: true,
			title: '<i class="fa fa-info-circle"></i> Popover Title',
			content: 'This popover has title and support HTML content. Quickly implement process-centric networks rather than compelling potentialities. Objectively reinvent competitive technologies after high standards in process improvements. Phosfluorescently cultivate 24/365.'
		});

		$('.demo-popover #popover-hover').popover({
			html: true,
			title: '<i class="fa fa-info-circle"></i> Popover Title',
			trigger: 'hover',
			content: 'Activate the popover on hover. Objectively enable optimal opportunities without market positioning expertise. Assertively optimize multidisciplinary benefits rather than holistic experiences. Credibly underwhelm real-time paradigms with.'
		});
	}


	/*--------------------------------/
	/* MASKED INPUT
	/*-------------------------------*/

	if($('#masked-input-demo').length > 0) {
		$('#phone').mask('(999) 999-9999');
		$('#phone-ex').mask('(999) 999-9999? x99999');
		$('#tax-id').mask('99-9999999');
		$('#ssn').mask('999-99-9999');
		$('#product-key').mask('a*-999-a999');
	}

	
	/*--------------------------------/
	/* DATE PICKER
	/*-------------------------------*/

	if($('#date-picker-demo').length > 0) {
		var dtp = $('#datepicker').datepicker()
			.on('changeDate', function(e) { dtp.datepicker('hide'); });

		$('#daterangepicker').daterangepicker({
			timePicker: true,
			timePickerIncrement: 10,
			format: 'MM/DD/YYYY h:mm A',
			applyClass: "btn-primary"
		});
	}


	/*--------------------------------/
	/* TEXTAREA WITH COUNTER
	/*-------------------------------*/

	if($('#textarea-demo').length > 0) {
		var textMax = 99;
		
		$('.js-textarea-help span').html(textMax + ' characters remaining');

		$('.textarea-counting').keyup(function() {
			var textLength = $('.textarea-counting').val().length;
			var textRemaining = textMax - textLength;

			$('.js-textarea-help span').html(textRemaining + ' characters remaining');
		});
	}


	/*--------------------------------/
	/* PIE CHART
	/*-------------------------------*/

	if($('.pie-chart').length > 0) {
		$('.pie-chart').easyPieChart({
			size: 180,
			barColor: '#406DA4',
			trackColor: '#eaeaea',
			scaleColor: false,
			lineWidth: 2,
			lineCap: "square",
			animate: 2000
		});
	}

	/*--------------------------------/
	/* FILE BUTTON STYLING
	/*-------------------------------*/

	$('.btn-file :file').on('change', function() {
	    var $input = $(this).parents('.input-group').find(':text');
	    $input.attr('value',$(this).val().split(/[\\]+/).pop());
  	});

	
	/*-----------------------------------/
	/* CONTACT FORM
	/*----------------------------------*/

	if($('#contact-form').length > 0) {
		$('#contact-form').parsley();
	}


	/*-----------------------------------/
	/* MISC
	/*----------------------------------*/

	// fix portfolio item
	$('.portfolio-item').on('click', function() {
		// do nothing, somehow this triggering portfolio overlay on mobile Safari
	});

	// indicate mobile browser
	var ua = navigator.userAgent,
	isMobileWebkit = /WebKit/.test(ua) && /Mobile/.test(ua);

	if (isMobileWebkit) {
		$('html').addClass('mobile');
	}

}

$(document).ready(ready)
$(document).on('page:load', ready);

