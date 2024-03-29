<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="dist/lang/summernote-ko-KR.js"></script>
<style type="text/css">
body{
	width:"100%";
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300
		});
	});

</script>
<title>The Forest</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br><br><br><br><br><br><br>
<h3 class="text-center" >공모세부내용</h3>
	<div class="container d-flex justify-content-center" id="Detailform">
		<table class="table que-tbl table-bordered">
			<col width="20px">
			<col width="400px">
			<tr>
				<th>글 번호</th>
				<td>${conDto.boardno}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${conDto.regdate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>공고기간</th>
				<td><fmt:formatDate value="${conDto.startdate }"
						pattern="yyyy-MM-dd" />~<fmt:formatDate value="${conDto.enddate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>	
			<tr>
				<th>제 목</th>
				<td>${conDto.title }</td>
			</tr>
			<tr>
				<th>상금</th>
				<td>${conDto.prize }</td>
			</tr>
			<tr height="300px">
				<th>내 용</th>
				<td>${conDto.content }</td>
			</tr>
			<tr>
				<td colspan="2">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='contest_deletelist.do?boardno=${conDto.boardno}'">삭제</button>				
					<button type="button" class="btn btn-outline-dark" onclick="location.href='admin_conlist.do'">관리자전용 게시 목록으로</button>
				</sec:authorize>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='contest_main.do'">목록으로</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='contest_postform.do'">참여하기</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='contest_postlist.do?pagenum=1&contentnum=9&conlistno=${conDto.boardno}'" >참여작보기</button>
					<a id="kakao-link-btn" href="javascript:;">
					<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 30px;height: 30px;"/>
					</a>
					
				</td>
			</tr>
		</table>

<script type="text/javascript">
	var nowlink =''+ document.location.href;
	console.log(nowlink);
	console.log("-----------"); 
</script>	
<script type="text/javascript" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('d71449af21090ce3a8d8c57f9cca8757');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: 'foRest',
        description: '#환경 #공모전 #자연보호 #멸종위기  #동물보호',
        imageUrl: 'https://image.freepik.com/free-vector/mountain-forest-illustration_16787-15.jpg',
        link: {
          mobileWebUrl: nowlink,
          webUrl: nowlink
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: nowlink,
            webUrl: nowlink
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: nowlink,
            webUrl: nowlink
          }
        }
      ]
    });
  //]]>
</script>


	</div>

</body>
</html>