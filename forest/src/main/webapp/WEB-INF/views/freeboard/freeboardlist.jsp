<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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

<style type="text/css">
	input[type="button"], .writebtn{
		width: 10px;
		height: 40px;
		font-size: 1em;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id" />
	</sec:authorize>

	<!-- Main -->
<div id="main" class="wrapper style1">
	<section class="container">
	<div class="row">

	<form action="freeboard.do" method="post" id="muldelform">
		<table border="1">
		<c:choose>
			<c:when test="${empty list }">
				<h3>펀딩 정보가 없습니다.</h3>
			</c:when>
		<c:otherwise>

			<col width="40px"/>
			<col width="200px"/>
			<col width="100px"/>
			<col width="100px"/>

			<tr>	
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.free_seq}</td>
					<td><a href="freedetail.do?free_seq=${dto.free_seq }">${dto.title }</a></td>
					<td>${dto.id }</td>
					<td>${dto.free_date }</td>
				</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		
		
		<table class = "paging">
<tr>
    <td align="center">
                     <%
                        if (pg > 1) { //처음, 이전 링크
                     %> 
                     [<a href="freeboardlist.jsp?pg=1">◀◀</a>] 
                     [<a href="freeboardlist.jsp?pg=<%=pg - 1%>">◀</a>]
                     <%
                        } else {
                     %> 
                     [<span style="color: gray">◀◀</span>] 
                     [<span style="color: gray">◀</span>] 
                     <%
                        }
                     %> 
                     <%
                   for (int i = fromPage; i <= toPage; i++) {
                         if (i == pg) {
                   %> 
                   [<%=i%>] 
                   <%     
                         }else{
                 %> 
                 [<a href="freeboardlist.jsp?pg=<%=i%>"><%=i%></a>] <%
                            }
                        }
       
                 %> 
                 <%
                     if(toPage<allPage){ //다음, 이후 링크
                      System.out.println("allPage!! " + allPage);
                    %> 
                    [<a href="freeboardlist.jsp?pg=<%=pg+1%>">▶</a>] 
                    [<a href="freeboardlist.jsp?pg=<%=allPage%>">▶▶</a>] 
                 <%     
                     } else {
                 %> 
                 [<span style="color: gray">▶</span>] [<span style="color: gray">▶▶</span>] 
        
                 <%
                     }
                    
                    %>


                  </td>
			</tr>
		</table>
	<c:if test="${user_id != null}">
		<button class="btn btn btn-light" type="button" onclick="location.href='freeinsert.do'">글 작성하기</button> 
	</c:if>
	</form>
	
	</div>
	</section>
</div>

</body>
</html>