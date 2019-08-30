<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>::Separate Collection Game</title>
<script src="https://use.fontawesome.com/b375198985.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
<!-- 헤더위한 링크 -->
<link rel="stylesheet" href="resources/assets/css/slick.css">
<link rel="stylesheet" href="resources/assets/css/slick-theme.css">
<link rel="stylesheet" href="resources/assets/css/animate.css">
<link rel="stylesheet" href="resources/assets/css/fonticons.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="resources/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css" />
<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
</head>	
	
<style type="text/css">
#game_container {
	margin: 0;
	padding: 0;
	margin-bottom: 20px;
}

#game_container #draggable_container, #game_container #score_container {
	margin-left: 20px;
	width: 530px;
}

#draggable_container {
	overflow-y: scroll;
	height: 620px;
}

#droppable_container {
	height: 750px;
	margin-bottom: 20px;
	margin-right: 200px;
	width: 850px;
}

#game_container .dragthis, #game_container .dropped, #game_container .correct,
	#game_container .incorrect {
	text-align: center;
	cursor: grab;
	background-color: #f2f2f2;
	width: 160px;
	height: 150px;
	padding: 5px;
	float: left;
	margin: 5px 0 0 5px;
	color: #333;
	-webkit-border-radius: 5px; /* Safari 3-4, iOS 1-3.2, Android =1.6 */
	border-radius: 5px;
	/* Opera 10.5, IE9+, Safari 5, Chrome, Firefox 4+, iOS 4, Android 2.1+ */
	/* useful if you don't want a bg color from leaking outside the border: */
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
}

#game_container .dropped, #game_container .correct, #game_container .incorrect
	{
	width: 188px;
	height: 100px;
	margin: 5px 0 0 0;
	font-weight: normal;
	text-align: center;
}

#game_container .dropped img, #game_container .correct img,
	#game_container .incorrect img {
	width: 188px;
	height: 100px;
	font-weight: normal;
	text-align: center;
}

#game_container #draggable_container div.ui-sortable-helper {
	/*박스에 섀도우넣기*/
	-webkit-box-shadow: 3px 3px 5px 0px #333;
	box-shadow: 3px 3px 5px 0px #333;
	-moz-box-shadow: 3px 3px 5px 0px #333;
}

#game_container #droppable_container div.subcontainer {
	text-align: center;
	width: 200px;
	height: 300px;
	border: 2.5px dashed #f0f0f0;
	color: #333;
	/* 	background-color: #FFC; */
	padding: 5px;
	margin: 5px 0 0 5px;
	float: left;
	-webkit-border-radius: 5px; /* Safari 3-4, iOS 1-3.2, Android =1.6 */
	border-radius: 5px;
	/* Opera 10.5, IE9+, Safari 5, Chrome, Firefox 4+, iOS 4, Android 2.1+ */
	/* useful if you don't want a bg color from leaking outside the border: */
	-moz-background-clip: padding;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	background-position: center;
	background-repeat: no-repeat;
}




#game_container #button_container {
	text-align: center;
	width: 656px;
}

#game_container .correct {
	border: 1px solid #393;
	background-color: #AFA;
}

#game_container .incorrect {
	border: 1px solid #933;
	background-color: #FAA;
}

#game_container #score_container, #game_container #message,
	#game_container #startdiv {
	background: #E0DBDB;
	text-align: center;
	color: #666;
	font-size: 1.8em;
	line-height: 1em;
}

#game_container #score_container #score_text {
	padding: 20px;
}

#game_container #message, #game_container #startdiv {
	padding: 20px;
	position: absolute;
	height: 0;
	width: 0;
	border: 1px solid #333;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 3px 3px 5px 0px #333;
	/* Safari 3-4, iOS 4.0.2 - 4.2, Android 2.3+ */
	box-shadow: 3px 3px 5px 0px #333;
	/* Opera 10.5, IE9+, Firefox 4+, Chrome 6+, iOS 5 */
	-moz-box-shadow: 3px 3px 5px 0px #333;
	z-index: 1;
}

#game_container #message #text {
	padding-bottom: 10px;
}

