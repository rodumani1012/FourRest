
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- heart채우기 부트스트랩추가하면 중복되는거 지워주세여 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!--  -->
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
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />



<style type="text/css">
#hearts {
	color: #FF0000;
}

#hearts-existing {
	color: #87bad7;
}

body {
	width: 100%;
}
</style>

<script type="text/javascript">
   
      $(document).ready(function () {
    	  var map = new Object();
        $("#clicksubmit").on("click",function(){
        	 var starCount = $('#count').text();
        	 var boardNum = $('#boardnum').val();
        	 var imuser = $('#imuser').val();         
        	$.ajax({
            url:"starupdate.do",
            type:'post',
            data: {"starCount":starCount,"boardNum":boardNum,"userName":imuser},
            dateType:"json",
            success:function (data) {
              map = data.msg+"";
            	alert(map);
              $("#starhere").text(data.updatedStar);
            },
            fail:function () {
                alert('에러');
//                 self.close();
            }

          });
        });
      });
  </script>
<title>공모글 세부</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
		<input type="hidden" id="imuser" value="${user_id}">
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
	</sec:authorize>

	<div class="d-flex justify-content-center container" id="Detailform">
		<input type="hidden" id="boardnum" value="${dto.boardno}"> <input
			type="hidden" id="usernum" value="${dto.writer}">
		<table class="que-tbl">
			<col width="60px">
			<col width="400px">
			<tr>
				<th>No.${dto.boardno }</th>
				<td>${dto.title } | ${dto.writer } <small><fmt:formatDate
							value="${dto.regdate }" pattern="yyyy-MM-dd" /></small>
				</td>
			</tr>
			<tr height="150px">
				<th>내 용</th>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<th>현재평점</th>
				<td>
					<div class="container">
						<div class="row lead">
							<div id="hearts" class="starrr"></div>
							<span id="count">0</span> 점
							<button id="clicksubmit" class="btn btn-outline-dark">투표
							</button>
							<span id="starhere" style="color: red;">${dto.likerate }</span> /
							5 (평점투표수:${dto.likecnt })
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${user_id==dto.writer }">
						<button type="button" class="btn btn-outline-dark"
							onclick="location.href='contest_delete.do?groupno=${dto.groupno}'">글삭제</button>
					</c:if>
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='contest_main.do?'">목록으로</button></td>
			</tr>
		</table>
		<div class="reply"></div>
	</div>


	<hr>
	<div class="container" id="replydiv"></div>
	<table class="d-flex justify-content-center container que-tbl2">
		<c:choose>
			<c:when test="${empty listReply }">
				<tr>
					<td colspan="4"><i class="far fa-sticky-note"></i>등록된 댓글이
						없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${listReply }" var="dtoReply">
					<tr>
						<th>댓글제목:${dtoReply.title } <input type="text"
							value="작성자: ${dtoReply.writer }" readonly="readonly">
						</th>
					</tr>
					<tr>
						<th align="right"><fmt:formatDate
								value="${dtoReply.regdate }" pattern="yyyy-MM-dd" />
								<c:if test="${dtoReply.writer==user_id }">
								<input type="button" value="삭제" onclick="location.href='contest_ansdelete.do?groupno=${dto.groupno }&boardno=${dtoReply.boardno}&pboardno=${dto.boardno}'">								
								</c:if>
						</th>
					</tr>
					<tr>
						<td><textarea rows="5" cols="100">${dtoReply.content }</textarea></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4">
				<c:choose>
				<c:when test="${user_id eq null}">
					<strong>댓글을 달기위해 로그인을 해주세요!</strong>	
				</c:when>
				<c:otherwise>
				
				<form action="contest_replyform.do" method="post">
					<input type="hidden" name="boardno" value="${dto.boardno }">
					<input type="hidden" name="groupno" value="${dto.groupno}">
					<table>
						<tr>
							<th colspan="2">작성자:<input type="text" style="width: 100px"
								name="writer" value="${user_id }" readonly="readonly">
							</th>
						</tr>
						<tr>
							<td><textarea rows="10" cols="100" name="content"
									placeholder="댓글을 작성해주세요"></textarea></td>
						</tr>
						<tr>
							<td><button class="btn btn-outline-dark" type="submit"
									style="float: right;">답변등록</button></td>
						</tr>
					</table>
				</form>
				</c:otherwise>
				
				</c:choose>
	</table>

	<script type="text/javascript">
  var __slice = [].slice;

  (function($, window) {
    var Starrr;

    Starrr = (function() {
      Starrr.prototype.defaults = {
        rating: void 0,
        numStars: 5,
        change: function(e, value) {}
      };

      function Starrr($el, options) {
        var i, _, _ref,
                _this = this;

        this.options = $.extend({}, this.defaults, options);
        this.$el = $el;
        _ref = this.defaults;
        for (i in _ref) {
          _ = _ref[i];
          if (this.$el.data(i) != null) {
            this.options[i] = this.$el.data(i);
          }
        }
        this.createStars();
        this.syncRating();
        this.$el.on('mouseover.starrr', 'span', function(e) {
          return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
        });
        this.$el.on('mouseout.starrr', function() {
          return _this.syncRating();
        });
        this.$el.on('click.starrr', 'span', function(e) {
          return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
        });
        this.$el.on('starrr:change', this.options.change);
      }

      Starrr.prototype.createStars = function() {
        var _i, _ref, _results;

        _results = [];
        for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
          _results.push(this.$el.append("<span class='glyphicon .glyphicon-heart-empty'></span>"));
        }
        return _results;
      };

      Starrr.prototype.setRating = function(rating) {
        if (this.options.rating === rating) {
          rating = void 0;
        }
        this.options.rating = rating;
        this.syncRating();
        return this.$el.trigger('starrr:change', rating);
      };

      Starrr.prototype.syncRating = function(rating) {
        var i, _i, _j, _ref;

        rating || (rating = this.options.rating);
        if (rating) {
          for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
            this.$el.find('span').eq(i).removeClass('glyphicon-heart-empty').addClass('glyphicon-heart');
          }
        }
        if (rating && rating < 5) {
          for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
            this.$el.find('span').eq(i).removeClass('glyphicon-heart').addClass('glyphicon-heart-empty');
          }
        }
        if (!rating) {
          return this.$el.find('span').removeClass('glyphicon-heart').addClass('glyphicon-heart-empty');
        }
      };

      return Starrr;

    })();
    return $.fn.extend({
      starrr: function() {
        var args, option;

        option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
        return this.each(function() {
          var data;

          data = $(this).data('star-rating');
          if (!data) {
            $(this).data('star-rating', (data = new Starrr($(this), option)));
          }
          if (typeof option === 'string') {
            return data[option].apply(data, args);
          }
        });
      }
    });
  })(window.jQuery, window);

  $(function() {
    return $(".starrr").starrr();
  });

  $( document ).ready(function() {

    $('#hearts').on('starrr:change', function(e, value){
      $('#count').html(value);
    });

    $('#hearts-existing').on('starrr:change', function(e, value){
      $('#count-existing').html(value);
    });
  });
</script>

</body>
</html>

