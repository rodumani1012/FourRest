// A javascript-enhanced crossword puzzle [c] Jesse Weisbeck, MIT/GPL 
(function($) {
	$(function() {
		// provide crossword entries in an array of objects like the following example
		// Position refers to the numerical order of an entry. Each position can have 
		// two entries: an across entry and a down entry
		var puzzleData = [
			 	{
					clue: "1. 석유 연료와 엔진 대신 전기 배터리와 모터로 구동되는 자동차이다. ",
					answer: "전기자동차",
					position: 1,
					orientation: "across",
					startx: 1,
					starty: 1
				},
			 	{
					clue: "3. 바닷물을 이용해 얻을 수 있는 에너지",
					answer: "해양에너지",
					position: 3,
					orientation: "across",
					startx: 7,
					starty: 1
				},
				{
					clue: "3. 알칼리 토류 금속의 하나로 탄산염, 황산염 등의 형태로 존재한다. ",
					answer: "칼슘",
					position: 5,
					orientation: "across",
					startx: 1,
					starty: 3
				},
				{
					clue: "4. 특별시·광역시·도의 자연경관을 대표할 만한 수려한 자연경관지로서 1970년 경북 금오산을 시작으로 2017년 말 기준 29개소가 지정되어 있다. ",
					answer: "도립공원",
					position: 8,
					orientation: "across",
					startx: 1,
					starty: 5
				},
				{
					clue: "5. 가습기 내의 물에 첨가하여 미생물 번식과 물 때 발생 예방을 목적으로 제조된 재제이다.",
					answer: "가습기살균제",
					position: 10,
					orientation: "across",	
					startx: 2,
					starty: 7
				},
				{
					clue: "6. 기본적으로는 전류를 증폭할 수 있는 부품이다.",
					answer: "트렌지스터",
					position: 13,
					orientation: "across",
					startx: 1,
					starty: 9
				},
				{
					clue: "7. 지구를 둘러싸고 있는 기체 상태의 외피를 말한다. ",
					answer: "대기",
					position: 16,
					orientation: "across",
					startx: 1,
					starty: 11
				},
				{
					clue: "8. 자연과 인간, 환경보전과 개발의 양립을 목표로 한 리우회의의 기본 원칙을 담은 선언서이다. ",
					answer: "리우선언",
					position: 17,
					orientation: "across",
					startx: 7,
					starty: 11
				},
				{
					clue: "1. 전기를 내는 가오리로서 전기가오리목에 속하는 모든 종들을 통틀어 이르는 말이다.",
					answer: "전기가오리	",
					position: 1,
					orientation: "down",
					startx: 1,
					starty: 1
				},
				{
					clue: "2. 비교하여 덜어 냄. 또는 비교하여 줄어든 차이. (두글자)",
					answer: "차감",
					position: 2,
					orientation: "down",
					startx: 5,
					starty: 1
				},
				{
					clue: "4.일을 할 수 있는 원기. 정력.",
					answer: "에너지",
					position: 4,
					orientation: "down",
					startx: 9,
					starty: 1
				},
				{
					clue: "7. 도로·철도·수로 등을 통하게 하기 위해 땅속을 뚫은 통로를 말하며 ",
					answer: "터널",
					position: 6,
					orientation: "down",
					startx: 7,
					starty: 3
				},
				{
					clue: "8. 하수를 빨리 배제하기 위한 배수관, 배수도랑, 배수펌프 등의 배수시설과 이것에 연결되어 하수를 처리하는 하수처리장 등의 처리시설을 포함하는 용어",
					answer: "하수도",
					position: 7,
					orientation: "down",
					startx: 11,
					starty: 3
				},
				{
					clue: "10. 해양생물다양성이 풍부하여 생태적으로 중요하거나 해양경관 등 해양자산이 우수하여 특별히 보전할 가치가 큰 구역으로서 국토해양부장관이 지정·고시한다. ",
					answer: "해양보호구역",
					position: 9,
					orientation: "down",
					startx: 5,
					starty: 5
				},
				{
					clue: "12. 해양에 배출·투기된 물질이 바닷물을 오염시키는 것을 말한다. ",
					answer: "해양오염",
					position: 11,
					orientation: "down",
					startx: 11,
					starty: 7
				},
				{
					clue: "13. 무색, 무취의 맹독성 화학물질로, 비슷한 특성과 독성을 가진 여러 화합물을 총칭하는 환경호르몬이다. ",
					answer: "다이옥신",
					position: 12,
					orientation: "down",
					startx: 1,
					starty: 8
				},
				{
					clue: "15. 선진국과 개발도상국 사이의 불공정한 무역때문에 일어나는 개발도상국의 빈곤문제를 해결하기 위한 세계적인 시민운동이자 사업이다. ",
					answer: "공정무역",
					position: 14,
					orientation: "down",
					startx: 3,
					starty: 9
				},
				{
					clue: "16. 주기율표 상의 아래쪽에 주로 위치하고 있는 비중 4 이상의 무거운 금속원소를 말한다. ",
					answer: "중금속",
					position: 15,
					orientation: "down",
					startx: 7,
					starty: 9
				}
			] 
	
		$('#puzzle-wrapper').crossword(puzzleData);
		
	})
	
})(jQuery)
