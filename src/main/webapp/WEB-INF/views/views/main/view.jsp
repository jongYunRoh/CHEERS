<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../module/header2.jsp"%>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="../resources/js/sus_keyword.js"></script>

<style type="text/css">
main {
	padding: 0;
}
</style>

<script type="text/javascript">
	$(function() {

		init(); //추천,인기 검색어 함수 불러오기

		// 				$(".self_keyword").click(function(){
		// 					recent_keyword();
		// 					$(".self_keyword_box").removeClass("hidden");
		// 					$(".keyword_box").hide();
		// 				})

		var swiper = new Swiper(".mySwiper", {
			spaceBetween : 30,
			// 				      autoplay: {
			// 				          delay: 2500,
			// 				          disableOnInteraction: false,
			// 				        },
			pagination : {
				el : ".swiper-pagination",
				clickable : true,
			}
		});
	})

	function method(keyword) {
		$("#autoComplete").val(keyword);
		$("#keyword_form").submit();
	}
</script>
</head>
<body>
	<section class="main_wrap">

		<!-- 검색 -->
		<form id="keyword_form" class="search" action="${ctxpath}/store/map"
			method="post">
			<div class="search_wrap">
				<div class="search_box flex-between-center">
					<input type="text" id="autoComplete" name="keyword"
						class="main_search_input melon" autocomplete="off"
						placeholder="지역, 음식을 검색해보세요."> <input type="submit"
						class="search_btn keyword_btn" value="찾기">
				</div>
				<div class="keyword_wrap">
					<div class="btn_wrap">
						<button type="button" class="sug_keyword btn_keyword">😍
							추천 검색어</button>
						<button type="button" class="pop_keyword btn_keyword">🤗
							인기 검색어</button>
						<!-- <button type="button" class="self_keyword btn_keyword">최근 검색어</button> -->
					</div>

					<div class="self_keyword_box hidden">
						<p>최근검색어</p>
						<ul id="ul">
						</ul>
						<button id="button">clear All</button>
					</div>
				</div>
			</div>
		</form>
		<div class="main_box">
			<div class="main_txt_wrap">
				<div class="emoji">🍻</div>
				<div class="txt">맥주 맛집 알아보기</div>
			</div>
		</div>
	</section>

	<section class="best_wrap">
		<h3 class="title">👑 주종별 맛집 Best</h3>
		<ul>
			<li class="best_item" onclick="location='/store/foodList?keyword=사케'">
				<p class="emoji">🍶</p>
				<span class="best">Best</span>
				<span>사케 맛집</span>
			</li>
			<li class="best_item" onclick="location='/store/foodList?keyword=소주'">
				<p class="emoji">🍾</p>
				<span class="best">Best</span>
				<span>소주 맛집</span>
			</li>
			<li class="best_item" onclick="location='/store/foodList?keyword=칵테일'">
				<p class="emoji">🍹</p>
				<span class="best">Best</span>
				<span>칵테일 맛집</span>
			</li>
			<li class="best_item" onclick="location='/store/foodList?keyword=맥주'">
				<p class="emoji">🍻</p>
				<span class="best">Best</span>
				<span>맥주 맛집</span>
			</li>
			<li class="best_item" onclick="location='/store/foodList?keyword=와인'">
				<p class="emoji">🍷</p>
				<span class="best">Best</span>
				<span>와인 맛집</span>
			</li>
		</ul>
	</section>
	
	<section class="best_wrap hot">
		<h3 class="title">🔥 요즘 뜨는 장소 Best</h3>
		<ul>
			<li class="best_item">
				<p class="name">앙띠크</p>
				<p class="addr">서울 서초구 서초동 1660-1</p>
				<span class="comment">☕🍫😋 아이스/핫초코 맛있는 카페</span>
			</li>
			<li class="best_item">
				<p class="name">에이비카페</p>
				<p class="addr">서울 강남구 역삼동 618-15</p>
				<span class="comment">🧑‍💻 하루종일 있어도 눈치 보이지 않는 카페</span>
			</li>
			<li class="best_item">
				<p class="name">평래옥</p>
				<p class="addr">서울 중구 저동2가 18-1</p>
				<span class="comment">🍜 랭면동무의 찐 평양냉면 맛집</span>
			</li>
			<li class="best_item">
				<p class="name">고어플랜트서울</p>
				<p class="addr">서울 용산구 한강로1가 303-3</p>
				<span class="comment">🌿 식물 덕후가 좋아할 만한 장소</span>
			</li>
		</ul>
	</section>

</body>
</html>
