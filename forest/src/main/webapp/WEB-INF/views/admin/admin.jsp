<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>::Management</title>

<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/bootstrap.css">
<link href="resources/assets/css/admin.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/07b0ce5d10.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
</style>
</head>
<%@ page import="java.util.*, java.text.*"%>

<%
   java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
   String today = formatter.format(new java.util.Date());
%>
<body>

   <!--=============================NAVIGATION =============================-->

   <!--top nav start=======-->
   <nav class="navbar navbar-inverse top-navbar" id="top-nav">
      <div class="container-fluid">
         <div class="navbar-header">
            <a class="" href="admin.do"><img align="left"
               src="resources/image/logowhite.png" alt="로곤디" width="103"
               height="49"></a>
         </div>
         <ul class="social-icon pull-right list-inline">
            <li class="dropdown"><a class="messages-link dropdown-toggle"
               href="#"><span class="glyphicon glyphicon-envelope"></span> </a></li>
            <li class="dropdown"><a class="alerts-link dropdown-toggle"
               href="#"><span class="glyphicon glyphicon-bell"></span> </a></li>
            <li class="dropdown"><a class="tasks-link dropdown-toggle"
               href="#"><span class="glyphicon glyphicon-th-list"></span> </a></li>
            <li class="dropdown"><a class="user-link dropdown-toggle"
               href="#"><span class="glyphicon glyphicon-user"></span></a></li>
         </ul>
      </div>
   </nav>
   <!--    top nav end===========-->

   <!-- begin SIDE NAV USER PANEL -->
   <div class="container-1" id="user-profil">
      <ul id="side" class="nav navbar-nav-1 side-nav">
         <li class="nav-search">
            <form class="navbar-form">
               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <div class="input-group-btn">
                     <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                     </button>
                  </div>
               </div>
            </form>
         </li>
      </ul>
   </div>


   <div class="container-2">
      <div id="page-wrapper">
         <div class="row">
            <div class="col-md-12">
               <div class="page-title">
                  <ol class="breadcrumb">
                     <li>
                        <h2>&nbsp;ADMIN BOARD<small> 관리자페이지</small></h2>
                     </li>
                     <li style="margin-top: 10px; font-size: 20px; color: #34495e;">
                        <i class="fa fa-calendar"></i> <%=today.substring(0, 8)%>
                     </li>
                     <li class="pull-right"><audio controls="controls"
                           autoplay="autoplay" loop="loop">
                           <source src="resources/audio/mix.mp3" type="audio/mp3" />
                        </audio>
                     </li>
                  </ol>
               </div>
            </div>
         </div>

         <div class="row">
            <div class="col-lg-2 col-sm-6">
               <div class="circle-tile">
                  <div class="circle-tile-heading dark-blue">
                     <i class="fa fa-users fa-fw fa-3x"></i>
                  </div>
                  <div class="circle-tile-content dark-blue">
                     <div class="circle-tile-description text-faded">회원목록</div>
                     <div class="circle-tile-number text-faded">
                        ${memcount} 명 <span id="sparklineA"></span>
                     </div>
                     <a href="admin_memlist.do" class="circle-tile-footer">More
                        Info <i class="fa fa-chevron-circle-right"></i>
                     </a>
                  </div>
               </div>
            </div>
            <div class="col-lg-2 col-sm-6">
               <div class="circle-tile">
                  <div class="circle-tile-heading green">
                     <i class="fa fa-money fa-fw fa-3x"></i>
                  </div>
                  <div class="circle-tile-content green">
                     <div class="circle-tile-description text-faded">후원내역</div>
                     <div class="circle-tile-number text-faded">${fundcount}￦</div>
                     <a href="admin_fundlist.do" class="circle-tile-footer">More
                        Info <i class="fa fa-chevron-circle-right"></i>
                     </a>
                  </div>
               </div>
            </div>
            <div class="col-lg-2 col-sm-6">
               <div class="circle-tile">
                  <div class="circle-tile-heading orange">
                     <i class="fa fa-bell fa-fw fa-3x"></i>
                  </div>
                  <div class="circle-tile-content orange">
                     <div class="circle-tile-description text-faded">공모게시판</div>
                     <div class="circle-tile-number text-faded">${concount}New</div>
                     <a href="admin_conlist.do" class="circle-tile-footer">More
                        Info <i class="fa fa-chevron-circle-right"></i>
                     </a>
                  </div>
               </div>
            </div>
            <div class="col-lg-2 col-sm-6">
               <div class="circle-tile">
                  <div class="circle-tile-heading red">
                     <i class="fa fa-calendar fa-fw fa-3x"></i>
                  </div>
                  <div class="circle-tile-content red">
                     <div class="circle-tile-description text-faded">봉사일정관리</div>
                     <div class="circle-tile-number text-faded">
                        ${calcount } 건 <span id="sparklineC"></span>
                     </div>
                     <a href="calrecsel.do" class="circle-tile-footer">More Info <i
                        class="fa fa-chevron-circle-right"></i></a>
                  </div>
               </div>
            </div>

            <div class="col-lg-2 col-sm-6">
               <div class="circle-tile">
<!--                   <a href="resources/assets/Node-Server/admin/chatlist.jsp"> -->
               <div id="adminchat" style="display: none;" >
               <iframe class="iframe-chat" src="http://192.168.10.158:8880/admin"></iframe></div>
                     <div class="circle-tile-heading purple">
                        <i class="fa fa-comments fa-fw fa-3x"></i>
                     </div>
<!--                   </a> -->
                  <div class="circle-tile-content purple" onclick="toggle()">
                     <div class="circle-tile-description text-faded">문의채팅방</div>
                     <div class="circle-tile-number text-faded">
                        1:1 <span id="sparklineB"></span>
                     </div>
                     <a href="admin_gotochat.do" class="circle-tile-footer" style="text-align: center;">More Info<i
                        class="fa fa-chevron-circle-right"></i></a>
                  </div>
               </div>
            </div>
                        <div class="col-lg-2 col-sm-6">
                  <div class="circle-tile">
                  <div class="circle-tile-heading gray">
                     <i class="fa fa-tree fa-fw fa-3x"></i>
                  </div>
                  <div class="circle-tile-content gray" style="">
                     <div class="circle-tile-description text-faded">Forest</div>
                     <div class="circle-tile-number text-faded">
                        Main<span id="sparklineB"></span>
                     </div>
                     <a href="main.do" class="circle-tile-footer" style="text-align: center;">관리자 나가기 <i
                        class="fa fa-chevron-circle-right"></i></a>
                  </div>
               </div>
            </div>

         </div>
      </div>
      <!-- page-wrapper END-->
</div>



</body>
</html>