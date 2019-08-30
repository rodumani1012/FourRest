<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ page import="com.my.four.model.dao.FreeboardDao"%>
<%@ page import="com.my.four.model.dao.FreeboardDaoImpl"%>
<%@ page import="com.my.four.model.dto.FreeboardDto"%>

<%@page import="java.util.List"%>

<!-- 페이징  -->
 <%
 
 	FreeboardDao dao = new FreeboardDaoImpl();
 
 	String strPg = request.getParameter("pg"); //list.jsp?pg=?
  
     int rowSize = 10; //한페이지에 보여줄 글의 수
     int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
    
     if(strPg != null){ //list.jsp?pg=2
         pg = Integer.parseInt(strPg); //.저장
     }
    
    
     int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
     int to=(pg * rowSize); //(1*10) = 10 //to
  	
     List<FreeboardDto> list = dao.freeboardList();
     //System.out.println("list : "+list.get(3).getFree_title());
    
     int total = dao.freeboardList().size(); //총 게시물 수
     System.out.println("sdfsdfasdfasdf"+dao.freeboardList().size());
     int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
     //int totalPage = total/rowSize + (total%rowSize==0?0:1);
     int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
    
    
    
     System.out.println("전체 페이지수 : "+allPage);
     System.out.println("현재 페이지 : "+ strPg);
     //System.out.println("ceil:"+Math.ceil(total/rowSize));
     //out.println("list="+list);
    
     int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
     int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
     if(toPage> allPage){ // 예) 20>17
         toPage = allPage;
     }
    
     System.out.println("페이지시작 : "+fromPage+ " / 페이지 끝 :"+toPage);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var pageNum = $("#pageNum").val();
		 $("#txt_search").keydown(function(key) {
             if (key.keyCode == 13) {
            	 PageMove(pageNum);
             }
         });
	});
	function PageMove(page) {
		location.href = "freeboardlist.do?category=" + $('#category').val() + "&page=" + page + "&txt_search=" + $('input#txt_search').val();
	}
</script>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<!-- Main -->
	<%@ include file="../header.jsp"%>
	<div id="main" class="wrapper style1">

		<section class="container">
			<br> <br> <br> <br> <br>
			<div class="row">
				<span class="pull-left">총 ${totalCount } 건</span>
				<c:choose>
					<c:when test="${empty list }">
						<table class="table table-bordered">
							<col width="40px" />
							<col width="200px" />
							<col width="100px" />
							<col width="100px" />
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<tr>
								<td colspan="4">게시물이 없습니다.</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<table class="table table-bordered">
							<col width="40px" />
							<col width="200px" />
							<col width="100px" />
							<col width="100px" />
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>

							<c:forEach items="${list }" var="dto" varStatus="status">
								<tr>
									<td>${status.index + 1 }</td>
									<td><a href="freedetail.do?free_seq=${dto.free_seq }">${dto.title }</a>
									</td>
									<td>${dto.id }</td>
									<td><fmt:formatDate value="${dto.free_date }"
											pattern="yyyy-MM-dd HH:MM" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				<c:if test="${user_id != null}">
				<div class="container-fluid">
					<button class="btn btn btn-light pull-right" type="button"
						onclick="location.href='freeinsert.do'">글 작성하기</button>
				</div>		
				</c:if>
				<div class="container">
					<!-- Pagination -->
					<div class="pagination pagination-md justify-content-center">
						<a class="page-link"
							href="javascript:PageMove(${paging.firstPageNo})">&laquo;</a> <a
							class="page-link"
							href="javascript:PageMove(${paging.prevPageNo})">&lt;</a>
						<c:forEach var="i" begin="${paging.startPageNo}"
							end="${paging.endPageNo}" step="1">
							<c:choose>
								<c:when test="${i eq paging.pageNo}">
									<a class="page-link" href="javascript:PageMove(${i})">${i}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="javascript:PageMove(${i})">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<a class="page-link"
							href="javascript:PageMove(${paging.nextPageNo})">&gt;</a> <a
							class="page-link"
							href="javascript:PageMove(${paging.finalPageNo})">&raquo;</a>
					</div>
				</div>
				<!-- 검색 -->
				<br><br><br>
				<div class="container-fluid">
					<table class="mx-auto">
						<tr>
							<td colspan="4">
								<div class="form-group form-inline">
									<select class="form-control" id="category">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">글쓴이</option>
									</select>
									<input type="text" class="form-control" id="txt_search" value="${txt_search }" style="width: 340px; margin-right: 15px; margin-left: 15px;"> 			
									<input type="hidden" id="pageNum" value="${paging.pageNo }">
									<button type="button" class="small btn btn-secondary" onclick="javascript:PageMove(${paging.pageNo})">검색하기</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>

</body>
</html>