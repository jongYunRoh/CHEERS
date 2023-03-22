<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- <h2>${vo.u_id}님 저희 홈에 오신 것을 환영합니다</h2> -->
    
    <c:set var="u_id" value="${vo.u_id}" scope="session"/>
    
    <meta http-equiv="Refresh" content="0;url=/">
    
    
     <%--<%
    session.setAttribute("id", ${dto.id});
     --%>
     
</body>
</html>