<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../module/header2.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매칭 홈</title>
</head>
<body>
  <form method="post" action="${ctxpath}/store/map">
  <input type="text" name="keyword"> 
  <input type="submit" value="찾기">
  </form>
</body>
</html>