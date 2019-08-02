<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOREST-JOIN</title>
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
<link rel="stylesheet" href="resources/assets/css/bootsnav.css">

<!--For Plugins external css-->
<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

<!--Theme custom css -->
<link rel="stylesheet" href="resources/assets/css/style.css">
<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

<!--Theme Responsive css-->
<link rel="stylesheet" href="resources/assets/css/responsive.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	
	function idChk() {
		var idchk = document.getElementsByName("id")[0];
		if(idchk.value.trim()=="" || idchk.value==null){
			alert("아이디를 입력해주세요");
		}else{
			open("idChk.do?id="+idchk.value,"","width=200,height=200");
		}
	}
	
	function chkpw(){
		var pw = $("#pw").val();
		var pwchk = $("#pwchk").val();		
		if(pw!=pwchk){
			document.getElementById("pwval").innerHTML='동일한 암호를 입력하세요.'
		}else{
			document.getElementById("pwval").innerHTML='동일한 암호 입니다.'
			document.getElementsByName("pwchk")[0].title="y";
		}
	}
	function addpop(){
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById("zonecode").value=data.postcode;
        	document.getElementById("addr").value=data.address;
        	document.getElementsByName("zonecode")[0].title="y";
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
    }
	
	function email(){
		var emailName = $("#emailName").val();
		var emailForm = $("#emailForm").val();
		return 'emailName='+emailName+'&emailForm='+emailForm
	}
	
	
	$(function(){
		
		$("#emailAuth").click(function(){
			if(emailName!=null){
				$.ajax({
					url:"mailSend.do?"+email(),
					method:'post',
					datatype:'text',
					success:function(msg){
						var email = msg.email
						if(email==true){
							alert("메일 전송 완료 했습니다.")
						}
						
					},error:function(){
						alert('통신실패')
					}
				})
			}
		})
	})
	

	
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	
	<div class="culmn">
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixednavbar navbar-expand-lg  navbar-fixed white bootsnav on no-full">
			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->
			<div class="container">
				<!-- Start Attribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"><i class="fa fa-bars"></i></a></li>
					</ul>
				</div>
				<!-- End Attribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbar-menu">
						<span></span> <span></span> <span></span>
					</button>

					<a class="navbar-brand" href="main.do"><img
						src="resources/assets/images/logo2.jpg" class="logo logo-scrolled" alt="logo">
					</a>
				</div>
				<!-- End Header Navigation -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#hello'">About us</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#about'">Map</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='sponsor.do'">Sponsor</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#portfolio'">review</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#pricing'">Pricing</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='#blog'">Blog</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='content.do'">Contant</button></li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='ani_shelterList.do'">보호소</button></li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li>
						<sec:authorize access="isAnonymous()">
						<button type="button" class="btn btn-link text-dark"onclick="location.href='<c:url value='loginform.do'/>'">LOGIN</button>
						</sec:authorize>	
						</li>
						<li>
						<sec:authorize access="isAuthenticated()">
								<form:form action="${pageContext.request.contextPath}/logout" method="POST">
								<input type="submit" class="btn btn-link text-dark" value="LOGOUT" />
							</form:form>
						</sec:authorize>
						</li>
						<li><button type="button" class="btn btn-link text-dark" onclick="location.href='joinform.do'">JOIN</button></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- Start Side Menu -->
			<div class="side bg-light">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">Custom Pages</h6>
					<ul class="link">
						<li><a href="#hello">About us</a></li>
						<li><a href="#about">Map</a></li>
						<li><a href="sponsor.do">Sponsor</a></li>
						<li><a href="#portfolio">review</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<div class="widget">
					<h6 class="title">Additional Links</h6>
					<ul class="link">
						<li><a href="#">Retina Homepage</a></li>
						<li><a href="#">New Page Examples</a></li>
						<li><a href="#">Parallax Sections</a></li>
						<li><a href="#">Shortcode Central</a></li>
						<li><a href="#">Ultimate Font Collection</a></li>
					</ul>
				</div>
			</div>
			<!-- End Side Menu -->
		</nav>

		<br> <br> <br> <br> <br> <br>
	<div class="ima container text-center">
			<form class="image" action="memberInsert.do" id="form">
				<div class="form-group container">
					<img alt="?" src="resources/assets/images/background/en.jpg">
					<h1>[ THE FOREST ]</h1>
					<br>
					<h3>JOIN</h3>
				</div>
				<div class="form-group">
					<label for="text">ID : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="id" title="n" name="id">
					</div>
					<label for="text">NAME : </label>
					
				
				<div class="form-group">
					<div class="row justify-content-center">
						<input type="button" class="btn btn-light" value="중복확인" id="idchk" onclick="idChk()">
					</div>
				</div>	
				<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="name" title="n" name="name">
					</div>
				<div class="form-group">
					<label for="pwd">Password : </label>
					<div class="row justify-content-center">
						<input type="password" class="form-control col-sm-3" id="pw" name="pw" title="n" name="pw">
					</div>
				</div>
				<div class="form-group">
					<div class="row justify-content-center">
						<input type="password" class="form-control col-sm-3" id="pwchk" name="pwchk" onkeyup="chkpw()" title="n">
					</div>
				</div>	
					<div id ="pwval">암호를 입력하세요</div>
				<div class="form-group">
					<label for="addr">Address : </label>
						
				</div>
				<div class="form-group">
					
					<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="addr" onclick="javascript:addpop()" name="addr">
						<input type="text" class="form-control col-sm-3" name="zonecode" id="zonecode" readonly="readonly" title="n">
					</div>
				</div>
				<div class="form-group">
						<div class="row justify-content-center">
							<input type="text" class="form-control col-sm-3" id="addrDetail" placeholder="상세주소를 입력해주세요">
						</div>
				</div>
				</div>
				<div class="form-group">
					<label for="phone">Phone : </label>
					<div class="row justify-content-center">
						<select class="form-control col-1" name="phone1">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>&nbsp;_&nbsp;<input type="text" class="form-control col-1"
							id="phone-mid" name="phone2">&nbsp;_&nbsp; <input type="text"
							class="form-control col-1" id="phone-back" name="phone3">
					</div>
				</div>
				<div class="form-group">
					<label for="phone">Email : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-2" id="emailName" name="emailName">&nbsp;@
						<select class="form-control col-2" id="emailForm" name="emailForm">
							<option>daum.net</option>
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="row justify-content-center">
						<input type="button" class="btn btn-light" value="메일전송" id="emailAuth"><br>
					</div>
				</div>						
					<div class="form-group">
						<div class="row justify-content-center">
							<input type="text" class="form-control col-2" placeholder="인증번호" id="emailNum" name="emailNum" title="n">
						</div>
					</div>
				<div class="form-group">
  					<label for="comment">회원약관</label>
  				<div class="row justify-content-center">
  						<textarea class="form-control readonly col-lg-6" rows="10" id="comment">
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, Forest(이하 포레스트)는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 

