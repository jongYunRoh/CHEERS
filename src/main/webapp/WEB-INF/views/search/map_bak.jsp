<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	    <title></title>
	    
	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	    
	    <style>
	        .hide {
	        	display: none;
	        }
	    </style>
	    <script type="text/javascript">
	    $(function(){
	    	
	    	
	    })
	   
	    </script>
	</head>
	<body>
	    <p style="margin-top:-12px">
		    <em class="link">
		        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
		            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
		        </a>
		    </em>
		</p>
		
		<div id="map" style="width:100%;height:500px;"></div>


		<!-- 지도 스크립트 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c503ae464c1b4bb17ef154fbb125a3&libraries=services"></script>
		
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = ${list};
			
			var overlaies = ${list} // 오버레이 정보
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
				geocoder.addressSearch(positions[i].s_addr, function(result, status) {
					
					if (status === kakao.maps.services.Status.OK) {
							
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						// 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: coords, // 마커를 표시할 위치
					        image : markerImage // 마커 이미지 
					    });
					
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);

						// 마커 Click 이벤트 등록
	                    kakao.maps.event.addListener(marker, 'click', makeOverlayListener(map, marker));
						
					}else {
						console.log("위경도변환 에러");
					}
				}); //geocoder-end
				
			}//for-end
			
			function makeOverlayListener(map, marker) {
				var overlay = ${list};
				
			    return function () {
			    	for (var i = 0; i < overlay.length; i ++) {
				        // 커스텀 오버레이 생성
				        var customOverlay = new kakao.maps.CustomOverlay({
				            position:marker.getPosition(),
				            xAnchor: 0.0,
				            yAnchor: 0.5
				        });

				        var content = $('<div></div>').addClass('spot_content');
				        var info = $('<div></div>').addClass('text_area');
				        var title = $('<div></div>').addClass('tit');
				        var close = $('<button type="button">x</button>');

				        // Button click 이벤트 등록
				        close.on('click', function() {
				            customOverlay.setMap(null);
				        });
			        
				        title.append('<h4>'+overlay[i].s_num+'</h4>');
				        title.append('<a href="" class="link">VR 보기</a>');
				        info.append('<div>'+overlay[i].s_name+'</div>');
				        info.append('<p>'+overlay[i].s_addr+'</p>');
				        content.append(info);
				        content.append(close);
						
				        console.log(content[1]);
				        
				        customOverlay.setContent(content[i]);
				        customOverlay.setMap(map);
			    	}
			    }
			}
			
		</script>
		
	</body>
</html>