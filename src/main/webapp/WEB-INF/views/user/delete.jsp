<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../module/header2.jsp"%>
<html>
<head>
	<title>탈퇴</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/user.css">
</head>
	<body>
		<div class="container delete">
			<h2 class="mb-3 delete_title">회원탈퇴</h2>
			
			<form role="form" method="post" autocomplete="off">
				<div class="row mb-3">
					<label for="u_id" class="col-md-2">아이디</label>
					<input type="text" id="u_id" name="u_id" class="col-md-10 form-control" value="${user.u_id}"/>
				</div>
				<div class="row mb-3">
					<label for="u_pw" class="col-md-2">패스워드</label>
					<input type="password" id="u_pw" name="u_pw" class="col-md-10 form-control"/>
				</div>
				<div class="flex btn_wrap">
					<button type="submit" class="btn delete_btn">회원 탈퇴</button>
					<button type="button" class="btn home_btn" onclick="location='/'">처음으로</button>
				</div>			
				<p>
					
				</p>
				
			</form>
		
			<c:if test="${msg == false }">
				<p>
				입력한 비밀번호가 잘 못 되었습니다.
				</p>
			</c:if>
		</div>
	</body>
</html>
