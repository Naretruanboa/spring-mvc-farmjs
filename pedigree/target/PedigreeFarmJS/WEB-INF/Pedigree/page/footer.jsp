<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/includes.jsp"%>
      <br><br>
   	<div id="footer_container">
	<footer class="footer">
	
	<%-- <div class="container">
		<div class="col-md-6" align="left">
				<div class="row form-inline">
						<span style="color: white;font-size: 16px;">Copyright ©2016</span>
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
					<a class="textright" href="index">Farm Management System : Storehouse System</a>
					<img id="imgfooter" src="<c:url value="/resources/img/logostore.png" /> " height="45"  title="กลับสู่หน้าหลัก">
				</a> 
			</div>
		</div>
	</div> --%>
	</footer>
</div>
		<p class="text-muted">
		</p>
<script src="<c:url value="/resources/picker/bootstrap-datepicker.js"/>"></script>
 <script src="<c:url value="/resources/picker/jquery.timepicker.js"/>"></script>
 <script>
                $('.time').timepicker({
                    'showDuration': true,
                    'timeFormat': 'G:i '
                });
                $('.date').datepicker({
                    'format': 'yyyy-mm-dd',
                    'autoclose': true
                });
                $('#jd').datepair();
                $('#jd2').datepair();
</script>