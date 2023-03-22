<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
<%@include file="../module/header2.jsp"%>
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href="/board/list">목록</a></li>
	<li><a href="/board/writeView">글 작성</a></li>
	<li>
		<c:if test="${user != null}"><a href="${ctxpath}/user/logout">로그아웃</a></c:if>
		<c:if test="${user == null}"><a href="${ctxpath}/user/login">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${user != null}">
			<p>${user.u_id}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>