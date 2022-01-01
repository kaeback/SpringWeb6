<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 완료</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css">

</head>
<body>
<h1>[ 개인정보 수정 완료 ]</h1>

<table>
	<tr>
		<th>ID</th>
		<td>${customer.custid }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${customer.password }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${customer.name }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${customer.email }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<c:if test="${customer.gender == 'male' }">남자</c:if>
			<c:if test="${customer.gender == 'female' }">여자</c:if>
		</td>
	</tr>
	<tr>
		<th>주민번호</th>
		<td>${customer.ssn }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td style="width:300px;">${customer.address }</td>
	</tr>
</table>

<p><a href="../">메인화면으로 이동</a></p>
</body>
</html>