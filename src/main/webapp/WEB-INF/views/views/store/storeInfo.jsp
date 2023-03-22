<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
		
		<style type="text/css">
			#map {
				width: 300px;
				height: 300px;
			}
		</style>
		<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "replyUpdateView?b_no=${read.b_no}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&r_no="+$(this).attr("data-r_no");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "replyDeleteView?b_no=${read.b_no}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&r_no="+$(this).attr("data-r_no");
			});
			
			
		})
		</script>
	</head>
	<body>
	  
	  <section class="store_info_img">
	  	<c:forEach var="image" items="${imageList}">
      	<img src="${ctxpath}/resources/imgs/${image.f_STORED_FILE_NAME}" width="300" height="300">
      	</c:forEach>
	  </section>
	  
	 
	  
	  <section class="store_info flex">
	  
	  	<!-- 컨텐츠 영역 -->
	  	<div class="content">
	  		<div class="box">
	  		
	  			<div class="store_name">${storeInfo.s_name}${ratingAvg}</div>
	  		
		  		<table>
			  		<tr>
				      <td class="title">가게 주소 </td>
				      <td>${storeInfo.s_addr}&nbsp;${storeInfo.s_addr_detail}</td>
				    </tr>
			    
				    <tr>
				      <td class="title">전화 번호 </td>
				      <td>${storeInfo.s_tel}</td>
				    </tr>
			    
				    <tr>
				      <td class="title">음식 종류</td>
				      <td>${storeInfo.s_type}</td>
				    </tr>
			    
				    <tr>
				      <td class="title">웹사이트</td>
				      <td><a href="${storeInfo.s_site}">${storeInfo.s_site}</a></td>
				    </tr>
			    
				    <tr>
				      <td class="title">가격대</td>
				      <td>${storeInfo.s_price_ref}</td>
				    </tr>
			    
				    <tr>
				      <td class="title">메뉴</td>
				      <td>${storeInfo.s_menu}</td>
				    </tr>
			    </table>
	  		</div>
	  	</div>
	  	
	  	<!-- 지도영역 -->
	  	<div class="map_wrap">
	  		<div id="map" style="width:300px;height:300xpx;"></div>

		      <!-- 지도 스크립트 -->
		      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c503ae464c1b4bb17ef154fbb125a3&libraries=services"></script>
			  
			  <script type="text/javascript">
			  let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		      mapOption = { 
		          center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		          level: 3 // 지도의 확대 레벨
		      };
		     
		     let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		     
		     let addr = "${storeInfo.s_addr}";
		     
		     let clickedOverlay = null;
		     
		     // 마커 이미지의 이미지 주소입니다
		     let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		        
		        // 주소-좌표 변환 객체를 생성합니다
		        let geocoder = new kakao.maps.services.Geocoder();
		        
		        // 마커 이미지의 이미지 크기 입니다
		         let imageSize = new kakao.maps.Size(24, 35); 
		         
		         // 마커 이미지를 생성합니다    
		         let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		         
		        geocoder.addressSearch(addr, function(result, status) {
		           
		           if (status === kakao.maps.services.Status.OK) {
		                 
		              let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		              
		              let storeName = "${storeInfo.s_name}";
		              let img = "${imageList[0].f_STORED_FILE_NAME}";
		              
		              // 마커를 생성합니다
		               let marker = new kakao.maps.Marker({
		                   map: map, // 마커를 표시할 지도
		                   position: coords, // 마커를 표시할 위치
		                   image : markerImage // 마커 이미지 
		               });
		           
		                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                map.setCenter(coords);
		              
		                // 커스텀 오버레이를 생성합니다
		                let customOverlay = new kakao.maps.CustomOverlay({
		                    position: coords,
		                    //content: overlaybox,
		                    xAnchor: 0.3,
		                    yAnchor: 0.91
		                });
		                
		                var overlaybox = document.createElement('div');
		                var content = document.createElement('div');
		                
		                overlaybox.className = 'overlaybox';
		                content.className = 'content';
		                
		                content.innerHTML = "<img src='${ctxpath}/resources/imgs/"+img+"' width=200 height=180><div>"+storeName+"</div>";
		                
		                overlaybox.appendChild(content);
		                      
		                var closeBtn = document.createElement('button');
		                
		                closeBtn.className = 'close';
		                closeBtn.innerHTML = '닫기';
		                
		                closeBtn.onclick = function() {
		                   customOverlay.setMap(null);
		                };
		                overlaybox.appendChild(closeBtn);
		                      
		                customOverlay.setContent(overlaybox);
		                      
		                kakao.maps.event.addListener(marker, 'click', function() {
		                   customOverlay.setMap(map);
		                });
		             
		           
		           }else {
		              console.log("위경도변환 에러");
		           }
		        }); //geocoder-end
			  </script>
	  	</div>
	  </section>
	    
  
		<!-- 댓글 -->
		<section id="reply">
		  <div class="box">
			<ol class="replyList">
				<c:forEach items="${replyList}" var="replyList">
				
					<li>
				        <div class="flex reply_list">
							<ul>
								<li class="id">${replyList.u_id}</li>
								<li class="date"><fmt:formatDate value="${replyList.r_regdate}" pattern="yyyy-MM-dd" /></li>
							</ul>
							  
							<p class="text">${replyList.r_content}</p>
							
							<div class="star_wrap">
								<c:forEach begin="1" end="${replyList.r_grade}">
						         <img src="${ctxpath }/resources/imgs/star_on.png"/>
						        </c:forEach>
						        <c:forEach begin="1" end="${5-replyList.r_grade}">
						         <img src="${ctxpath }/resources/imgs/star_off.png"/>
						        </c:forEach>
							</div>
						</div>
						<c:if test="${replyList.image!=''}">
					    <p>
					       <img src="${ctxpath}/resources/imgs/${replyList.image}" width="200" height="200">
					    </p>
					    </c:if>
					    
					</li>
				</c:forEach>   
			</ol>
		  </div>
		</section>
  		
		
		<section class="reply_from">
			<form name="replyForm" method="post" class="form-horizontal" encType="multipart/form-data" action="replyWrite">
				<input type="hidden" id="s_num" name="s_num" value="${storeInfo.s_num}" /> 
			
				<div class="form-group row">
					<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="u_id" class="form-control" />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<input type="text" id="content" name="r_content" class="form-control"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="content" class="col-sm-2 control-label">이미지</label>
					<div class="col-sm-10">
						<input type="file" name="image" class="form-control"/>
					</div>
				</div>
				<!-- 평점 선택창 -->
				<div class="form-group row">
					<label for="r_grade" class="col-sm-2 control-label">평점</label>
					    <select name="r_grade" class="form-control col-sm-6">
					        <option value=1 >★☆☆☆☆</option>
					        <option value=2 >★★☆☆☆</option>
					        <option value=3 >★★★☆☆</option>
					        <option value=4 >★★★★☆</option>
					        <option value=5 >★★★★★</option>
					    </select>
					</div>
				</div>
				
				<div class="btn_wrap">
					<input type="submit" value="작성" class="reply_btn">
				</div>
			</form>
		</section>
	</body>
</html>