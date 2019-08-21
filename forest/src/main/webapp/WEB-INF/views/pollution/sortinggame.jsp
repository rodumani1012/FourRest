<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>분리수거 게임</title>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style type="text/css">
#game_container {
/* 	width: 656px; */
	margin: 0;
	padding: 0;
	margin-bottom: 20px;
	border:10px solid pink;
}

#game_container #draggable_container, #game_container #droppable_container,
	#game_container #score_container {
	border: 5px solid #999; /*드래거블 드로퍼블디브*/
	width: 656px;
	margin-bottom: 20px;
}

#game_container #draggable_container {
	height: 500px;
}

#game_container #droppable_container {
	height: 830px;
}

#game_container #score_container {
	/*	height: 80px;*/
	
}

#game_container .dragthis, #game_container .dropped, #game_container .correct,
	#game_container .incorrect {
	text-align: center;
	cursor: move;
	background-color: #f2f2f2;
	width: 160px;
	height: 150px;
	border: 3px solid #333; /*그림잡는디브 */
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
	margin: 5px 0 0 0;
	font-weight: normal;
	text-align: center;
}

#game_container #draggable_container div.ui-sortable-helper {/*박스에 섀도우넣기*/
	-webkit-box-shadow: 3px 3px 5px 0px #333;
	box-shadow: 3px 3px 5px 0px #333;
	-moz-box-shadow: 3px 3px 5px 0px #333;
}

#game_container #droppable_container div.subcontainer {
	text-align: center;
	width: 200px;
	height: 400px;
	border: 1px solid #990;
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

#game_container #score_container, #game_container #message {
	background: #E0DBDB;
	text-align: center;
	color: #666;
	font-size: 1.8em;
	line-height: 1em;
}

#game_container #score_container #score_text {
	padding: 20px;
}

#game_container #message {
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
}

#game_container #message #text {
	padding-bottom: 10px;
}

#game_container #score_container .score {
	font-weight: bold;
}

img {
	width: 150px;
	height: 150px;
}
</style>

