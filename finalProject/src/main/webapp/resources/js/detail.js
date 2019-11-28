
	var empty = Boolean($('#empty').val());
	
	var userId=$('#userId').val();
	var nickName=$('#nickName').val();
	var replyA='<div id="replyAdd" class="comment" style="background: lightgray;"><div class="comment2"></div><div style="padding-left: 60px; "><textarea id="replyArea2"></textarea><button class="replyAddBtn" onclick="test(this);" value=';
	var replyA2='>댓글쓰기</button></div></div>';
	var replyB=1;
	var replyUpNum=0;
	var replyUplb="";
	var replyUpTag="";
	
	$('#replyTag').click(function (e) {		
		if(replyUpNum!=0){
		if (!$(e.target).is('div[name='+replyUpNum+'],div[name="'+replyUpNum+'"] *,div[name='+replyUpNum+'] button' ) && e.target.value!=replyUpNum) {
			replyUpTag.html(replyUplb);
			replyUpNum=0;
			replyUplb="";
			replyUpTag="";
		}
		}

	}); 
	$(document).ready(function() {
			var click = 0;
			$("#replyOpen").on("click", function() {
				if (click == 0) {
				$('#replyOpen').html("댓글 닫기");
				$('#replyTag').css("height", "auto");
				getReplyList();
				click = 1;
				} else {
					$('#replyOpen').html("댓글 보기");
					$('#replyTag').css("height", 70);
					click = 0;			
				}
			});
			/* 댓글 입력 */
			$('.replyBtn').on("click",function(){
				var REPLY_INFO=$('#replyArea').val().replace(/\n/gi,"<br>");
				var SG_ID=sgId;
				if(empty){
				var USER_ID=userId; 
				var NICKNAME=nickName;
				
				$.ajax({
		            url: "addReply.bo",
		            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:false,USER_ID:USER_ID,NICKNAME:NICKNAME},
		            type:"post",
		            success: function(data){
		               if(data=="success"){
		            	   getReplyList(); /* 댓글 조회 */
		            	   $("#replyArea").val("");
		               }
		            }
		        }); 
				}else{
					alert("로그인 후 이용해주세요.")
				}
			});
			
			if ($('input[name="dealType"]').val() == "DELIVERY") {
				$('#delivery').css("opacity", 1);
			} else {
				$('#delivery').css("opacity", 0);
			}
		});
		
	/* 대댓글 입력 */
	function test(a){
		var REPLY_INFO=$('#replyArea2').val().replace(/\n/gi,"<br>");
		var REPLY_ID=$(a).val();
		var SG_ID=sgId;
		var USER_ID=userId; 
		var NICKNAME=nickName;
		$.ajax({
            url: "addReply.bo",
            data: {REPLY_INFO:REPLY_INFO, SG_ID:SG_ID,add:true,REPLY_ID:REPLY_ID,USER_ID:USER_ID,NICKNAME:NICKNAME},
            type:"post",
            success: function(data){
               if(data=="success"){
            	   replyDel();
            	   getReplyList(); /* 댓글 조회 */		            	   
               }
            }
        }); 
	};
		function replyAdd(a){
			$('.replyAddForm').text("답글");
			$('.replyAddForm').attr("onclick","replyAdd(this)");
			$('#replyAdd').remove();
	
			$(a).text("닫기");
			$(a).attr("onclick","replyDel(this)");
			$(a).parent("div").parent("div").parent("div").after(replyA+$(a).val()+replyA2);
		};
		function replyDel(a){
			$('.replyAddForm').text("답글");
			$('.replyAddForm').attr("onclick","replyAdd(this)");
			$('#replyAdd').remove();
		};
		function replyDelete(a){
			var REPLY_ID=$(a).val();
			
			$.ajax({
	            url: "deleteReply.bo",
	            data: {REPLY_ID:REPLY_ID},
	            type:"post",
	            success: function(data){
	               if(data=="success"){
	            	   replyDel();
	            	   getReplyList(); /* 댓글 조회 */		   
	            	   $('#commentArea').html("");
	               }
	            }
	        }); 
		};
		function replyDeleteAdd(a){
			var REPLY_ID=$(a).val();			
			$.ajax({
	            url: "deleteReplyAdd.bo",
	            data: {REPLY_ID:REPLY_ID},
	            type:"post",
	            success: function(data){
	               if(data=="success"){
	            	   replyDel();
	            	   getReplyList(); /* 댓글 조회 */		   
	            	   $('#commentArea').html("");
	               }
	            }
	        }); 
		};
		function replyAddUpdate(id){
			$('#replyAdd').remove();
			var UpText=$('#'+$(id).val()).html().replace(/<br>/gi,"\n");
			var UpId=$(id).val();
			replyUpTag=$(id).parent("div");
			replyUpNum=$(id).parent("div").parent("div").attr('name');
			replyUplb=$(id).parent("div").html();
			 replyDel();
			$(id).parent("div").html('<textarea id="replyUpArea">'+UpText+'</textarea><button class="replyAddBtn" onclick="replyUpdateAjax(this);" value='+UpId+'>댓글 수정</button><div></div>');
		};
		function replyUpdate(id){
			var UpText=$('#'+$(id).val()).html().replace(/<br>/gi,"\n");
			var UpId=$(id).val();
			replyUpTag=$(id).parent("div").parent("div").parent("div");
			replyUpNum=$(id).parent("div").parent("div").parent("div").attr('name'); 
			replyUplb=$(id).parent("div").parent("div").parent("div").html();
			replyDel();
			$(id).parent("div").parent("div").parent("div").html('<div style="padding-left: 60px;"><textarea id="replyUpArea">'+UpText+'</textarea><button class="replyUpBtn" onclick="replyUpdateAjax(this);" value='+UpId+'>댓글 수정</button></div>');
		};
		function replyUpdateAjax(id){
			var REPLY_INFO=$('#replyUpArea').val().replace(/\n/gi,"<br>");
			var REPLY_ID=$(id).val();
			var page=$('.active').val();
			$.ajax({
	            url: "replyUpdate.bo",
	            data: {REPLY_INFO:REPLY_INFO,REPLY_ID:REPLY_ID},
	            type:"post",
	            success: function(data){
	               if(data=="success"){
	            	   getReplyList(page); /* 댓글 조회 */		            	   
	               }
	            }
	        }); 
		};
		 function getReplyList(page){
	         var SG_ID = sgId;
	         $.ajax({
	            url: "replyList.bo",
	            data: {SG_ID:SG_ID,page:page},
	            dataType: "json",
	            success: function(data){         
	               $tableBody = $('#commentArea');
	               $tableBody.html("");
	               	var t1;
	            	var t2;
	            	var t3;
	            	var t4;
	            	var t5;
	            	var t6;
	            	var t7;
	               if(data.rlist.length > 0){
	                  for(var i in data.rlist){
		                i=parseInt(i);
		                i2=parseInt(i)-1;
		                if(i>0){
				               if(data.rlist[i].REPLY_ADD!=data.rlist[i2].REPLY_ADD){
				            	   t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><img src="/evening/resources/img/replyIcon.png"><span>';
					               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
					               t3='</span></div><div><span>'+data.rlist[i].REPLY_DATE+'</span></div><div>';
					               t4='<button class="replyAddForm" onclick="replyAdd(this);" value=';
					               t5='>답글</button>';
					               t6='<button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
					               t7='</div></div></div>';
					           if((data.rlist[i].USER_ID)==userId && empty){
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t6+t7);				            	
					            }else if((data.rlist[i].USER_ID)!=userId && empty){
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t7);
				            	}else{
				                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t7);
				            	}
				               }	                 
				               if(data.rlist[i].REPLY_ADD==data.rlist[i2].REPLY_ADD){
					            	t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment" style="background: lightgray;"><div class="comment2"></div><div style="padding-left: 60px; width: 90%;"><div><img src="/evening/resources/img/replyIcon.png"><span>';
					            	t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
					            	t3='</span></div><div><span>'+data.rlist[i].REPLY_DATE+'</span></div>';
					            	t4='<button type="button" onclick="replyAddUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDeleteAdd(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
					            	t5='</div></div>';
		                		  if((data.rlist[i].USER_ID)==userId && empty){
		                		  $('div[name='+data.rlist[i].REPLY_ADD+']').after(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+t5);
						            }else{
		                		  $('div[name='+data.rlist[i].REPLY_ADD+']').after(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t5);
					            	}
				               }
	                	  }else{
	                		   t1='<div name="'+ data.rlist[i].REPLY_ID+'" class="comment"><div style=" width: 95%;"><div><img src="/evening/resources/img/replyIcon.png"><span>';
				               t2='</span></div><div><span id="'+data.rlist[i].REPLY_ID+'">';
				               t3='</span></div><div><span>'+data.rlist[i].REPLY_DATE+'</span></div><div>';
				               t4='<button class="replyAddForm" onclick="replyAdd(this);" value=';
				               t5='>답글</button>';
				               t6='<button onclick="replyUpdate(this);" value="'+data.rlist[i].REPLY_ID+'">수정</button><button onclick="replyDelete(this);" value="'+data.rlist[i].REPLY_ID+'">삭제</button>';
				               t7='</div></div></div>';
				               if((data.rlist[i].USER_ID)==userId && empty){
			                	 $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t6+t7);				            	
				               }else if((data.rlist[i].USER_ID)!=userId && empty){
				            	   $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t4+data.rlist[i].REPLY_ID+t5+t7);
				               }else{
				            	   $tableBody.append(t1+decodeURIComponent(data.rlist[i].NICKNAME.replace(/\+/g, " "))+t2+decodeURIComponent(data.rlist[i].REPLY_INFO.replace(/\+/g, " "))+t3+t7);
			            	}
	                	  }
	                  }
	               }
	               
	               $('.pagination').html("");
	               if(data.pi.maxPage>0){
		            	   
		               if(data.pi.currentPage<=1){
		               $('.pagination').append('<li class="disabled"><a>&laquo;</a></li>');	            	 
		               }
						if(data.pi.currentPage>1){
							$('.pagination').append('<li><a onclick="getReplyList('+(data.pi.currentPage-1)+')">&laquo;</a></li>');
						}
						for(var p=data.pi.startPage; p<=data.pi.endPage; p++){
							if(p == data.pi.currentPage){
								$('.pagination').append('<li class="active" value='+p+'><a>'+ p +'</a></li>');
							}
							if(p != data.pi.currentPage){							
								$('.pagination').append('<li><a onclick="getReplyList('+p+')">'+ p +'</a></li>');
							}
						}
						if(data.pi.currentPage >= data.pi.maxPage){
							$('.pagination').append('<li class="disabled"><a href="#">&raquo;</a></li>');
						}
						if(data.pi.currentPage < data.pi.maxPage){
							$('.pagination').append('<li><a onclick="getReplyList('+(data.pi.currentPage+1)+')">&raquo;</a></li>');
						}
	               }
	            }
	         });
	      };
	