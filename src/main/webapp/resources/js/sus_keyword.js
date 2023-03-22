/**
 * 추천검색어, 인기검색어, 최근검색어
 */
 
function init() {

	$(".keyword_wrap").hide();
	
	sus_keyword();
	pop_keyword();
	
		
}//init()-end

/**
 * 추천검색어
 */
function sus_keyword(){
	
	$("#autoComplete, .sug_keyword").on("click", function(){

		$(".keyword_box").empty();  //이전에 남아있는 데이터 지우기
		$(".keyword_box").remove();
		$(".btn_keyword").removeClass("active");
		$(".sug_keyword").addClass("active");

		$.ajax({
	       url : "/ajax/autocomplete",  
	       type : "GET",
		   dataType : 'json',
	       success : function(data) {
	            //console.log("통신성공");
				//console.log(data);
				
	            str = '<div class="sug_keyword keyword_box">';
	            str += '<ul>';
				$.each(data , function(i){
	                str += '<li onclick="method(' +'\'' + data[i].k_keyword +'\'' + ')" class="keyword_item pb-3 pt-3">' + data[i].k_keyword + '</li>'
	            });
				str += '</ul></div>';

				$(".keyword_wrap").show();
	        	$('.keyword_wrap').append(str);
	            
	        },
	 		error: function( request, status, error ){
		    	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		   }
	     });//ajax-end
	     
	})
}//sus_keyword()-end

/**
 * 인기검색어
 */	
function pop_keyword() {
	
	$(".pop_keyword").on("click", function(){
	
		$(".keyword_box").empty();  //이전에 남아있는 데이터 지우기
		$(".keyword_box").remove();
		$(".btn_keyword").removeClass("active");
		$(".pop_keyword").addClass("active");
	
		$.ajax({
	       url : "/ajax/autocomplete_pop",  
	       type : "GET",
		   dataType : 'json',
	       success : function(data) {
	            console.log("통신성공");
				//console.log(data);
				
	            str = '<div class="pop_keyword keyword_box"><ul>';
				$.each(data , function(i){
	                str += '<li onclick="method(' +'\'' + data[i].k_keyword +'\'' + ')" class="keyword_item pb-3 pt-3">' + data[i].k_keyword + '</li>'
	            });
				str += '</ul></div>';

	            $('.keyword_wrap').show();
	        	$('.keyword_wrap').append(str);
	            
	        },
	 		error: function( request, status, error ){
		    	alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
		   }
	     });
	})
}
/**
 * 최근검색어
 */
function recent_keyword(){
	
	console.log("recent_keyword 함수 실행");
	
	const form = $('#keyword_form');
	const ul = $('#ul');
	const button = $('#button');
	const input = $('#autoComplete');

	let itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];

	localStorage.setItem('items', JSON.stringify(itemsArray));

	const data = JSON.parse(localStorage.getItem('items'));

	const liMaker = function(text) {
		const li = $('li.recent_key').html(text);
		
		const cur_key = li.classList;
		
		/*if(cur_key == 'recent_key'){
			li.on("click", function(){
				
				input.value = text;
				form.submit();
			
			});
		}*/
		
		ul.append(li);
	}

	form.on('submit', function (e) {
		e.preventDefault();
		console.log("폼이벤트일어남");
		itemsArray.push(input.value);
		localStorage.setItem('items', JSON.stringify(itemsArray));
		liMaker(input.value);
		input.val("");
	});

	data.forEach(item => {
		liMaker(item);
	});

	/*button.addEventListener('click', function () {
	
		localStorage.clear();
		while (ul.firstChild) {
		ul.removeChild(ul.firstChild);
		}
	});   */  
	
}//recent_keyword()-end
	 
	 
	
