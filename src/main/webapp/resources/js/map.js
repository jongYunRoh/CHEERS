/**
 * 지도
 */
 
//var map = new kakao.maps.Map(mapContainer, mapOption); 
//var positions = ${list};


for (let i = 0; i < positions.length; i ++) {
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(positions[i].address, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			var contents = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + positions[i].s_name+ 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">'+positions[i].s_name+'</div>' + 
            '                <div class="jibun ellipsis">'+positions[i].s_addr+'</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';

			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
				content: contents,
				map: map,
				position:coords     
			});
				
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			/*kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});*/
			kakao.maps.event.addListener(marker, 'click', openOverlay(map, marker, overlay));
		} 
			
	});  

}
// 커스텀 오버레이 열기
function openOverlay(map, marker, overlay){
	overlay.setMap(map);
}
// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
	overlay.setMap(null);     
}