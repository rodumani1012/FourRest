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
		$("div.puzzle, p").puzzle(50); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});

	$(function() {
		$("div.puzzle1, p").puzzle(80); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});

	$(function() {
		$("div.puzzle2, p").puzzle(120); //퍼즐조각 사이즈 (작으면 작을수록 어려워집니다)		
	});
</script>

</head>
<body>

	<div class="puzzle" style="float: left;">
		<img src="resources/assets/images/content/ban.png" width="398" height="331" alt="" />
	</div>
	
	<div class="puzzle1" style="float: left;">
		<img src="resources/assets/images/content/gam.png" width="387" height="254" alt="" />
	</div>

	<div class="puzzle2" style="float: left;">
		<img src="resources/assets/images/content/all.png" width="300" height="300" alt="" />
	</div>
</body>
</html>