#game_container #score_container .score {
	font-weight: bold;
}

.queimg {
	width: 150px;
	height: 150px;
}
</style>
<style type="text/css">
.modal {
	display: none; 
	position: fixed; 
	z-index: 1; 
	left: 0;
	top: 0;
	width: 100%; 
	height: 100%; 
	overflow: auto; 
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 23%;
}
</style>
<style type="text/css">
p {
	text-align: center;
}

#sw_m,#sw_ms,#sw_s{
color: #d9534f;
}
.btn{
border-radius: 0.3rem;
}
div::-webkit-scrollbar{
     width: 10px; 
     background: transparent;
     overflow-x: hidden; 
} 
</style>
</head>
<body>
<!-- header -->
	<nav
		class="navbar navbar-expand-lg  navbar-fixednavbar navbar-expand-lg  navbar-fixed white bootsnav on no-full">
		<div class="container">
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar-menu">
					<span></span> 
					<span></span> 
					<span></span>
				</button>
				<a class="navbar-brand" href="main.do"> <img
					src="resources/assets/images/logo2.jpg" class="logo logo-scrolled"
					alt="logo">
				</a>
			</div>
			<!-- End Header Navigation -->
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu">
				<ul class="navbar-nav navbar-right">
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='gotomap.do'">지도</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='calrecsel.do'">봉사일정</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='chat.do'">문의하기</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='admin.do'">관리자</button></li>
					<li><button type="button" class="btn btn-link text-dark"
							onclick="location.href='site.do'">관련 사이트</button></li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">환경센터</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="funlist.do">후원하기</a> <a
									class="dropdown-item" href="ani_shelterList.do">보호소</a> <a
									class="dropdown-item" href="ani_endangeredList.do">멸종위기종</a> <a
									class="dropdown-item"
									href="ani_alien.do?board=animal_alien_disturb&txt_search=">외래생물</a>
								<a class="dropdown-item" href="trash.do">쓰레기</a>
							</div>
						</div>
					</li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">게시판</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="contest_main.do">공모게시판</a> <a
									class="dropdown-item" href="#portfolio">리뷰만들어야함</a>
							</div>
						</div>
					</li>
					<li>
						<div class="dropdown">
							<button type="button"
								class="text-dark btn btn-link dropdown-toggle"
								data-toggle="dropdown">컨텐츠</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="content.do">게임</a> <a
									class="dropdown-item" href="youtube.do">관련 영상</a>
							</div>
						</div>
					</li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" var="user_id" />
							<input type="submit" class="btn btn-link text-dark"
								onclick="location.href='mypage.do'" value="${user_id }" />
						</sec:authorize> <sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-link text-dark"
								onclick="location.href='loginform.do'">LOGIN</button>
						</sec:authorize></li>
					<li><sec:authorize access="isAuthenticated()">
							<form:form action="${pageContext.request.contextPath}/logout"
								method="POST">
								<input type="submit" class="btn btn-link text-dark"
									value="LOGOUT" />
							</form:form>
						</sec:authorize></li>
					<li><sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-link text-dark"
								onclick="location.href='joinform.do'">JOIN</button>
						</sec:authorize></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
