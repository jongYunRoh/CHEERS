<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
<style type="text/css">
.user-wrap {
	overflow: hidden;
	position: relative;
	text-align: left;
}

.user-image img {
	width: 100%;
}

.user-text {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 100%;
	transform: translate(-50%, -50%);
	font-size: 30px;
	text-align: center;
	justify-content: center;
	color: white !important;
	text-shadow: 1px 2px 4px rgb(0, 0, 0);
	text-decoration: none;
}

.user-text:hover {
	text-decoration: none;
}

.sub_title2 {
	height: 200px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-flow: column;
}

.sub_title3 {
	font-size: 15px;
	text-align: center;
	color: #c8c8c8;
	margin-top: 10px;
}

.sub_title {
	margin-top: 1rem;
}

.emoji {
	font-size: 40px;
}
</style>
</head>
<body>

	<div class="sub_title2">
		<div class="emoji">🍶</div>
		<h2 class="sub_title">사케 맛집 베스트 4곳</h2>
		<div class="sub_title3"><%=sf.format(nowTime)%></div>
	</div>

	<div
		class="container text-center container text-center pt-5 pb-5 food_list">
		<c:forEach var="store" items="${list}">
			<div class="row mb-4 box">
				<div class="col">
					<div class="user-wrap">
						<div class="user-image">
							<a href="storeInfo?s_num=${store.s_num}"> <img
								src="${ctxpath}/resources/imgs/${store.image}" width='200'
								height='200'>
							</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="user-wrap">
						<div class="user-image">
							<a href="storeInfo?s_num=${store.s_num}">
								<h3 class="name">${store.s_name}${store.ratingAvg}<span class="score"></span>
								</h3>
								<p class="addr">서울특별시 서대문구 연세로11길 22 B1</p>
								<p class="comment">신촌에 생긴 힙한 이자카야~ 이자카야 답게 가라아게, 나베 등의 메뉴가
									준비되어 있었다. 요즘 일본도 한국도 하이볼이 대 유행인 것 같던데, 여기도 하이볼이 있었다. 하이볼 맛이 무척
									좋았던 것으로 기억한다. 음식들이 모두 맛있었다. 특히 나베같은 경우는 면을 리필할 수 있어서~ 효자 안주다.
									가라아게도 육즙이 촉촉하고 튀김옷도 바삭하니 짱 맛있었다.</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>