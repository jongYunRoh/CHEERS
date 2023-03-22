<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>register.jsp</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/eat.css">
	</head>
	
	<body>
		
		<section id="content" class="container eatReg">
			<h2 class="eatReg_title">잇딜등록</h2>
			<form role="form" method="post" autocomplete="off" action="eatdealPro" encType="multipart/form-data">
				<div class="row input_area mb-3">
					<label for="e_name" class="col-md-2">가게이름</label>
					<input type="text" id="e_name" name="e_name" value="${s_name}" required="required" class="form-control col-md-10"/>
					<input type="hidden" name="s_num" value="${s_num}">						
				</div>
				
				<div class="row input_area mb-3">
					<label for="e_price" class="col-md-2">가격</label>
					<input type="text" id="e_price" name="e_price" required="required" class="form-control col-md-10"/>						
				</div>
				
				<div class="row input_area mb-3">
					<label for="e_period" class="col-md-2">판매기간</label>
					<input type="text" id="e_period" name="e_period" required="required" class="form-control col-md-10"/>						
				</div>
				
				<div class="row input_area mb-3">
					<label for="e_content" class="col-md-2">설명</label>
					<input type="text" id="e_content" name="e_content" required="required" class="form-control col-md-10"/>						
				</div>
				
				<div class="row input_area mb-3">
					<label for="e_content" class="col-md-2">주소</label>
					<input type="text" id="e_addr" name="e_addr" value="${s_addr}" required="required" class="form-control col-md-10"/>						
				</div>
				
				<div class="row input_area mb-3">
					<label for="e_menu" class="col-md-2">메뉴</label>
					<input type="text" id="e_menu" name="e_menu" value="${s_menu}" required="required" class="form-control col-md-10"/>						
				</div>
				
				<div class="row input_area mb-3">
				  <label for="e_img" class="col-md-2">이미지 등록</label>
				  <input type="file" name="file" class="form-control col-md-10"/>
				</div>
				
				<div class="btn_wrap">
					<button type="submit" id="register_btn" class="btn eat_regi_btn">등록</button>
				</div>
			</form>			
		</section>
		
		
	</body>
	
</html>