여러분께 Forest(이하 포레스트) 서비스 이용 계정(이하 ‘계정’)을 부여합니다.

계정이란 회원이Forest(이하 포레스트) 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.

회원은 자신의 계정을 통해 좀더 다양한 Forest(이하 포레스트) 서비스를 보다 편리하게 이용할 수 있습니다.

  						</textarea>
  				</div>
				</div>
				<div class="form-group">
  					<label for="comment">개인정보이용약관</label>
  					<div class="row justify-content-center">
  						<textarea class="form-control readonly col-lg-6" rows="10" id="comment">
네이버는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집.이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다.
 
네이버가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.

네이버는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 

전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 

만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.

  						</textarea>
  						</div>
  					</div>
				<button type="submit" class="btn btn-success btn-lg">가입하기</button>
			</form>
			<br><br><br><br>
		</div>
	</div>	
	<footer id="footer" class="footer bg-black">
		<div class="container">
			<div class="row">
				<div class="main_footer text-center p-top-40 p-bottom-30">
					<p class="wow fadeInRight" data-wow-duration="1s">
						Made with <i class="fa fa-heart"></i> by <a target="_blank"
							href="https://bootstrapthemes.co">THE FOREST</a> 2019. All Rights
						Reserved
					</p>
				</div>
			</div>
		</div>
	</footer>
	</div>
	<script type="text/javascript">
	function emailNum(){
		var emailNum = documnet.getElementsByName('emailNum')[0].value; 
		return 'email='+emailNum
	}
	$(function(){
		$("#form").submit(function(){
			var id = document.getElementsByName("id")[0].title;
			var pwchk = document.getElementsByName("pwchk")[0].title;
			var addr = document.getElementsByName("zonecode")[0].title;
			var phone = document.getElementsByName("phone3")[0].value;
			var email = document.getElementsByName("emailNum")[0].value;
			
			
			if(id == "n"){
				alert("아이디 중복 체크 해주세요")
				document.getElementsByName("id")[0].focus();
				return false;
			}else if (pwchk =="n"){
				alert("비밀번호 확인해주세요")
				document.getElementsByName("pw")[0].focus();
				return false;
			}else if (addr =="n"){
				alert("주소를 입력해주세요.")
				document.getElementsByName("addr")[0].focus();
				return false;
			}else if (phone== null || phone ==""){
				alert("핸드폰 번호를 입력 하세요.")
				document.getElementsByName("phone2")[0].focus();
				return false;
			}else if(email==null||email==""){
				alert("인증번호를 입력하세요.")
				document.getElementsByName("emailNum")[0].focus();
				return false;
			}else{
				alert('왔니')
				
			}
			
		})
	})
	
	</script>
</body>
</html>