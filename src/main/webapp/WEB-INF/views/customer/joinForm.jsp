<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/default.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
// 가입신청 후 서버에서의 오류로 현재 페이지로 되돌아온 경우 오류 메시지 출력
<c:if test="${errorMsg != null}">alert('${errorMsg}');</c:if>

// 가입 폼 확인
function formCheck() {
	var id = $("#custid");
	var pw = $("#password");
	var pw2 = $("#password2");
	var name = $("#name");

	if ($("#idcheck").val() == "disable") {
		alert("ID 중복확인을 해 주세요");
		id.focus();
		id.select();

		return false;
	}
		
	if (id.val().length < 3 || id.val().length > 10) {
		alert("ID는 3~10자로 입력하세요");
		id.focus();
		id.select();

		return false;
	}

	if (pw.val().length < 3 || pw.val().length > 10) {
		alert("비밀번호는 3~10자로 입력하세요");
		pw.focus();
		pw.select();

		return false;
	}
	
	if (pw.val() != pw2.val()) {
		alert("비밀번호를 정확하게 입력하세요");
		pw.focus();
		pw.select();

		return false;
	}

	if (name.val() == "") {
		alert("이름을 입력하세요");
		name.focus();
		name.select();

		return false;
	}

	return true;
}

// 아이디 중복확인
function idCheck() {
	var id = $("#custid");

	if (id.val().length < 1) {
		alert('ID를 입력해 주세요');
		return
	}
	
	$.ajax({
		url: "idcheck",
		type: "get",
		data: {"id":id.val()},
		success: function(rec_data){
			if (rec_data) {
				alert(id.val() + "는 사용할 수 있는 ID 입니다.");
				$("#idcheck").val("enable");
			} else {
				alert(id.val() + "는 이미 사용중인 ID 입니다.");
				$("#idcheck").val("disable");
			}
		}
	});
}

</script>
</head>
<body>
<div class="centerdiv">
<h1>[ 회원가입 ]</h1>
	<form id="joinForm" action="join" method="post" onsubmit="return formCheck();">
	<table>
		<tr>
			<th>ID</th>
			<td>
				<input type="text" name="custid" id="custid" maxlength="10" placeholder="ID 중복확인 이용" value="${customer.custid }" />
				<input type="button" value="ID 중복확인" onclick="idCheck();">
			</td>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="password" id="password" placeholder="비밀번호 입력" value="${customer.password }">
				<input type="password" id="password2" placeholder="비밀번호 다시 입력" value="${customer.password }">
			</td>	
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" placeholder="이름 입력" value="${customer.name }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" id="email" placeholder="이메일 입력" value="${customer.email }">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="male" checked>남자
				<input type="radio" name="gender" value="female" checked>여자
			</td>
		</tr>
		<tr>
			<th>주민번호</th>
			<td>
				<input type="text" name="ssn" placeholder="주민번호" value="${customer.ssn }">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="texxt" name="address" placeholder="주소 입력" value="${customer.address }" style="width:300px;">
			</td>
		</tr>
	</table>
	<br>
	<input type="hidden" id="idcheck" name="idcheck" value="disable">
	<input type="submit" value="가입">
	<input type="reset" value="다시 쓰기">
	</form>
</div>
</body>
</html>