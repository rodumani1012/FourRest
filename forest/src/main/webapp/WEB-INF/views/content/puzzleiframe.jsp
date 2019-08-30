<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/assets/js/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="resources/assets/js/jquery.puzzle.js"></script>

<script type="text/javascript">
	$(function() {
		$("div.puzzle, p").puzzle(100); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});

	$(function() {
		$("div.puzzle1, p").puzzle(70); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});

	$(function() {
		$("div.puzzle2, p").puzzle(50); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});
</script>

</head>
<body>

	<div class="puzzle" style="float: left;">
		<img src="resources/assets/images/content/imgban.jpg" width="467" height="700" alt="" />
	</div>
	
	<div class="puzzle1" style="float: left;">
		<img src="resources/assets/images/content/imgpyu.jpg" width="256" height="256" alt="" />
	</div>

	<div class="puzzle2" style="float: left;">
		<img src="resources/assets/images/content/imgho.jpg" width="256" height="256" alt="" />
	</div>
</body>
</html>