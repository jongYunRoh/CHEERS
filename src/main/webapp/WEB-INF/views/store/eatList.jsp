<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EAT딜</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
	</head>
	<body>
	  <section id="container" class="eat_list">
		<div class="wrap">
		    <h2 class="sub_title">🎁 COUPON</h2>
		  	<c:forEach items="${list}" var ="list">
		  	<div class="contents">
		  	  <div class="sumnail_box">
		  	    <a href="eatInfo?e_num=${list.e_num}">
		  	    	<img src="${ctxpath}/resources/imgs/${list.image}" width='200' height='200'>
		  	    	<div class="cover"></div>
	  	    	</a>
	  	    	<span class="new">🎁 COUPON</span>
		  	    <p class="price">₩${list.e_price}</p>
		  	  </div>
		  	  <div class="content_box">
		  	  	<span class="percent">10%</span>
		  	  	<p class="title"><a href="eatInfo?e_num=${list.e_num}">${list.e_name}</a></p>
		  	  	<p class="menu">${list.e_menu}</p>
		  	  	<p class="addr">${list.e_addr}</p>
		  	  </div>
		  	</div>
		  	</c:forEach>
	  	</div>
	  </section>
	</body>
</html>