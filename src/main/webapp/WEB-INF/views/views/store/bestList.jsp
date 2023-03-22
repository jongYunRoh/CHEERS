<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>best 맛집</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
	<style type="text/css">
	  	
	</style>
</head>

<body>
	<div class="container text-center container text-center pt-5 pb-5 best_list">
	
	  <h2 class="sub_title">🍸 술맛집 찾기</h2>
	  
	  <div class="row mb-4">
	    <div class="col">
		  <div class="user-wrap">
		    <div class="user-image">
		      <a href="foodList?keyword=사케">
				<div class="emoji">🍶</div>
				<div class="text">Best 사케맛집</div>
			  </a>
		    </div>
		  </div>
	    </div>
	    <div class="col">
	      <div class="user-wrap">
		    <div class="user-image">
	          <a href="foodList?keyword=고기">
	          	<div class="emoji">🍾</div>
				<div class="text">Best 소주맛집</div>
	          </a>
	        </div>
	      </div>
	    </div>
	  </div>
	  <div class="row mb-4">
	    <div class="col">
		  <div class="user-wrap">
		    <div class="user-image">
		      <a href="foodList?keyword=피자">
		      	<div class="emoji">🍻</div>
				<div class="text">Best 맥주맛집</div>
		      </a>
		    </div>
		  </div>
	    </div>
	    <div class="col">
	      <div class="user-wrap">
		    <div class="user-image">
	          <a href="foodList?keyword=피자">
		      	<div class="emoji">🍷</div>
				<div class="text">Best 와인맛집</div>
		      </a>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  </body>
</html>