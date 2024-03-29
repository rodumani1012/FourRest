<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Qurossword - A javascript crossword puzzle plugin</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script> 
<script src="resources/assets/js/jquery.crossword.js"></script>
<script src="resources/assets/js/script.js"></script>

<style type="text/css" media="screen">
/*
		Default puzzle styling
	*/
body {
	font: 62.5%/1.3em Helvetica, sans-serif;
	width: 100%;
	margin: 10px auto;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	max-width: 100%;
}

table tr {
	width: 100%;
}

table td {
	width: 5em;
	height: 5em;
	border: 1px solid #cdcdcd;
	padding: 0;
	margin: 0;
	background-color: #333;
	position: relative;
}

td input {
	width: 100%;
	height: 100%;
	padding: 0em;
	border: none;
	text-align: center;
	font-size: 3em;
	color: #666;
	background-color: #f4f4f4;
}

td input:focus {
	background-color: #fff;
}

td span {
	color: #444;
	font-size: 0.8em;
	position: absolute;
	top: -1px;
	left: 1px;
}

input.done {
	font-weight: bold;
	color: green;
}

.active, .clues-active {
	background-color: #ddd;
}

.clue-done {
	color: #999;
	text-decoration: line-through;
}

#puzzle-wrapper {
	float: left;
	width: 54%;
	margin-right: 3%;
}

#puzzle-clues {
	float: left;
	width: 40%;
}

#puzzle-clues li {
	font-size: 1.2em;
	margin: .3em;
	line-height: 1.6em;
}
</style>

<meta charset="UTF-8">
<title>The Forest</title>
</head>
<body>

<%@ include file="../header.jsp" %>

<div class="culmn">
<br><br><br><br><br>
	<div id="puzzle-wrapper">
		<!-- crossword puzzle appended here -->
	</div>
</div>

</body>
</html>