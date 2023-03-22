<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="../module/header2.jsp"%>
<html>
<head>
	<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/user.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<body>
	<div class="loginForm_wrap">
		<h2 class="sub_title">로그인</h2>
		<form name='loginForm' method="post" action="${ctxpath}/user/login">
			<c:if test="${user == null}">
			
			<div class="flex-between-center">
				<div class="form-check form-check-inline">
				  <input class="form-check-input login_input" type="radio" name="u_type" id="inlineRadio1" value="c" checked>
				  <label class="form-check-label" for="inlineRadio1"><span>🤭</span> 일반</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input login_input" type="radio" name="u_type" id="inlineRadio2" value="b">
				  <label class="form-check-label" for="inlineRadio2"><span>😊</span> 사업자</label>
				</div>
			</div>
			
			<div class="form-group mt-4">
				<label for="u_id" class="mb-2">아이디</label>
				<input type="text" name="u_id" class="form-control" id="u_id" placeholder="아이디를 입력하세요." autocomplete="off">
			</div>
			<div class="form-group mt-4">
				<label for="u_pw" class="mb-2">패스워드</label>
				<input type="password" name="u_pw" class="form-control" id="u_id" placeholder="비밀번호를 입력하세요.">
			</div>
			<div class="login_btn_wrap mt-5">
				<button type="submit" class="btn btn-md login_btn">🌌 로그인</button>
				<button type="button" class="btn btn-md register_btn mt-2" onclick="location='${ctxpath}/user/register'">😍 회원가입</button>
				<button type="button" class="btn btn-sm register_btn" onclick="location='${ctxpath}/user/findIdView'">😄 아이디찾기</button>
			</div>
				
			</c:if>
			<c:if test="${user != null }">
				<div>
					<p>${user.u_id}님 환영 합니다.</p>
					<button id="logoutBtn" type="button" onClick="location='${ctxpath}/user/signout'">로그아웃</button>
					<button id="modifyBtn" type="button" onClick="location='${ctxpath}/user/modify'">내정보수정</button>
					<button id="deleteBtn" type="button" onClick="location='${ctxpath}/user/delete'">탈퇴하기</button>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
			</c:if>
		</form>
	</div>
</body>
</html>