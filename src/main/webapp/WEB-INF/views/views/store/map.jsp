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
       <link rel="stylesheet" type="text/css" href="../resources/css/content.css">
       <title></title>
       
       <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   
   </head>
   <body>
      <div id="map" style="width:100%;height:720px;"></div>

      <!-- 지도 스크립트 -->
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37c503ae464c1b4bb17ef154fbb125a3&libraries=services"></script>
      
      <script>
         
         let mapContainer = document.getElementById('map'), // 지도를 표시할 div  
          mapOption = { 
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };
         
         let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
         
         let clickedOverlay = null;
         
         // 마커를 표시할 위치와 title 객체 배열입니다 
         let positions = ${list};
         
         // 마커 이미지의 이미지 주소입니다
         let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

         for (let i = 0; i < positions.length; i ++) {
            
            // 주소-좌표 변환 객체를 생성합니다
            let geocoder = new kakao.maps.services.Geocoder();
            
            // 마커 이미지의 이미지 크기 입니다
             let imageSize = new kakao.maps.Size(24, 35); 
             
             // 마커 이미지를 생성합니다    
             let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
             
            geocoder.addressSearch(positions[i].s_addr, function(result, status) {
               
               if (status === kakao.maps.services.Status.OK) {
                     
                  let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                  
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
                    
                    content.innerHTML =  "<img src='${ctxpath}/resources/imgs/"+positions[i].image+"'/>"
                    					 +"<div class='store_name'>"+positions[i].s_name+"</div>";
                   
                    overlaybox.appendChild(content);
                          
                    var closeBtn = document.createElement('button');
                    
                    closeBtn.className = 'close';
                    closeBtn.innerHTML = 'x';
                    
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
            
         }//for-end
         
      </script>
      
   </body>
</html>
