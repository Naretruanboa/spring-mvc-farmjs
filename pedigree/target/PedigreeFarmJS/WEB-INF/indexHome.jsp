<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jssor.slider.min.js"></script>
<title>ระบบพันธุ์ประวัติจันทร์สุวรรณฟาร์ม</title>
</head>
    <!-- use jssor.slider-21.1.5.debug.js instead for debug -->
    <script>
        jssor_1_slider_init = function() {
            
            var jssor_1_SlideshowTransitions = [
              {$Duration:1200,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:1200,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
            ];
            
            var jssor_1_options = {
              $AutoPlay: true,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Cols: 1,
                $Align: 0,
                $NoDrag: true
              }
            };
            
            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 1600);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            //responsive code end
        };
       
    </script>
    
    
    
<body> <!-- OnLoad="JavaScript:$('#loginForm').show('show');" -->
 
<jsp:include page="menuHome.jsp"/>

<div class="section-bg" style="padding: 0px 0px;">
	<div class="container">
<c:if test="${sessionScope.privilege == null}">
	<div class="section-bg" id="divform" style="padding: 0px 0px; " >
		<div class="container" >
		<br><br><br><br>
			<div style="height: 400px">
				<img class="icon" style="width: 60%"
				src="<c:url value= "resources/img/center_logo.png"/> "
				height="40%" >
			</div>
			<!-- <div class="row" align="center">
				<button type="button" class="btn btn-success " style="font-size: 30px;" href="#" data-toggle="modal" data-target="#login">  เข้าสู่ระบบ  </button>
			</div> -->
			
				
	        <a href="#" class="btn btn-info btn-lg" style="font-size: 30px;" href="#" data-toggle="modal" data-target="#login">
	          <span class="fa fa-unlock"></span> เข้าสู่ระบบ
	        </a>
	      
			
			
			<!-- <div>
				<h3 class="homepage-title">Jansuwan Farm Brahman Suphanburi</h3>
			</div> -->
			
			<%-- <div class="row" align="center">
				<div class="col-md-offset-2 col-md-2">
					<img alt="" src="<c:url value="/resources/img/logostore.png"/>"
						width="130px">
					<h4 class="homepage-subtitle-col">ระบบการจัดการคลัง</h4>
				</div>
				<div class="col-md-2">
					<img alt="" src="<c:url value="/resources/img/g2.png"/>"
						width="130px">
					<h4 class="homepage-subtitle-col">ระบบการรักษา</h4>
				</div>
				<div class="col-md-2">
					<img alt="" src="<c:url value="/resources/img/logo-3.png"/>"
						width="130px">
					<h4 class="homepage-subtitle-col">ระบบคำนวณหาค่าความต้องการทางโภชนะของโคเนื้อและโคนม</h4>
				</div>
				<div class="col-md-2">
					<img alt="" src="<c:url value="/resources/img/b2.png"/>"
						width="130px">
					<h4 class="homepage-subtitle-col">ระบบการออกใบสูจิบัตรโคประกวดและโคประมูล</h4>
				</div>
			</div> --%>
			
		</div>
	</div>
</c:if>
	
<c:if test="${sessionScope.privilege != null}">	

<div class="container" >
		<br><br><br><br>
			<div style="height: 380px" align="center">
				<img class="icon" style="width: 50%"
				src="<c:url value= "resources/img/center_logo.png"/> "
				height="10%" >
			</div>
</div>			

<c:forEach items="${ulist}" var="m">
<div style="margin-left: 3%">
  <a href="pedigree" class="btn btn-info btn-lg" style="font-size: 25px;" >
	          <span class="fa fa-home"></span> ยินดีต้อนรับคุณ ${m.first} ${m.last} 
  </a>
</div>  
</c:forEach>  
	<!-- <br><br><h1 style="color:blue;">ยินดีต้อนรับ</h1><br><br><br> -->
	
	<!-- <nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
        <li><a href="#">Age</a></li>
        <li><a href="#">Gender</a></li>
        <li><a href="#">Geo</a></li>
      </ul>
    </div>
  </div>
</nav> -->
<!-- 
	<div class="round-button-1">
		<div class="round-button-circle-1">
			<a href="testindex" class="round-button-1">
				<img src="resources/img/logostore.png" alt="logo" style="width:183px;height:183px; margin-top:20px; margin-left:-900px;" >
			</a>
		</div>
	</div> -->
	<!-- 
	<div class="round-button-2">
		<div class="round-button-circle-2">
			<a href="HealthCare" class="round-button-2">
				<img src="resources/img/g2.png" alt="logo" style="width:185px;height:175px; margin-top:-180px; margin-left:-330px;" >
			</a>
		</div>
	</div>
	
	<div class="round-button-3">
		<div class="round-button-circle-3">
			<a href="Nutrient" class="round-button-3">
				<img src="resources/img/logo-3.png" alt="logo" style="width:202px;height:205px; margin-top:-201px; margin-left:250px;" >
			</a>
		</div>
	</div>
	
	<div class="round-button-4">
		<div class="round-button-circle-4">
			<a href="Certificate" class="round-button-4">
			<img src="resources/img/b2.png" alt="logo" style="width:190px;height:175px; margin-top:-183px; margin-left:850px;" >
			</a>
		</div>
	</div> -->
	
</c:if>
	</div>
</div> 


<div id="footer_container">
	<footer class="footer">
	<div class="container">
		<div class="col-md-6" align="left">
				<div class="row form-inline">
						<span style="color: white;font-size: 16px;">Copyright 2018</span>
						<span style="color: white;font-size: 18px;"> | </span>
						<a href="development" target="_blank" style="font-size: 16px;">Development Team</a>	
						<span style="color: white;font-size: 18px;"> | </span>
						<a href="contact" target="_blank" style="font-size: 16px;">Contact</a>
				</div>
				<div class="row form-inline">
					<span style="color: white;font-size: 16px;">By Computer Engineering 
					<a href="http://www.up.ac.th" target="_blank" class="textright">University Of Phayao &nbsp;</a></span>
					<a href="https://www.facebook.com/ComputerEngineeringUP?fref=ts" target="_blank" class="textright"><i class="fa fa-facebook-official"></i></a>
				</div>
		</div>
		<div class="col-md-6">
			<div align="right">
				<a>
					<a href="index" class="textright" >Jansuwan Farm Brahman Suphanburi</a>
					<%-- <img id="imgfooter" src="<c:url value="resources/img/home.png" /> " height="45"  title="กลับสู่หน้าหลัก"> --%>
				</a> 
			</div>
		</div>
	</div>
	</footer>
</div>
</body>

</html>