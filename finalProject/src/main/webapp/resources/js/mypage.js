$(document).ready(function(){

   /* $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
        
    })

    $('.subject').on('click', function(){
    	location.href="#";
    });*/
});

//마이페이지 클릭 리프레시
function clickRefresh(){
	$('#tabs').tabs();
	var tabs = $('#tabs').tabs({
		activate: function(event, ui){
			var active = $('#tabs').tabs('option', 'active');
			$.cookie('activeTabIndex', active);
		}
	});
	
	var activeTabIndex = $.cookie('activeTabIndex');
	
	if(activeTabIndex != undefined){
		tabs.tabs('option','active',0);
	}
}

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

$(function(){
	
	$('#searchMemberBtn').click(function(){
		var keyword = encodeURIComponent($('#searchText').val());
		var searchfor = encodeURIComponent($('#searchfor').val());
		if(keyword == ""){
			alert('검색어를 입력해주세요.');
		} else {
			var uri = "memberSearch.ad?searchfor="+searchfor+"&keyword="+keyword;
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
});

// 결제 내역 검색
$(function(){
	
	$('#searchBtn2').click(function(){
		var keyword = encodeURIComponent($('#searchText').val());
		var searchfor = encodeURIComponent($('#searchfor').val());
		if(keyword == ""){
			alert('검색어를 입력해주세요.');
		} else {
			var uri = "paylistSearch.py?searchfor="+searchfor+"&keyword="+keyword;
			var enc = encodeURI(uri);
			//location.href="gesipanSearch.ge?searchfor="+searchfor+"&keyword="+keyword+"&category="+category;
			location.href=enc;
		}
	});
});


