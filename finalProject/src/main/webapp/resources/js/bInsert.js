	function shumnailImgChange(value) {
		if (value.files && value.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {

				$('#smImgTag').attr('src', e.target.result);

			}
			reader.readAsDataURL(value.files[0]);

		}
	};
	$('input[name="SG_DEAL"]').change(function () {
		if ($(this).val() == "DELIVERY") {
			$('input[name="SG_DELIVERY"]').removeAttr("disabled");
			$('#radios2').fadeOut(300);
			$('#radios').fadeIn(300);
		} else {
			$('#radios').fadeOut(300);
			$('#radios2').fadeIn(300);
			$('input[name="SG_DELIVERY"]').attr("disabled", "true");
		}
	});
	function saveBtn() {
		var deletImgArr = new Array();
		var imgArray = $('#insertField img');
		$('#textForm').val(document.getElementById('insertField').innerHTML);			
		
		for (var i = 0; i < imgArray.length; i++) {
			deletImgArr[i] = imgArray.eq(i).attr('name');
		}
		$('#imgNames').val(imgNamesArr);
		$('#deletImg').val(deletImgArr);
	 	$('#insertForm').submit();
	};
	
	function shumnailImg() {
		$('#smImg').click();
	};