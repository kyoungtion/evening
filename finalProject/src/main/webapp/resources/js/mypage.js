$(document).ready(function(){

    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    })

    $('.subject').on('click', function(){
    	location.href="#";
    });
});

// 게시글 검색
$(function(){
		
	$('#searchBtn').click(function(){
		var keyword = encodeURIComponent($('#searchText').val());
		var category = encodeURIComponent($('#category').val());
		var searchfor = encodeURIComponent($('#searchfor').val());
		if(keyword == ""){
			alert('검색어를 입력해주세요.');
		} else {
			var uri = "gesipanSearch.ge?searchfor="+searchfor+"&keyword="+keyword+"&category="+category;
			var enc = encodeURI(uri);
			//location.href="gesipanSearch.ge?searchfor="+searchfor+"&keyword="+keyword+"&category="+category;
			location.href=enc;
		}
	});
});

// 게시판 조회
$(function(){
	$('#titlespan').click(function(){
		var category = $('#category').val();
		location.href="gList.ge?category="+category;
	})
})

