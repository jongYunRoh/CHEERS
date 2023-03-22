<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/reset.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		$("#keyword_form").hide();
		$(function(){
			var newURL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
			console.log(window.location.pathname);
			
			var pathName = window.location.pathname;
			
			if(pathName != "/"){	//서브페이지로 들어갔을 때
				
				//검색 바 나타냄
				$("#keyword_form").show();
				$("header , nav").css("background-color","#fff");
				$("nav").addClass("border");
				$(".menu a").css("color","#000");
				$(".logo").css("color","#5f0080");
				
				//멜론 플레닛일 때
				//$(".logo_wrap img").attr("src", "../resources/imgs/melon_logo.png");
				
			}else {
				//메인일 때 ${ctxpath}를 /로 설정해놓음
				$("#keyword_form").hide();
				$("header, nav").css("background-color","transparent");
				$("nav").removeClass("border");
				$(".menu a").css("color","#fff");
				$(".user_btn").css("color","#fff");
				$(".logo_wrap img").attr("src", "../resources/imgs/melon_logo_w.png");
				$(".logo").css("color","#fff");
			}
		})
		</script>
	</head>
	<body>
		<nav class="flex-between-center">
		
			<div class="flex logo_wrap">
				<!-- <img src="../resources/imgs/cheers_logo_r.png" class="logo" onclick="location='/'" alt="치어스 로고"> -->
				<p class="logo" onclick="location='/'">치어스</p>
				
				<!-- 검색 -->
				<form id="keyword_form" class="search sub" action="${ctxpath}/store/map" method="post">
					<div class="search_wrap">
						<div class="search_box flex-between-center">
							<input type="text" id="autoComplete" name="keyword" class="main_search_input" autocomplete="off" placeholder="지역, 식당, 음식을 검색하세요.">
							<input type="submit" class="search_btn keyword_btn" value="">
						</div>
					</div>
				</form>
			</div>
			
			<div class="flex-between-center menu_wrap">
				<ul class="flex-between-center menu">
					<li class="mr-3"><a href="${ctxpath}/store/eatList">coupon</a></li>
					<!-- <li><a href="${ctxpath}/store/bestList">술맛집 리스트</a></li> -->
					<li><a href="${ctxpath}/store/bestList">술맛집 찾기</a></li>
				</ul>
				
				<div>
					<ul class="flex-between-center user">
						<c:if test="${user != null }">
						<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle user_btn" type="button" id="dropdowMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    ${user.u_id}님n
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="${ctxpath}/user/signout">로그아웃</a>
						    <a class="dropdown-item" href="${ctxpath}/user/modify">내정보수정</a>
						    <a class="dropdown-item" href="${ctxpath}/user/delete">탈퇴하기</a>
						    <c:if test="${user.u_type == 'b'}">
						    <a class="dropdown-item" href="${ctxpath}/store/registerForm">가게등록하기</a>
						    </c:if>
						    <c:if test="${user.u_type == 'b'}">
							<form action="${ctxpath}/store/eatRegister" method="post">
					          <input type="hidden" name="u_id" value="${user.u_id}">
					          <input type="submit" value="쿠폰등록" class="dropdown-item">
					        </form>
					        </c:if>
						  </div>
						</div>
						</c:if>
						
						<c:if test="${user == null }">
						<li class="mr-3"><a href="${ctxpath}/user/login">로그인</a></li>
						<li><a href="${ctxpath}/user/register">회원가입</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</body>
</html>