<!-- 헤더끝  -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="user_id" />
		<input type="hidden" id="imuser" value="${user_id}">
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
	</sec:authorize>
	<div class="row" style="margin-left: 50px;">
		<div class="col-xs-4" id="timer"
			style="text-align: center; padding-top: 10px; margin-left: 2%; margin-top: 5%">
			<audio controls="controls" autoplay="autoplay" loop="loop">
				<source src="resources/audio/pokemonmix.mp3" type="audio/mp3" />
			</audio>
			<h4>
				<span class="badge badge-pill progress-bar-danger">time</span>
				&nbsp;&nbsp;<span id="sw_m">00</span>: <span id="sw_s">00</span>: <span
					id="sw_ms">00</span>
			</h4>
		</div>
		<div class="col-xs-2" style="padding-top: 10px; padding-bottom: 10px; margin-top: 5%">
			<input type="button" class="btn btn-info btn-block" value="Hint"
				id="hint" onclick="open_hintpop();" style="margin-bottom: 10px;" />
			<!-- hint Modal -->
			<div id="hintModal" class="modal">
				<!-- hint content -->
				<div class="modal-content">
					<p>
						<span style="font-size: 14pt;"><b><span
								style="font-size: 24pt;">Hint</span></b></span>
					</p>
					<p style="line-height: 1.5;">
						<br /> <i class="fa fa-leaf"></i>종이팩 : 종이를 가운데두고 양면에 플라스틱이 코팅
						되어있다.
					</p>
					<p style="line-height: 1.5;">
						<i class="fa fa-leaf"></i>종이:플라스틱이 한쪽면에 코팅되거나 종이로만 만들어졌다.
					</p>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_hintpop();">
						<span class="pop_bt" style="font-size: 13pt;">닫기</span>
					</div>
				</div>
			</div>
			<!--End hint Modal-->
			<input type="button" class="btn btn-info btn-block" value="HowToPlay"
				id="howtoplay" onclick="open_playpop();" />
			<!-- play Modal -->
			<div id="playModal" class="modal">
				<!-- play content -->
				<div class="modal-content">
					<p>
						<span style="font-size: 14pt;"><b><span
								style="font-size: 24pt;">HowToPlay</span></b></span>
					</p>
					<p style="line-height: 1.5;">
						<br /> <i class="fa fa-leaf"></i>왼쪽을 드래그해서 오른쪽에 분류해주세요
					</p>
					<p style="line-height: 1.5;">
						<br /> <i class="fa fa-leaf"></i>시간 ! 빠를수록 높은점수를 받을 수 있어요
					</p>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_playpop();">
						<span class="pop_bt" style="font-size: 13pt;">닫기</span>
					</div>
				</div>
			</div>
			<!--End play Modal-->

			<!-- rank modal start -->
			<div id="rankModal" class="modal">
				<!-- hint content -->
				<div class="modal-content">
					<p>
						<span style="font-size: 14pt;"><b><span
								style="font-size: 24pt;">RANK</span></b></span>
					</p>
					<p style="color: red">MY SCORE</p>
					<p style="line-height: 1.5;">
						<i class="fa fa-leaf"></i>맞춘갯수 :<span id="correctcount"></span>
					</p>
					<p style="line-height: 1.5;">
						<i class="fa fa-leaf"></i>걸린 시간 :<span id="takentime"></span>
					</p>
					<p style="line-height: 1.5;">
						<i class="fa fa-leaf"></i>환산 점수:<span id="myscore"></span>
					</p>
					<p style="color: red">TOP RANK</p>
					<div style="overflow-y: scroll; height: 70px; text-align: center; padding-left: 35%">
						<table id="ranktb">
							<tr>
								<td>RANK</td>
								<td>NAME</td>
								<td>SCORE</td>
							</tr>
							<tbody></tbody>
						</table>
					</div>
					<div
						style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px;"
						onClick="close_rankpop();" id="rankclosebtn">
						<span class="pop_bt" style="font-size: 13pt;">닫기</span>
					</div>
				</div>
			</div>
			<!-- rank modal end -->
		</div>
		<div class="col-xs-4" style="padding-top: 10px; padding-bottom: 10px; margin-top: 5%">
			<div id="score_container">
				<div id="score_text"></div>
			</div>
			<div id="button_container">
				<input type="button" class="btn btn-success btn-block"
					value="End game" id="check_button" style="margin-bottom: 10px;"/> <input type="button"
					class="btn btn-success btn-block" value="Restart" id="reset_button" />
			</div>
		</div>
	</div>

	<div class="matchgame">
		<div id="game_container" class="row">
			<div id="message">
				<div id="text"></div>
				<input type="button" class="btn btn-secondary btn-block" value="OK" id="ok_button" />
			</div>
			<div id="startdiv" style="border: none; background: none;">
				<div id="text"></div>
				<input type="button" class="btn btn-danger btn-block btn-lg"
					value="Game Start" id="sw_start" onclick="timerstart()" style="height: 600px;"/>
			</div>
			<div class="col-xs-4" style="padding-left: 50px; padding-right: 0px; margin-right: 70px;">
				<div id="draggable_container"></div>
			</div>
			<div class="col-xs-7" style="padding: 0px;">
				<div id="droppable_container"></div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	// 모달     
	jQuery(document).ready(function() {
		$('#hintModal','#playModal','#rankModal').hide();
	});

	function open_hintpop(flag) {
		$('#hintModal').show();
	};
	function close_hintpop(flag) {
		$('#hintModal').hide();
	};
	//playModal
	function open_playpop(flag) {
		$('#playModal').show();
	};
	function close_playpop(flag) {
		$('#playModal').hide();
	};
	//rankModal
	function open_rankpop(flag) {
		$('#rankModal').show();
	};
	function close_rankpop(flag) {
		$('#rankModal').hide();		
	};
	