</head>
<body>
	<div class="row">
		
		<div class="col-xs-3" id="timer" style="border: solid 3px">
			<br/>
			<h4><span class="badge badge-pill progress-bar-danger">소요시간</span>
			&nbsp;&nbsp;<span id="sw_m">00</span>: <span id="sw_s">00</span>: <span id="sw_ms">00</span></h4>
			<br/>
		</div>
		<div class="col-xs-3" style="border: solid 3px">
			<input type="button" class="btn btn-info btn-block" value="hint보기" id="hint" onclick="#" /> 
			<input type="button" class="btn btn-info btn-block" value="게임방법" id="howtoplay" onclick="#" /> 
		</div>
	</div>

	<div class="matchgame">
		
		<div id="game_container">
		<input type="button" class="btn btn-danger btn-block" value="Game Start" id="sw_start" onclick="timerstart()" /> 
			<div id="message">
				<div id="text"></div>
				<input type="button" value="OK" id="ok_button" />
			</div>
			<div id="draggable_container"></div>
			<div id="droppable_container"></div>
			<div id="score_container">
				<div id="score_text"></div>
			</div>
			<div id="button_container">
				<input type="button" value="Check Answers" id="check_button" /> <input
					type="button" value="Reset" id="reset_button" />
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function timerstart() {
		setInterval(updateDisplay, 4);
	}

	function updateDisplay() {
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
			"pic" : "<img src='resources/image/sorting/pic01.png'/>"
		}, {
			"text" : "참치캔",
			"order" : "2",
			"pic" : "<img src='resources/image/sorting/pic03.png'/>"
		}, {
			"text" : "맥주캔",
			"order" : "3",
			"pic" : "<img src='resources/image/sorting/pic08.png'/>"
		}, {
			"text" : "과일주스팩",
			"order" : "4",
			"pic" : "<img src='resources/image/sorting/pic05.png'/>"
		}, {
			"text" : "사진",
			"order" : "5",
			"pic" : "<img src='resources/image/sorting/pic07.png'/>"
		}, {
			"text" : "영수증",
			"order" : "6",
			"pic" : "<img src='resources/image/sorting/pic06.png'/>"
		}, {
			"text" : "와인잔",
			"order" : "7",
			"pic" : "<img src='resources/image/sorting/pic10.png'/>"
		}, {
			"text" : "포카리스웨트",
			"order" : "8",
			"pic" : "<img src='resources/image/sorting/pic02.png'/>"
		}, {
			"text" : "소주병",
			"order" : "9",
			"pic" : "<img src='resources/image/sorting/pic09(2).png'/>"
		} ];

		//

		var subcontainers = [ {
			"text" : "plastic",
			"id" : "plastic"
		}, {
			"text" : "vinyl",
			"id" : "vinyl"
		}, {
			"text" : "metal",
			"id" : "metal"
		}, {
			"text" : "glass",
			"id" : "glass"
		}, {
			"text" : "paper",
			"id" : "paper"
		}, {
			"text" : "landfill",
			"id" : "landfill"
		}

		];

		var plastic_correct = new Array('answer8');
		var vinyl_correct = new Array('answer1');
		var metal_correct = new Array('answer2', 'answer3');
		var glass_correct = new Array('answer9');
		var paper_correct = new Array('answer4');
		var landfill_correct = new Array('answer7', 'answer6', 'answer5');

		reset_game(); // 

		$('#game_container #button_container #reset_button').click(function() {
			reset_game();
		});

		$('#game_container #button_container #check_button').click(function() {
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
			// 
			$('#game_container #draggable_container').html('').removeClass();
			$('#game_container #droppable_container').html('');

			// 
			$('#game_container #check_button').removeAttr('disabled');

			// 
			$('#game_container #message').hide();
			$('#game_container #score_container').hide();

			// 
			for (var j = 0; j < 6; j++) {
				$('<div><strong>' + subcontainers[j].text + '</strong></div>')
						.attr('class', 'subcontainer')
						.attr('id', subcontainers[j].id)
						.appendTo('#game_container #droppable_container')
						.sortable(
								{
									containment : "#game_container",
									cursor : "move",
									items : "div",
									revert : 250,
									connectWith : "#game_container .subcontainer",
									receive : function(event, ui) {
										if (ui.item
												.parents('#game_container .subcontainer')) {
											ui.item.removeClass('dragthis')
													.addClass('dropped');
										} else {
											ui.item.removeClass('dropped')
													.addClass('dragthis');
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
				$('<div>' + answers[i].pic + '</div>').attr('id',
						'answer' + answers[i].order).attr('class',
						'dragthis qanswer').appendTo(
						'#game_container #draggable_container')
						.disableSelection();
			}
			$("#game_container #draggable_container").sortable({
				connectWith : '#game_container .subcontainer',
				containment : '#game_container',
				cursor : 'move',
				items : 'div',
				revert : 250
			}).disableSelection();
		}

		function score_game() {
			//
			if (!$("#game_container #draggable_container").is(":empty")) {

				$('#game_container #message #text').html('모두다 분류해주세요');

				$('#game_container #message').show().css(
						{
							top : $("#game_container #droppable_container")
									.position().top - 50,
							left : $("#game_container #droppable_container")
									.position().left + 100
						}).animate({
					width : '450px',
					height : '80px',
					padding : '20px',
					opacity : 1
				}, 500);

				return;
			}

			$("#game_container .subcontainer").each(function(index) {
				$(this).sortable("option", "disabled", true);
			});

			$('#game_container #button_container #check_button').attr(
					"disabled", "disabled");

			$correctcounter = 0;
			$("#game_container .dropped")
					.each(
							function(index) {
								$thisid = $(this).attr('id');
								$parentid = $(this).parent().attr('id');
								$(this).css('cursor', 'default');
								if ( // 
								($.inArray($thisid, plastic_correct) > -1 && $parentid == 'plastic')
										|| ($.inArray($thisid, vinyl_correct) > -1 && $parentid == 'vinyl')
										|| ($.inArray($thisid, metal_correct) > -1 && $parentid == 'metal')
										|| ($.inArray($thisid, glass_correct) > -1 && $parentid == 'glass')
										|| ($.inArray($thisid, paper_correct) > -1 && $parentid == 'paper')
										|| ($
												.inArray($thisid,
														landfill_correct) > -1 && $parentid == 'landfill')

								) {
									$(this).addClass('correct', 800)
											.removeClass('dropped', 800); // 
									$correctcounter++; // +1 
								} else {
									$(this).addClass('incorrect', 800)
											.removeClass('dropped', 800); //
								}
							});

			$('#game_container #score_container #score_text').html(
					'You got <span class="score">' + $correctcounter
							+ '</span> out of 9 correct!');
			$('#game_container #score_container').slideDown(500);
		}
	})
</script>


</html>