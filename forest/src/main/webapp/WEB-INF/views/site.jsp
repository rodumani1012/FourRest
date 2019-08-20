<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sub_network ul {
	margin-left: 0px;
	margin-bottom: 50px;
}

.sub_network li {
	display: inline-block;
	width: 190px;
	margin-right: 10px;
	vertical-align: top;
}
li > a{
	color: black;
}

div > h4{
	color: #F29661;
}
</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="culmn">
		<%@ include file="./header.jsp"%>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="container">
			<div class="intro">
				<h2 class="contents_tit">
					<span> 환경관련 사이트 </span>
				</h2>
			</div>

			<div style="margin-top: 20px">
				<div class="sub_network">
					<h4 class="circle_st">관련부처</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.president.go.kr" target="_blank"
							style="cursor: pointer;">청와대</a></li>
						<li><a href="http://www.pmo.go.kr/pmo/index.jsp"
							target="_blank" style="cursor: pointer;">국무조정실</a></li>
						<li><a href="http://www.me.go.kr/index.jsp" target="_blank"
							style="cursor: pointer;">환경부</a></li>
						<li><a href="http://www.mltm.go.kr/portal.do" target="_blank"
							style="cursor: pointer;">국토교통부</a></li>
					</ul>

					<h4 class="circle_st">환경부 소속 및 유관기관</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.kma.go.kr/" target="_blank"
							style="cursor: pointer;">기상청</a></li>
						<li><a href="http://edc.me.go.kr/" target="_blank"
							style="cursor: pointer;">중앙환경분쟁조정위원회</a></li>
						<li><a href="http://www.nier.go.kr/" target="_blank"
							style="cursor: pointer;">국립환경과학원</a></li>
						<li><a href="http://www.nibr.go.kr/" target="_blank"
							style="cursor: pointer;">국립생물자원관</a></li>
						<li><a href="https://ehrd.me.go.kr/member/index.do"
							target="_blank" style="cursor: pointer;">국립환경인력개발원</a></li>
						<li><a href="http://www.me.go.kr/hg/index.jsp"
							target="_blank" style="cursor: pointer;">한강유역환경청</a></li>
						<li><a href="http://www.me.go.kr/ndg/index.jsp"
							target="_blank" style="cursor: pointer;">낙동강유역환경청</a></li>
						<li><a href="http://www.me.go.kr/gg/index.jsp"
							target="_blank" style="cursor: pointer;">금강유역환경청</a></li>
						<li><a href="http://www.me.go.kr/ysg/index.jsp"
							target="_blank" style="cursor: pointer;">영산강유역환경청</a></li>
						<li><a href="http://www.me.go.kr/mamo/index.jsp"
							target="_blank" style="cursor: pointer;">수도권대기환경청</a></li>
						<li><a href="http://www.me.go.kr/wonju/index.jsp"
							target="_blank" style="cursor: pointer;">원주지방환경청</a></li>
						<li><a href="http://www.me.go.kr/daegu/index.jsp"
							target="_blank" style="cursor: pointer;">대구지방환경청</a></li>
						<li><a href="http://www.me.go.kr/jeonju/index.jsp"
							target="_blank" style="cursor: pointer;">새만금지방환경청</a></li>
						<li><a href="http://www.knps.or.kr/portal/main.do"
							target="_blank" style="cursor: pointer;">국립공원관리공단</a></li>
						<li><a href="http://www.slc.or.kr/design/index.asp"
							target="_blank" style="cursor: pointer;">수도권매립지관리공사</a></li>
						<li><a href="http://www.keiti.re.kr/" target="_blank"
							style="cursor: pointer;">한국환경산업기술원</a></li>
						<li><a href="http://www.keco.or.kr/" target="_blank"
							style="cursor: pointer;">한국환경공단</a></li>
					</ul>

					<h4 class="circle_st">연구기관</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.nrcs.re.kr/" target="_blank"
							style="cursor: pointer;">경제·인문사회연구회</a></li>
						<li><a href="http://www.stepi.re.kr/" target="_blank"
							style="cursor: pointer;">과학기술정책연구원</a></li>
						<li><a href="http://www.krihs.re.kr/" target="_blank"
							style="cursor: pointer;">국토연구원</a></li>
						<li><a href="http://www.kiep.go.kr/" target="_blank"
							style="cursor: pointer;">대외경제정책연구원</a></li>
						<li><a href="http://www.kiet.re.kr/" target="_blank"
							style="cursor: pointer;">산업연구원</a></li>
						<li><a href="http://www.keei.re.kr/main.nsf/index.html"
							target="_blank" style="cursor: pointer;">에너지경제연구원</a></li>
						<li><a href="http://www.kisdi.re.kr/" target="_blank"
							style="cursor: pointer;">정보통신정책연구원</a></li>
						<li><a href="http://www.kinu.or.kr/" target="_blank"
							style="cursor: pointer;">통일연구원</a></li>
						<li><a href="http://www.kdi.re.kr/" target="_blank"
							style="cursor: pointer;">한국개발연구원</a></li>
						<li><a href="http://www.kice.re.kr/" target="_blank"
							style="cursor: pointer;">한국교육과정평가원</a></li>
						<li><a href="http://www.koti.re.kr/" target="_blank"
							style="cursor: pointer;">한국교통연구원</a></li>
						<li><a href="http://www.kli.re.kr/" target="_blank"
							style="cursor: pointer;">한국노동연구원</a></li>
						<li><a href="http://www.krei.re.kr/kor/main.php"
							target="_blank" style="cursor: pointer;">한국농촌경제연구원</a></li>
						<li><a href="http://www.klri.re.kr/" target="_blank"
							style="cursor: pointer;">한국법제연구원</a></li>
						<li><a href="http://www.kihasa.re.kr/" target="_blank"
							style="cursor: pointer;">한국보건사회연구원</a></li>
						<li><a href="http://www.kwdi.re.kr/" target="_blank"
							style="cursor: pointer;">한국여성정책연구원</a></li>
						<li><a href="http://www.kipf.re.kr/" target="_blank"
							style="cursor: pointer;">한국조세재정연구원</a></li>
						<li><a href="http://www.krivet.re.kr/" target="_blank"
							style="cursor: pointer;">한국직업능력개발원</a></li>
						<li><a href="http://www.nypi.re.kr/" target="_blank"
							style="cursor: pointer;">한국청소년정책연구원</a></li>
						<li><a href="http://www.kmi.re.kr/" target="_blank"
							style="cursor: pointer;">한국해양수산개발원</a></li>
						<li><a href="http://www.kipa.re.kr/" target="_blank"
							style="cursor: pointer;">한국행정연구원</a></li>
						<li><a href="http://www.kic.re.kr/" target="_blank"
							style="cursor: pointer;">한국형사정책연구원</a></li>
					</ul>

					<h4 class="circle_st">지방연구기관</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.sdi.re.kr/" target="_blank"
							style="cursor: pointer;">서울시정개발연구원</a></li>
						<li><a href="http://www.gri.re.kr/korea/jsp/main/main.jsp"
							target="_blank" style="cursor: pointer;">경기개발연구원</a></li>
						<li><a href="http://www.idi.re.kr/" target="_blank"
							style="cursor: pointer;">인천발전연구원</a></li>
						<li><a href="http://www.logodi.go.kr//" target="_blank"
							style="cursor: pointer;">지방행정연수원</a></li>
						<li><a href="http://www.kdri.re.kr/hb/main/" target="_blank"
							style="cursor: pointer;">강원발전연구원</a></li>
						<li><a href="http://www.cdi.re.kr/index.asp" target="_blank"
							style="cursor: pointer;">충남발전연구원</a></li>
						<li><a href="http://www.djdi.re.kr/" target="_blank"
							style="cursor: pointer;">대전발전연구원</a></li>
						<li><a href="http://cri.re.kr/" target="_blank"
							style="cursor: pointer;">충북발전연구원</a></li>
						<li><a href="http://www.jeri.re.kr/" target="_blank"
							style="cursor: pointer;">전남발전연구원</a></li>
						<li><a href="http://www.gji.re.kr/xe/index.php/"
							target="_blank" style="cursor: pointer;">광주발전연구원</a></li>
						<li><a href="http://www.jthink.kr/" target="_blank"
							style="cursor: pointer;">전북발전연구원</a></li>
						<li><a href="http://www.gndi.re.kr/" target="_blank"
							style="cursor: pointer;">경남발전연구원</a></li>
						<li><a href="http://www.bdi.re.kr/main/" target="_blank"
							style="cursor: pointer;">부산발전연구원</a></li>
						<li><a href="http://www.daegulbd.or.kr/" target="_blank"
							style="cursor: pointer;">대구발전연구원</a></li>
						<li><a href="http://www.jdi.re.kr/" target="_blank"
							style="cursor: pointer;">제주발전연구원</a></li>
					</ul>

					<h4 class="circle_st">NGO</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.eco.or.kr/" target="_blank"
							style="cursor: pointer;">환경정의</a></li>
						<li><a href="http://www.greenkorea.org/" target="_blank"
							style="cursor: pointer;">녹색연합</a></li>
						<li><a href="http://www.greentransport.org/" target="_blank"
							style="cursor: pointer;">녹색교통</a></li>
						<li><a href="http://www.kfem.or.kr/" target="_blank"
							style="cursor: pointer;">환경운동연합</a></li>
						<li><a href="http://www.ecofem.or.kr/" target="_blank"
							style="cursor: pointer;">여성환경연대</a></li>
						<li><a href="http://www.gcn.or.kr/" target="_blank"
							style="cursor: pointer;">녹색소비자연대</a></li>
						<li><a href="http://www.forest.or.kr/index.php"
							target="_blank" style="cursor: pointer;">생명의 숲 가꾸기 운동본부</a></li>
						<li><a href="http://www.ymcakorea.org/" target="_blank"
							style="cursor: pointer;">한국YMCA전국연맹</a></li>
						<li><a href="http://www.carngo.org/new_carngo/main.html"
							target="_blank" style="cursor: pointer;">교통문화운동본부</a></li>
						<li><a href="http://www.ccej.or.kr/" target="_blank"
							style="cursor: pointer;">경제정의실천시민연합</a></li>
						<li><a href="http://www.peoplepower21.org/" target="_blank"
							style="cursor: pointer;">참여연대</a></li>
						<li><a href="http://www.ccej.or.kr/index.php?mid=page_org_3"
							target="_blank" style="cursor: pointer;">경실연 도시개혁센터</a></li>
						<li><a href="http://www.dosi.or.kr/" target="_blank"
							style="cursor: pointer;">걷고 싶은 도시 만들기 시민연대</a></li>
					</ul>

					<h4 class="circle_st">환경관련협회</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.epa.or.kr/main.jsp" target="_blank"
							style="cursor: pointer;">환경보전협회</a></li>
						<li><a href="http://www.kcma.or.kr/" target="_blank"
							style="cursor: pointer;">한국화학물질관리협회</a></li>
						<li><a href="http://www.kwwa.or.kr/" target="_blank"
							style="cursor: pointer;">한국상하수도협회</a></li>
						<li><a href="http://www.aea.or.kr/" target="_blank"
							style="cursor: pointer;">한국자동차환경협회</a></li>
						<li><a href="http://koreca.or.kr/" target="_blank"
							style="cursor: pointer;">한국환경컨설팅협회</a></li>
						<li><a href="http://www.kwaste.or.kr/index.do"
							target="_blank" style="cursor: pointer;">한국폐기물협회</a></li>
						<li><a href="http://www.eiaa.or.kr/" target="_blank"
							style="cursor: pointer;">환경영향평가협회</a></li>
					</ul>
					<h4 class="circle_st">환경관련학회</h4>
					<ul class="newlist pl10">
						<li><a href="http://www.kpa1959.or.kr/" target="_blank"
							style="cursor: pointer;">대한국토도시계획학회</a></li>
						<li><a href="http://www.gskorea.or.kr/" target="_blank"
							style="cursor: pointer;">대한지질학회</a></li>
						<li><a href="http://www.kosenv.or.kr" target="_blank"
							style="cursor: pointer;">대한환경공학회</a></li>
						<li><a href="http://www.kosae.or.kr/" target="_blank"
							style="cursor: pointer;">한국대기환경학회</a></li>
						<li><a href="http://www.kagis.or.kr/" target="_blank"
							style="cursor: pointer;">한국지리정보학회</a></li>
						<li><a href="http://www.kswe.org/" target="_blank"
							style="cursor: pointer;">한국물환경학회</a></li>
						<li><a href="http://www.ecosk.org/" target="_blank"
							style="cursor: pointer;">한국생태학회</a></li>
						<li><a href="http://www.resourceeconomics.or.kr/"
							target="_blank" style="cursor: pointer;">한국자원경제학회</a></li>
						<li><a href="http://www.kaps.or.kr/src/main/main.php"
							target="_blank" style="cursor: pointer;">한국정책학회</a></li>
						<li><a href="http://www.kossge.or.kr/" target="_blank"
							style="cursor: pointer;">한국지하수토양환경학회</a></li>
						<li><a href="http://www.ela.or.kr/" target="_blank"
							style="cursor: pointer;">한국환경법학회</a></li>
						<li><a href="http://www.eia.or.kr/korean/" target="_blank"
							style="cursor: pointer;">한국환경영향평가학회</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>