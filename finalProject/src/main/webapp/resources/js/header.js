		var scla = window.scrollY || document.documentElement.scrollTop;
		var before = scla;
		$(document).scroll(function (e) {
			scla = window.scrollY || document.documentElement.scrollTop;

			if (scla > 15) {
				$('.ebHeader').addClass('scroll');

				if (before < scla && scla > 50) {
					$('.ebHeader').addClass('scroll2');
					$('.nav_sub').removeClass('on');
					console.log('up');
				} else {
					$('.ebHeader').removeClass('scroll2')
				}
				// else {
				//     $('.ebHeader').removeClass('scroll2');
				//     console.log('down');
				// }
			} else {
				$('.ebHeader').removeClass('scroll');
				$('.ebHeader').removeClass('scroll2')
			}
			before = scla;
		});

		$('.catalog-tap').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
		});

		$('.catalog-ul li').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
		});
		$('.nav_sub').hover(function () {
			$(this).addClass('on');
			$(this).siblings().removeClass('on');
		}, function () {
			$(this).removeClass('on');
		});
