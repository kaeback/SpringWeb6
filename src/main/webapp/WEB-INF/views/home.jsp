<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>SpringWeb5</title>
</head>
<body>
<h1>[ SpringWeb5 ]</h1>

<c:if test="${loginId != null }">
	${sessionScope.loginName }(${sessionScope.loginId })님 로그인 중<br>
</c:if>

<c:if test="${loginId == null }">
	<li><a href="customer/join">회원가입</a>
	<li><a href="customer/login">로그인</a>
</c:if>
<c:if test="${loginId != null }">
	<li><a href="customer/logout">로그아웃</a>
	<li><a href="customer/update">개인정보 수정</a>
</c:if>
	<li><a href="board/list">게시판</a>
</body>
</html>
