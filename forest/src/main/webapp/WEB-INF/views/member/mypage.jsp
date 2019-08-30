<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Forest</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function addpop() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("addr").value = data.address;
				document.getElementById("zonecode").value = data.zonecode;
			}
		}).open();
	}
</script>
</head>
<body>

	<%@ include file="../header.jsp"%>

	<div class="culmn">
		<br> <br> <br> <br> <br> <br>
		<div class="ima container text-center">
			<form class="image" action="memberUpdate.do" id="form">
            <div class="form-group">
               <label for="text">ID : </label>
               <div class="row justify-content-center">
                  <input type="text" class="form-control col-sm-3" id="id" title="n"
                     name="id" readonly="readonly" value="${dto.id }">
               </div>
               <div class="form-group">
                  <label for="text">NAME : </label>
                  <div class="row justify-content-center">
                     <input type="text" class="form-control col-sm-3" id="name"
                     title="n" name="name" value="${dto.name}">
                  </div>
               </div>
               <div class="form-group">
                  <label for="addr">Address : </label>
               </div>
               <div class="form-group">
                  <div class="row justify-content-center">
                     <input type="text" class="form-control col-sm-3" id="addr"
                        onclick="javascript:addpop()" name="addr" value="${dto.addr }">
                  </div>
               </div>
               <div class="form-group">
                  <div class="row justify-content-center">
                     <input type="text" class="form-control col-sm-3" name="zonecode"
                        id="zonecode" readonly="readonly" title="n" value="${dto.zonecode }">
                  </div>
               </div>
               <div class="form-group">
                  <div class="row justify-content-center">
                     <input type="text" class="form-control col-sm-3" id="addrDetail"
                        placeholder="상세주소를 입력해주세요">
                  </div>
               </div>
            </div>
            <div class="form-group">
               <label for="phone">Phone : </label>
               <div class="row justify-content-center">
                  <select class="form-control col-1" name="phone1">
                     <option>010</option>
                     <option>011</option>
                     <option>017</option>
                  </select>&nbsp;_&nbsp;<input type="text" class="form-control col-1"
                     id="phone-mid" name="phone2" value=${phone }>&nbsp;_&nbsp; <input
                     type="text" class="form-control col-1" id="phone-back"
                     name="phone3" value=${phone2 }>
               </div>
            </div>
            <div class="form-group">
               <label for="phone">Email : </label>
               <div class="row justify-content-center">
                  <input type="text" class="form-control col-2" id="emailName"
                     name="emailName" value=${emailName }>&nbsp;@ <select
                     class="form-control col-2" id="emailForm" name="emailForm">
                     <option>daum.net</option>
                     <option>naver.com</option>
                     <option>gmail.com</option>
                  </select>
               </div>
            </div>
            <div class="form-group">
            	<a href="mypagepwchk.do">비밀번호 변경</a>
            </div>
            <div class="form-group">
            	<a href="withdrawPwChk.do">회원탈퇴</a>
            </div>
            <button type="submit" class="btn btn-success btn-lg">수정완료</button>
            <button type="button" class="btn btn-success btn-lg"
               onclick="location.href='main.do'">취소</button>
         </form>
		</div>
	</div>
</body>
</html>