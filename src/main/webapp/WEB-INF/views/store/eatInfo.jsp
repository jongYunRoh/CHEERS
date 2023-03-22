<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${eatInfo.e_name}</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
	</head>
	<body>
		<section class="eat_info">
		  <h4 class="title">${eatInfo.e_name}</h4>
		  <c:forEach var="image" items="${imageList}">
	      <div class="img_cover"><img src="${ctxpath}/resources/imgs/${image.f_STORED_FILE_NAME}"></div>
	      <input type="hidden" name="e_num" value=${e_num }>
	      </c:forEach>
	      
		  <div class="name">${eatInfo.e_name}</div>
		  <div class="menu">${eatInfo.e_menu}</div>
		  <div class="period">사용기간 : ${eatInfo.e_period}</div>
		  <div class="price"><span>10%</span>₩${eatInfo.e_price}</div>
		  
		  <button type="button" class="buy_btn">구매하기</button>
		</section>
	</body>
</html>