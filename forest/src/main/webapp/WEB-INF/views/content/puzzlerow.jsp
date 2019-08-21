<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	img{
		width: 256;
		height: 256;
		vertical-align: middle;	
	}
	a{
		font-size: 30px;
		text-decoration: none;
	}

</style>

<script type="text/javascript" src="resources/assets/js/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="resources/assets/js/jquery.puzzle.js"></script>

<script type="text/javascript">

window.onload = function() {
	var anchs = document.querySelectorAll("a");
	var img = document.querySelector("img");
	var cnt = 1;

	anchs[0].onclick = function() {

		var imgAlt = img.getAttribute("alt");
		if (imgAlt == "rowimg1") {
			cnt = 3;
			img.setAttribute("alt", "rowimg3");
			img.setAttribute("src", "resources/assets/images/content/rowimg3.jpg");
		} else {
			img.setAttribute("alt", "rowimg" + (--cnt));
			img.setAttribute("src", "resources/assets/images/content/rowimg" + cnt + ".jpg");
		}
	}

	// 오른쪽 화살표 눌렀을 때
	anchs[1].onclick = function() {

		var imgAlt = img.getAttribute("alt");
		if (imgAlt == "rowimg3") {
			cnt = 1;
			img.setAttribute("alt", "rowimg1");
			img.setAttribute("src", "resources/assets/images/content/rowimg1.jpg");
		} else {
			img.setAttribute("alt", "img" + (++cnt));
			img.setAttribute("src", "resources/assets/images/content/rowimg" + cnt + ".jpg");
		}
	}
}

	$(document).ready(function() {
		$('div').click(function() {
			$(this).puzzle(100); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)
		});
	});

</script>

</head>
<body>
	
	<a href = "#" id = "lt">◀</a>
		<div class="puzzle2_1">
			<img alt="rowimg1" src="resources/assets/images/content/rowimg1.jpg"/>
		</div>
	<a href = "#" id = "rt">▶</a>
	<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='puzzlerow.do'" >다른 그림 하기</button>
		
</body>
</html>