</script>
<script type="text/javascript">
	// 	var intervalfortimer;
	var isPause = false;

	function timerstart() {
		$('#startdiv').hide();
		isPause = false;
		setInterval(updateDisplay, 4);
	}

	function updateDisplay() {
		if (isPause) {
			return;
		}
		var ms = parseInt($('#timer').find('#sw_ms').text(), 10);
		var sec = parseInt($('#timer').find('#sw_s').text(), 10);
		var min = parseInt($('#timer').find('#sw_m').text(), 10);

		ms += 4;
		if (ms > 999) {
			ms = '00';
			sec++;
		}
		if (sec > 59) {
			sec = '00';
			min++;
		}
		
		if (('' + ms).length < 3) {
			ms = '0' + ms;
			if ((ms).length < 3) {
				ms = '0' + ms;
				if ((ms).length < 3) {
					ms = '0' + ms;
				}
			}
		}
		if (('' + sec).length < 2) {
			sec = '0' + sec;
		}
		if (('' + min).length < 2) {
			min = '0' + min;
		}

		$('#timer').find('#sw_m').text(min);
		$('#timer').find('#sw_s').text(sec);
		$('#timer').find('#sw_ms').text(ms);

	}
</script>
<script type="text/javascript">
	$(function() {

		var answers = [ {
			"text" : "과자봉지",
			"order" : "1",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic01.png'/>"
		}, {
			"text" : "참치캔",
			"order" : "2",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic03.png'/>"
		}, {
			"text" : "맥주캔",
			"order" : "3",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic08.png'/>"
		}, {
			"text" : "과일주스팩",
			"order" : "4",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic05.png'/>"
		}, {
			"text" : "사진",
			"order" : "5",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic07.png'/>"
		}, {
			"text" : "영수증",
			"order" : "6",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic06.png'/>"
		}, {
			"text" : "와인잔",
			"order" : "7",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic10.png'/>"
		}, {
			"text" : "포카리스웨트",
			"order" : "8",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic02.png'/>"
		}, {
			"text" : "소주병",
			"order" : "9",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic09(2).png'/>"
		}, {
			"text" : "종이컵",
			"order" : "10",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic22.png'/>"
		}, {
			"text" : "신문",
			"order" : "11",
			"pic" : "<img class='queimg' src='resources/image/sorting/pic20.png'/>"
		}, {
			"text" : "일회용수저",
			"order" : "12",
			"pic" : "<img class='queimg' style='padding-bottom:5px;' src='resources/image/sorting/pi.png'/>"
		}, {
			"text" : "계란",
			"order" : "13",
			"pic" : "<img class='queimg' style='padding-bottom:5px;' src='resources/image/sorting/egg.png'/>"
		}, {
			"text" : "종이쇼핑백",
			"order" : "14",
			"pic" : "<img class='queimg' style='padding-bottom:5px;' src='resources/image/sorting/bag.png'/>"
		}, {
			"text" : "반찬통",
			"order" : "15",
			"pic" : "<img class='queimg' style='padding-bottom:5px;' src='resources/image/sorting/chan.png'/>"
		}




		];

		var subcontainers = [ {
			"text" : 'plastic',
			"id" : "plastic",
			"pic" : "<img src='resources/image/sorting/re_plastic.png'/>",
			"url" : 'resources/image/sorting/re_plastic.png'
		}, {
			"text" : "pet",
			"id" : "pet",
			"pic" : "<img src='resources/image/sorting/re_pet.png'/>",
			"url" : 'resources/image/sorting/re_pet.png'

		}, {
			"text" : "paper",
			"id" : "paper",
			"pic" : "<img src='resources/image/sorting/re_paper.png'/>",
			"url" : 'resources/image/sorting/re_paper.png'
		}, {
			"text" : "paperpack",
			"id" : "paperpack",
			"pic" : "<img src='resources/image/sorting/re_pack.png'/>",
			"url" : 'resources/image/sorting/re_pack.png'
		}, {
			"text" : "metal",
			"id" : "metal",
			"pic" : "<img src='resources/image/sorting/re_can.png'/>",
			"url" : 'resources/image/sorting/re_can.png'
		}, {
			"text" : "glass",
			"id" : "glass",
			"pic" : "<img src='resources/image/sorting/re_glass.png'/>",
			"url" : 'resources/image/sorting/re_glass.png'
		}, {
			"text" : "vinyl",
			"id" : "vinyl",
			"pic" : "<img src='resources/image/sorting/re_vynil.png'/>",
			"url" : 'resources/image/sorting/re_vynil.png'
		}, {
			"text" : "landfill",
			"id" : "landfill",
			"pic" : "<img src='resources/image/sorting/일반.png'/>",
			"url" : 'resources/image/sorting/일반.png'
		} ];

		var plastic_correct = new Array('answer12','answer15');
		var vinyl_correct = new Array('answer1');
		var metal_correct = new Array('answer2', 'answer3');
		var glass_correct = new Array('answer9');
		var paper_correct = new Array('answer11','answer14');
		var landfill_correct = new Array('answer7', 'answer6', 'answer5','answer13');
		var paperpack_correct = new Array('answer4','answer10');
		var pet_correct = new Array('answer8');
		reset_game(); // 

		$('#reset_button').click(function() {
			reset_game();
		});

		$('#check_button').click(function() {
			$("#game_container .qanswer").promise().done(function() {
				score_game(); // 
			});
		});

		$('#game_container #ok_button').click(function() {
			$('#game_container #message').animate({
				width : '0',
				height : '0',
				padding : '0',
				opacity : 0
			}, 1000).hide(1000);
		});

		function reset_game() {
			//스타트 버튼 디브 올리기
			$('#game_container #startdiv').show().css({
				top : $("#droppable_container").position().top + 180,
				left : $("#droppable_container").position().left + 70
			}).animate({
				width : '500px',
				height : '630px',
				padding : '20px',
				opacity : 1
			}, 500);
			
			//타이머스탑
			isPause = true;
			//시간초기화
			$('#timer').find('#sw_m').text('00');
			$('#timer').find('#sw_s').text('00');
			$('#timer').find('#sw_ms').text('000');

			//드래거블리셋
			$('#game_container .col-xs-4 #draggable_container').html('')
					.removeClass();
			//드로퍼블리셋
			$('#game_container .col-xs-7 #droppable_container').html('');

			//check 못끝내게 
			$('#check_button').removeAttr('disabled');

			// 
			$('#game_container #message').hide();
			$('#score_container').hide();

			// 드로퍼블 디브생성
			for (var j = 0; j < 8; j++) {
				$('<div><strong>' + subcontainers[j].text + '</strong></div>')
						.css('background-image','url(' + subcontainers[j].url + ')')
						.css('overflow-y','scroll')
						.attr('class', 'subcontainer')
						.attr('id', subcontainers[j].id)
						.appendTo('#game_container #droppable_container')
						.sortable(
								{
									containment : "#game_container",
									cursor : "grab",
									items : "div",
									revert : 100,
									connectWith : "#game_container .subcontainer",
									receive : function(event, ui) {
										if (ui.item.parents('#game_container .subcontainer')) {
											ui.item.removeClass('dragthis').addClass('dropped');
										} else {
											ui.item.removeClass('dropped').addClass('dragthis');
										}
									}
								}).disableSelection();
			}

			// 랜덤
			answers.sort(function() {
				return (Math.round(Math.random()) - 0.5);
			});

			// sortable
			for (var i = 0; i < answers.length; i++) {
				$('<div>' + answers[i].pic + '</div>')
				.attr('id','answer' + answers[i].order)
				.attr('class','dragthis qanswer')
				.appendTo('#game_container #draggable_container')
				.disableSelection();
			}
			$("#game_container #draggable_container")
			.sortable({
				connectWith : '#game_container .subcontainer',
				containment : '#game_container',
				cursor : 'grab',
				items : 'div',
				revert : 250
			}).disableSelection();
		}

		function score_game() {
			//
			if (!$("#game_container #draggable_container").is(":empty")) {
				$('#game_container #message #text').html('모두 분류하세요');
				$('#game_container #message').show()
				.css({
					top : $("#droppable_container").position().top + 150,
					left : $("#droppable_container").position().left + 100
				})
				.animate({
					width : '450px',
					height : '100px',
					padding : '20px',
					opacity : 1
				}, 500);

				return;
			}
			//타이머스탑
			isPause = true;
			//타이머값가져오기
			var fi_ms = parseInt($('#timer').find('#sw_ms').text(), 10);
			var fi_sec = parseInt($('#timer').find('#sw_s').text(), 10);
			var fi_min = parseInt($('#timer').find('#sw_m').text(), 10);
			var timercount = '' + fi_min + ':' + fi_sec + ':' + fi_ms;
// 			console.log('' + fi_min + ':' + fi_sec + ':' + fi_ms);

			$("#game_container .subcontainer").each(function(index) {
				$(this).sortable("option", "disabled", true);
			});

			$('#game_container #button_container #check_button').attr("disabled", "disabled");

			$correctcounter = 0;
			$("#game_container .dropped")
					.each(
							function(index) {
								$thisid = $(this).attr('id');
								$parentid = $(this).parent().attr('id');
								$(this).css('cursor', 'default');
								if ( // 
								($.inArray($thisid, plastic_correct) > -1 && $parentid == 'plastic')
										|| ($.inArray($thisid, pet_correct) > -1 && $parentid == 'pet')
										|| ($.inArray($thisid, vinyl_correct) > -1 && $parentid == 'vinyl')
										|| ($.inArray($thisid, metal_correct) > -1 && $parentid == 'metal')
										|| ($.inArray($thisid, glass_correct) > -1 && $parentid == 'glass')
										|| ($.inArray($thisid, paper_correct) > -1 && $parentid == 'paper')
										|| ($.inArray($thisid, paperpack_correct) > -1 && $parentid == 'paperpack')
										|| ($.inArray($thisid,landfill_correct) > -1 && $parentid == 'landfill')

								) {
									$(this).addClass('correct', 800)
											.removeClass('dropped', 800); // 
									$correctcounter++; // +1 
								} else {
									$(this).addClass('incorrect', 800)
											.removeClass('dropped', 800); //
								}
							});

			$('#correctcount').html($correctcounter);
			$('#takentime').html(timercount);
			var totalsec = (fi_min * 60) + (fi_sec);
			var myscore = ($correctcounter * 50) + (300 - totalsec);
			$('#myscore').html(myscore);

			//rank ajax 가져오기
			var imuser = $('#imuser').val();
			if(imuser==null){
				alert("랭크를 확인하기위해 로그인을해주세요");
				return;
			}
			$.ajax({
				url : "getrank.do",
				type : 'post',
				data : {
					"correctcount" : $correctcounter,
					"takentime" : totalsec,
					"userid" : imuser
				},
				dateType : "json",
				success : function(map) {
					var ranklist = [];
					ranklist = map.ranklist;

					$.each(map.ranklist, function(index, arrjson) {
						$('#ranktb > tbody:last').append(
								"<tr><td>" + arrjson.rn + "</td><td>"
										+ arrjson.userid + "</td><td>"
										+ arrjson.score + "</td></tr>");
					});

				},
				fail : function() {
					alert('에러');
					self.close();
				}
			});
			open_rankpop();
		}
	})
</script>
</html>