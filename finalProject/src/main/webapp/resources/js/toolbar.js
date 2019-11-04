
			var imgNamesArr = new Array();
		
			var imgNum = 0;
			var imgCount = 1;
			$('input[name="dealType"]').change(function () {
				if ($(this).val() == 2) {
					$('input[name="dealType2"]').removeAttr("disabled");
				} else {
					$('input[name="dealType2"]').attr("disabled", "true");
				}
			});
			 function TintsetImg(value) {
				
				var imgname = "";
				var form = $('#imgAjax')[0];
				var formData = new FormData(form);

				$.ajax({
							url : "insertImg.ud",
							type : "POST",
							processData : false,
							contentType : false,
							data : formData,
							success : function(data) {
								console.log(data.imgName);
								$("#insertField").focus();
								document.execCommand('insertHTML',false,"<img src='/evening/resources/textImgs/"+data.imgName+"' name="+data.imgName+" id='textImgs'>");
								$("#insertField").focus();
								imgNamesArr[imgNum] = data.imgName;
								imgNum++;
							}
						});
				imgCount++;
			

			}; 

			$('html').click(function (e) {
				if (!$(e.target).hasClass('font-style-bar') && !$(e.target).hasClass('btn-1')) {
					$('.inFontTag').removeClass('on');
				}
				if (!$(e.target).hasClass('font-size-bar') && !$(e.target).hasClass('fsz_btn')) {
					$('.inSizeTag').removeClass('on');
				}

				if (!$(e.target).is('.ftC, .colorPicker, .twod, .oned, .ftc-btn, .selectC, .tcimg ')) {
					$('.font-C').removeClass('on');
				}

				if (!$(e.target).is('.text-sort-bar, .ts_btn, .ts_img')) {
					$('.textSort').removeClass('on');
				}
				if (!$(e.target).is('.int-sort-bar, .is_btn,.is_img')) {
					$('.intSort').removeClass('on');
				}
				if (!$(e.target).is('#ivideo ,.int-video-bar, #urlInput,.inVideo *' )) {
					$('.inVideo').removeClass('on');
				}
				
			});

			$('.fs_btn').on("click", function () {
				$('.inFontTag').toggleClass('on');
			});

			$('.fsz_btn').on("click", function () {
				$('.inSizeTag').toggleClass('on');
			});
			$('.ts_btn').on("click", function () {
				$('.textSort').toggleClass('on');
			});
			$('.is_btn').on("click", function () {
				$('.intSort').toggleClass('on');
			});

			$('.ftC').on("click", function () {
				$('.font-C').toggleClass('on');
			});
			$('.insertVideo').on("click", function () {
				$('.inVideo').toggleClass('on');
			});

			$('#rgbValue').bind("DOMSubtreeModified", function () {
				$('.selectC').css('background-color', $('#rgbValue').text());
			});


			document.execCommand('styleWithCSS', false, true);
			document.execCommand('insertBrOnReturn', false, true);
			function textOptionBtn1(v1, v2, v3) {
				document.execCommand(v1, v2, v3);
			};

			function textOptionBtn2(v1, v2, v3) {
				if (v3 == "") {
					document.execCommand(v1, v2, null);
				} else {
					document.execCommand(v1, v2, v3);
				}
			};

			$(document).ready(function () {
				$("#insertField").focus();

				$('.fontM').click(function () {
					textOptionBtn1($(this).attr('id'), false, true);
					$("#insertField").focus();
				});
				$('.fontM2').click(function () {

					textOptionBtn2($(this).attr('id'), false, $(this).attr('value'));
					$("#insertField").focus();
				});
				$('.fontM3').click(function () {
					// textOptionBtn2($(this).attr('id'), true, true);
					document.execCommand($(this).attr('id'));
					window.getSelection().focusNode.parentElement.closest('ol').style.listStyleType = $(this).attr('value');
					$("#insertField").focus();
				});
				
				$('.fontM4').click(function () {
					$("#insertField").focus();
					let regex = /(http|https):\/\/www.youtube.com/
					var vURL = ($('#urlInput').val().replace('watch?v=','embed/'))+'?&wmode=opaque';
					if(regex.test(vURL)){
						document.execCommand('insertHTML',false,
								"<iframe width='640' height='360' src='"+vURL+"' frameborder='0' allowfullscreen='' class='fr-draggable'></iframe>");
						$("#insertField").focus();
					}else{
						alert('정확하지 않은 url입니다.');
						
					}
					
				});

				$('.ftc-btn').click(function () {
					textOptionBtn2('foreColor', false, $('#rgbValue').text());
					$("#insertField").focus();
					console.log($('#rgbValue').text());
				});

				$('.insertImg').click(function () {
					$('#trImgFile').click();
				});
				

				function trInputChange(value) {
					console.log(value);

				};

			});
			