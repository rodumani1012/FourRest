<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
   width: 100%;
}

div[class="my"] {
   display: inline-block;
}

div[class="form-group"]>img {
   width: 200px;
   height: 200px;
}
</style>
<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
   rel="stylesheet">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/slick-theme.css">
<link rel="stylesheet" href="resources/assets/css/animate.css">
<link rel="stylesheet" href="resources/assets/css/fonticons.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />
<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
   <%@ include file="../header.jsp"%>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <div class="d-flex justify-content-center">
      <form action="contest_postlist.do">
         <input type="hidden" name="pagenum" value="1"> <input
            type="hidden" name="contentnum" value="6"> <select
            name="conlistno">
               <option value="0">전체보기</option>
            <c:forEach items="${conlist }" var="dto">
               <option value="${dto.boardno}">${dto.title}</option>
            </c:forEach>
         </select>
         <button class="btn btn-outline-dark" type="submit">이동하기</button>
      </form>
   </div>
   <hr>
   <h3 class="text-center">T O P 3</h3>
   <hr>
   <div id="3등까지보여줘" class="d-flex justify-content-center">
      <c:choose>
         <c:when test="${empty threelist }">
            <div>※ 123등 글이 존재하지않습니다.※</div>
         </c:when>
         <c:otherwise>
            <c:forEach items="${threelist }" var="threedto" varStatus="status">
               <div class="my">
                  <div class="form-group text-center">번호 : ${threedto.boardno }
                  </div>
                  <div class="form-group">${threedto.reppic}</div>
                  <div class="form-group text-center">
                     제목 : <a href="contest_detail.do?boardno=${threedto.boardno }">${threedto.title }[${threedto.replyno }]</a>
                  </div>
                  <div class="form-group text-center">순위 : ${status.count }</div>
                  <div class="form-group text-center">평점/5 :
                     ${threedto.likerate }</div>
               </div>
            </c:forEach>
         </c:otherwise>
      </c:choose>
   </div>
   <hr>
      <c:choose>
         <c:when test="${empty listDto }">
            <h3 class="text-center">모든 참여 작</h3>	
         </c:when>
         <c:otherwise>
            <h3 class="text-center">${lsi }</h3>
         </c:otherwise>
      </c:choose>
   <hr>
   
   
    <div class="container">
        <div class="row">
        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
         <h1 class="gallery-title">Gallery</h1>
        </div>
         <c:choose>
            <c:when test="${empty list }">
               <div id="게시물없음">게시물이없습니다.</div>
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                     <div class="form-group">글번호: ${dto.boardno }</div>
                     <div class="form-group">${dto.reppic}</div>
                     <div class="form-group">
                        글제목:<a href="contest_detail.do?boardno=${dto.boardno }">${dto.title }[${dto.replyno }]</a>
                     </div>
                     <div class="form-group">작성자:${dto.writer }</div>
                     <div class="form-group">
                        작성일:
                        <fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd" />
                     </div>
                  </div>
               </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
    </div>
  
   <div class="form-group d-flex justify-content-center">
      <button type="button" class="btn btn-outline-dark"
         onclick="location.href='contest_Writteform.do'">글작성</button>
   </div>
   <div class="paging pagination pagination-md justify-content-center">
      <c:if test="${pm.prev }">
         <a class="page-link" href="contest_postlist.do?contentnum=6&pagenum=${pm.pagenum-1}&conlistno=${conlistno}">
            <span>◀</span>
         </a>
      </c:if>

      <c:forEach begin="${pag.startPage }" end="${pag.endPage }" var="idx">
         <c:choose>
            <c:when test="${pag.pagenum==idx}">
               <span class="page-link" id="now"><b><c:out value="【${idx }】"></c:out></b></span> 
            </c:when>
            <c:otherwise>
               <a class="page-link" href="contest_postlist.do?contentnum=6&pagenum=${idx}&conlistno=${conlistno}"> <span
                  id="notnow"><b><c:out value="【${idx }】"></c:out></b></span>
               </a>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      <c:if test="${pm.next }">
         <a class="page-link" href="contest_postlist.do?contentnum=6&pagenum=${pm.pagenum+1}&conlistno=${conlistno}">
            <span>▶</span>
         </a>
      </c:if>
   </div>
</body>
</html>