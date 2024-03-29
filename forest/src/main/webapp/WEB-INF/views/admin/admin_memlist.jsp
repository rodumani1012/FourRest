<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<style type="text/css">
.fa-circle{
color: #5cb85c;
}
.fa-times{
color: #d43f3a;
};
</style>
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
	<div class="row">
				<div class="col-md-12">
					<div class="page-title" style="padding: 8px 15px;">
						<ol class="breadcrumb">
							<li>
								<h2>&nbsp;Membership Management<small> 회원관리</small></h2>
							</li>
							<li style="margin-top: 10px; font-size: 20px; color: #34495e;">
								<i class="fa fa-calendar"></i>
							</li>
							<li class="pull-right"><audio controls="controls"
									autoplay="autoplay" loop="loop">
									<source src="resources/audio/mix.mp3" type="audio/mp3" />
								</audio>
							</li>
						</ol>
					</div>
				</div>
			</div>
	<div class="row" style="overflow-y: scroll; margin-left: 7%; margin-right: 7%; margin-bottom: 7%; ">
	
		<table id="searchtbl" class="table table-striped table-hover">
			<tr>
				<td colspan="8" style="text-align: right;">
					<input id="searchbox" type="text" placeholder="회원아이디" class="form-control" style="width: 350px; display: inline;"><input type="button" value="검색" class="btn btn btn-secondary" onclick="gotosearch();">		
				</td>
			</tr>
<!-- 			<tbody></tbody> -->
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>주소</th>
				<th>회원여부</th>
				<th>회원정보수정</th>
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
						<td><div class="prevup">${dto.usernum}</div><div class="afterup"><div class="userno">${dto.usernum }</div></div></td>
						<td><div class="prevup">${dto.name}</div><div class="afterup">${dto.name }</div></td>
						<td><div class="prevup">${dto.id}</div><div class="afterup">${dto.id }</div></td>
						<td><div class="prevup"><div class="prevphone">${dto.phone}</div></div><div class="afterup"><input type="text" value="${dto.phone}" class="phone"></div></td>
						<td><div class="prevup"><div class="prevemail">${dto.email}</div></div><div class="afterup"><input type="text" value="${dto.email}" class="email"></div></td>
						<td><div class="prevup"><div class="prevaddr">${dto.addr}</div></div><div class="afterup"><input type="text" value="${dto.addr}" class="addr"></div></td>
						<td>
							<c:choose>
								<c:when test="${dto.enabledDb=='Y' }">
									<i class="far fa-circle" ></i>
								</c:when>
								<c:otherwise>
									<i class="fas fa-times"></i>&nbsp;&nbsp;<input class="btn btn-danger btn-sm" type="button" onclick="location.href='admin_memdelete.do?usernum=${dto.usernum}'" value="정보영구삭제">
								</c:otherwise>
							</c:choose>
						</td>
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
	var usernum = $('#rownumid'+idno+' .afterup').find('.userno').html();
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
			alert('수정되었습니다.');
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


function gotosearch() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("searchbox");
  filter = input.value.toUpperCase();
  table = document.getElementById("searchtbl");
  tr = table.getElementsByTagName("tr");

  
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}



</script>




</html>