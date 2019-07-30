<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		}
	}
	function addpop(){
    new daum.Postcode({
        oncomplete: function(data) {
        	document.getElementById("addrWoo").value=data.postcode;
        	document.getElementById("addr").value=data.address;
        	
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
						alert(msg.email);
						
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
			class="navbar navbar-light navbar-expand-lg  navbar-fixed gray no-background bootsnav">
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
				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li><a href="loginform.do">LOGIN</a></li>
						<li><a href="joinform.do">JOIN</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbar-menu">
						<span></span> <span></span> <span></span>
					</button>
					<a class="navbar-brand" href="#brand"> <img
						src="resources/assets/images/logo.jpg"
						class="logo logo-display m-top-10" alt="">
					</a>
				</div>
				<!-- End Header Navigation -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li><a href="#hello">About us</a></li>
						<li><a href="#about">Map</a></li>
						<li><a href="sponsor">Sponsor</a></li>
						<li><a href="#portfolio">review</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<div class="widget">
					<h6 class="title">Custom Pages</h6>
					<ul class="link">
						<li><a href="#">About</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Blog</a></li>
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
		<div class="container text-center">
			<h1>[ THE FOREST ]</h1>
			<br>
			<h3>JOIN</h3>
			<form action="join">
				<div class="form-group">
					<label for="text">ID : </label>
					<div class="row justify-content-center">
						<input type="email" class="form-control col-sm-3" id="id" title="n" name="id">
						<input type="button" value="중복확인" id="idchk" onclick="idChk()">
					</div>
				</div>
				<div class="form-group">
					<label for="pwd">Password : </label>
					<div class="row justify-content-center">
						<input type="password" class="form-control col-sm-3" id="pw" name="pw">
					</div>
					<div class="row justify-content-center">
						<input type="password" class="form-control col-sm-3" id="pwchk" name="pwchk" onkeyup="chkpw()">
					</div>
					<div id ="pwval">암호를 입력하세요</div>
				</div>
				<div class="form-group">
					<label for="addr">Address : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-sm-3" id="addr" onclick="javascript:addpop()">
						<input type="text" class="form-control col-sm-3" id="addrWoo" readonly="readonly">
						<input type="text" class="form-control col-sm-3" id="addrDetail" placeholder="상세주소를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label for="phone">Phone : </label>
					<div class="row justify-content-center">
						<select class="form-control col-1">
							<option>010</option>
							<option>011</option>
							<option>017</option>
						</select>&nbsp;_&nbsp;<input type="text" class="form-control col-1"
							id="phone-mid">&nbsp;_&nbsp; <input type="text"
							class="form-control col-1" id="phone-back">
					</div>
				</div>
				<div class="form-group">
					<label for="phone">Email : </label>
					<div class="row justify-content-center">
						<input type="text" class="form-control col-2" id="emailName">&nbsp;@
						<select class="form-control col-2" id="emailForm">
							<option>daum.net</option>
							<option>naver.com</option>
							<option>gmail.com</option>
						</select>
						<input type="button" value="메일전송" id="emailAuth"><br>
						<input type="text" placeholder="인증번호" id="emailNum">
					</div>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox"> Remember me
					</label>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>