<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta content="text/html; charset=utf-8" http-equiv="content-type">

<title>SlickQuiz Demo</title>
<link href="resources/assets/css/reset.css" media="screen" rel="stylesheet"
	type="text/css">
<link href="resources/assets/css/slickQuiz.css" media="screen" rel="stylesheet"
	type="text/css">
<link href="resources/assets/css/master.css" media="screen" rel="stylesheet"
	type="text/css">
</head>
<body id="slickQuiz">
	<h1 class="quizName">
		<!-- where the quiz name goes -->
	</h1>

	<div class="quizArea">
		<div class="quizHeader">
			<!-- where the quiz main copy goes -->

			<a class="button startQuiz" href="">시작!</a>
		</div>


		<!-- where the quiz gets built -->
	</div>

	<div class="quizResults">
		<h3 class="quizScore">
			You Scored: <span>
				<!-- where the quiz score goes -->
			</span>
		</h3>

		<h3 class="quizLevel">
			<strong>Ranking:</strong> <span>
				<!-- where the quiz ranking level goes -->
			</span>
		</h3>

		<div class="quizResultsCopy">
			<!-- where the quiz result copy goes -->
		</div>
	</div>
	
	<div class="button startQuiz">
		<button class="btn btn btn-light" type="button" onclick="location.href='main.do'">처음으로</button> 
	</div>
	
	<script src="resources/assets/js/jquery-1.7.min.js"></script>
	<script src="resources/assets/js/slickQuiz-config.js"></script>
	<script src="resources/assets/js/slickQuiz.js"></script>
	<script src="resources/assets/js/master.js"></script>
</body>
</html>