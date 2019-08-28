<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::Membership Management</title>

<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<!--top nav start=======-->
	<nav class="navbar navbar-inverse top-navbar" id="top-nav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="" href="admin.do"><img align="left"
					src="resources/image/logowhite.png" alt="로곤디" width="103"
					height="49"></a>
			</div>
			<ul class="social-icon pull-right list-inline">
				<li class="dropdown"><a class="messages-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-envelope"></span> </a></li>
				<li class="dropdown"><a class="alerts-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-bell"></span> </a></li>
				<li class="dropdown"><a class="tasks-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-th-list"></span> </a></li>
				<li class="dropdown"><a class="user-link dropdown-toggle"
					href="#"><span class="glyphicon glyphicon-user"></span></a></li>
			</ul>
		</div>
	</nav>

	<div class="table-responsive" style="overflow-y: scroll; margin: 5% ">
		<table class="table table-striped table-hover">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>아이디</td>
				<td>연락처</td>
				<td>이메일</td>
				<td>주소</td>
				<td>회원정보수정</td>
			</tr>
			<c:choose>
			<c:when test="${empty memlist}" >
				<tr>
					<td colspan="7">회원정보가 존재하지않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${memlist }" var="dto" varStatus="status">
					<tr id="rownumid${status.count}">
						<td><div class="prevup">${dto.usernum}</div><div class="afterup"><input type="text" value="${dto.usernum }" readonly="readonly" class="userno"></div></td>
						<td><div class="prevup">${dto.name}</div><div class="afterup"><input type="text" value="${dto.name }"readonly="readonly"></div></td>
						<td><div class="prevup">${dto.id}</div><div class="afterup"><input type="text" value="${dto.id }"readonly="readonly"></div></td>
						<td><div class="prevup"><div class="prevphone">${dto.phone}</div></div><div class="afterup"><input type="text" value="${dto.phone}" class="phone"></div></td>
						<td><div class="prevup"><div class="prevemail">${dto.email}</div></div><div class="afterup"><input type="text" value="${dto.email}" class="email"></div></td>
						<td><div class="prevup"><div class="prevaddr">${dto.addr}</div></div><div class="afterup"><input type="text" value="${dto.addr}" class="addr"></div></td>
						<td>
						<input class="prevup btn btn-danger btn-sm" type="button" value="수정"  onclick="open_afterdiv(${status.count });">
						<input class="afterup btn btn-success btn-sm" type="button" value="수정완료" onclick="update_member(${status.count });">
						<input class="afterup btn btn-warning btn-sm" type="button" value="수정취소" onclick="close_afterdiv(${status.count });">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	</div>

</body>

<script type="text/javascript">
jQuery(document).ready(function() {
	$('.afterup').hide();
});

function open_afterdiv(idno) {
	$('#rownumid'+idno+' .afterup').show();
	$('#rownumid'+idno+' .prevup').hide();
};
function close_afterdiv(idno) {
	$('#rownumid'+idno+' .prevup').show();
	$('#rownumid'+idno+' .afterup').hide();
};

function update_member(idno){
	var usernum = $('#rownumid'+idno+' .afterup').find('.userno').val();
	var phone = $('#rownumid'+idno+' .afterup').find('.phone').val();
	var email = $('#rownumid'+idno+' .afterup').find('.email').val();
	var addr = $('#rownumid'+idno+' .afterup').find('.addr').val();
	console.log(usernum+'/'+phone+'/'+email+'/'+addr);
	$.ajax({
		url : "admin_memupdate.do",
		type : 'post',
		data : {
			"usernum" :usernum,
			"phone" : phone,
			"email" :email,
			"addr": addr,
		},
		dateType : "json",
		success : function(map) {
			alert("수정"+map.code);
			$('#rownumid'+idno+' .prevphone').html(phone);
			$('#rownumid'+idno+' .prevemail').html(email);
			$('#rownumid'+idno+' .prevaddr').html(addr);
		},
		fail : function() {
			alert('에러');
			self.close();
		}
	});
}


</script>
</html>