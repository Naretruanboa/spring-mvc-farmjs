<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/fileinput.css" />" media="all"
	rel='stylesheet' type='text/css' />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
<script src="<c:url value="/resources/js/clicktable.js" />"></script>
<script src="<c:url value="/resources/js/fileinput.js" />"></script>
<title>บันทึกข้อมูลโค</title>
</head>
<style>
	.bkgV1{
		background-color: #cff2dc;
	}
	.bkgV2{
		background-color: #bbc8ea;
	}
	.bkgV3{
		background-color: #eccee8;
	}
	
	.redFontV1{
		background-color: #cff2dc;
		color: #e62d68;
	}
	.redFontV2{
		background-color: #bbc8ea;
		color: #e62d68;
	}
	.redFontV3{
		background-color: #eccee8;
		color: #e62d68;
	}
	.img-black {
	  background-image: url("resources/img/print.jpg");
	}
</style>

<body>
<%@ include file="../menu.jsp"%><br><br>
<% int sum = 0;; %>
<div id="content">
<div class="container">

      
	<div class="col-md-4">
		<div class="jumbotron" style="background-color: rgb(218, 68, 83)"
			align="center">
			<p style="font-size: 25px; font-weight: 900; color: white;">บันทึกข้อมูลโคจันทร์สุวรรณฟาร์ม</p>
		</div>
	</div>
	<div class="row">
		<hr>
	</div><br><br>
	<div class="row form-group">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="panel-title">
				<span class="fa fa-list-alt fa-lg"></span> บันทึกข้อมูลโคเนื้อ</a>
				</h4>
			</div>
	<div class="img-black">
	
	</div>
	
	
	<div class="panel-body">
	<!--   <div style='position:absolute;zindex:0;left:0;top:0;width:100%;height:100%'>
           <img src='resources/img/print.jpg' style='width:100%;height:100%' alt='[]' />
       </div>  -->
			<div class="row form-group">
			<form:form action="pedigree" modelAttribute="pedigree" method="POST" id="pedigree" commandName="sh">
				<div class="col-md-6">
					<fieldset><br>
					  
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font> Sex </label>
							<div class="col-md-6">
								<form:select class="form-control" id="sex" path="sex">
									<form:option value="0">เลือกเพศโค</form:option>
										<c:forEach items="${sex}" var="sex">
											<form:option value="${sex.id }" >&nbsp;${sex.value }</form:option>
										</c:forEach>	
								</form:select>	
							</div>
						</div>
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font> Color </label>
							<div class="col-md-6">
								<form:select class="form-control" id="color" path="color">
									<form:option value="0">เลือกสีโค</form:option>
										<c:forEach items="${color}" var="color">
											<form:option value="${color.id }" >&nbsp;${color.value }</form:option>
										</c:forEach>	
								</form:select>	
							</div>
						</div>
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font> Pedigree No. </label>
							<div class="col-md-6">
								<form:input path="pedigreeNo" id="pedigreeNo" placeholder="หมายเลขพันธุ์ประวัติ"   type="name" class="form-control"/>
							</div>
						</div>
						
						 <div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font> Named</label>
							<div class="col-md-6">
								<form:input path="cowNo" id="cowNo" placeholder="ชื่อโค (เพศ ชื่อฟาร์ม หมายเลขประจำตัวโค)"  type="name" class="form-control"/>
							</div>
						</div>	
						
						 <div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font>.Private Herd No.</label>
							<div class="col-md-6">
								<form:input path="herdNo" id="herdNo" placeholder="หมายเลขประจำฝูง"   type="name" class="form-control"/>
							</div>
						</div>
						
						 <div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font>Calved</label>
							<div class="col-md-6">
								<form:input path="birthDate" id="birthDate" type="date" class="form-control"/>
							</div>
						</div>
						
					</fieldset>
				</div>
				<br>
				
				<div class="row form-group">
					<fieldset>
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font>Farm Name</label>
							<div class="col-md-6">
								<form:input path="" id="faId" type="name" value="จันทรสุวรรณฟาร์ม" class="form-control"/>
							</div>
						</div>	
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font>Ownership Brand</label>
							<div class="col-md-6">
								<form:input path="ownerShip" id="ownerShip" placeholder="สัญลักษณ์หรือเครื่องหมายประจำฟำร์ม"   type="name" class="form-control"/>
							</div>
						</div>
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font>Breeder</label>
							<div class="col-md-6">
								<form:input path="breeder" id="breeder" type="name" placeholder="ผู้ปรับปรุงพันธฺุ์" class="form-control"/>
							</div>
						</div>	
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font>Present Owner</label>
							<div class="col-md-6">
								<form:input path="owner" id="owner" type="name" placeholder="เจ้าของคนปัจจุบัน" class="form-control"/>
							</div>
						</div>
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font>Date of Delivery</label>
							<div class="col-md-6">
								<form:input path="registerDate" id="registerDate" type="date" class="form-control"/>
							</div>
						</div>
					</fieldset>
					</form:form>
					<br><br>
					
					<fieldset>
					<br>
					
					<!-- ------------- START SIRE ------------- -->
									<form:form modelAttribute="FFF_V3" id="FFF_V3" method="POST" commandName="FFF_V3">	
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<input name="cowNo" class="bkgV3" type="text"  placeholder="ชื่อพ่อโค">
										</div>
										<div class="col-md-2">
											<input name="herdNo" class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
												<input type="hidden" name="sex.id" value="1">
												<input type="text" class="redFontV3"  value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo" class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม" >
										</div>		
									</div>
									</form:form>
									
									<form:form modelAttribute="FF_V2" id="FF_V2" method="POST" commandName="FF_V2">	
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<input name="cowNo" class="bkgV2" type="text"  placeholder="ชื่อพ่อโค">
										</div>
										<div class="col-md-2">
											<input name="herdNo" class="bkgV2" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
											<input type="hidden" name="sex.id" value="1">
											<input type="text" class="redFontV2"  value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo" class="bkgV2" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>	
									</div>
									</form:form>
								
								<form:form modelAttribute="FFM_V3" id="FFM_V3" method="POST" commandName="FFM_V3">	
								<div class="col-sm-offset-6 col-sm-7">
									<div class="col-md-3">
										<input name="cowNo" class="bkgV3" type="text"  placeholder="ชื่อแม่โค">
									</div>
									<div class="col-md-2">
										<input name="herdNo" class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
									</div>
									<div class="col-md-1">
										<input type="hidden" name="sex.id" value="2">
										<input type="text" class="redFontV3"  value="COW" readonly="readonly" >
									</div>
									<div class="col-md-2">
										<input name="pedigreeNo" class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
									</div>
								</div>
								</form:form>
						
						<!-- ------------- SIRE ------------- -->
						<form:form modelAttribute="F_V1" id="F_V1" method="POST" commandName="F_V1">
						<div class="col-md-offset-0 col-md-7">
							<label class="control-label col-sm-1" for="pwd">SIRE</label>
							<div class="col-md-3">
								<input name="CName" class="bkgV1" type="text"  placeholder="SIRE">
							</div>
							<div class="col-md-2">
								<input name="herdNo" class="bkgV1" type="text"  placeholder="หมายเลขประจำฝูง">
							</div>
							<div class="col-md-1">
								<input type="hidden" name="sex.id" value="1">
								<input type="text" class="redFontV1" value="BULL" readonly="readonly" >
							</div>
							<div class="col-md-2">
								<input name="pedigreeNo" class="bkgV1" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
							</div>
						</div> 
						</form:form>
									
									<form:form modelAttribute="FMF_V3" id="FMF_V3" method="POST" commandName="FMF_V3">
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<input name="cowNo" class="bkgV3" type="text"  placeholder="ชื่อพ่อโค">
										</div>
										<div class="col-md-2">
											<input name="herdNo" class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
											<input type="hidden" name="sex.id" value="1">
											<input type="text" class="redFontV3"  value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo" class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>
									</div>
									</form:form>
									
									<form:form modelAttribute="FM_V2" id="FM_V2" method="POST" commandName="FM_V2">
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<input name="cowNo"  class="bkgV2" type="text"  placeholder="ชื่อแม่โค">
										</div>
										<div class="col-md-2">
											<input name="herdNo" class="bkgV2" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
											<input type="hidden" name="sex.id" value="2">
											<input type="text" class="redFontV2"  value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo" class="bkgV2" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>
									</div>
									</form:form>
								
								<form:form modelAttribute="FMM_V3" id="FMM_V3" method="POST" commandName="FMM_V3">	
								<div class="col-md-offset-6 col-md-7">
									<div class="col-md-3">
										<input name="cowNo" class="bkgV3" type="text"  placeholder="ชื่อแม่โค">
									</div>
									<div class="col-md-2">
										<input name="herdNo" class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
									</div>
									<div class="col-md-1">
										<input type="hidden" name="sex.id" value="2">
										<input type="text" class="redFontV3"  value="COW" readonly="readonly" >
									</div>
									<div class="col-md-2">
										<input name="pedigreeNo" class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม"> <br>
									</div><br><br>
								</div>
								</form:form>
								<!-- ------------- END SIRE -------------
							
								------------- START DAM ------------- -->
									<form:form modelAttribute="MFF_V3" id="MFF_V3" method="POST" commandName="MFF_V3">
										<div class="col-md-offset-6 col-md-7">
											<div class="col-md-3">
												<input name="CName"  class="bkgV3" type="text"  placeholder="ชื่อพ่อโค">
											</div>
											<div class="col-md-2">
												<input name="herdNo"  class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
											</div>
											<div class="col-md-1">
												<input type="hidden" name="sex.id" value="1">
												<input type="text" class="redFontV3" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<input name="pedigreeNo"  class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
											</div>
										</div>
									</form:form>	
									
									<form:form modelAttribute="MF_V2" id="MF_V2" method="POST" commandName="MF_V2">	
										<div class="col-md-offset-3 col-md-7">
											<div class="col-md-3">
												<input name="CName"  class="bkgV2" type="text"  placeholder="ชื่อพ่อโค">
											</div>
											<div class="col-md-2">
												<input name="herdNo"  class="bkgV2" type="text"  placeholder="หมายเลขประจำฝูง">
											</div>
											<div class="col-md-1">
												<input type="hidden" name="sex.id" value="1">
												<input type="text" class="redFontV2" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<input name="pedigreeNo"   class="bkgV2" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
											</div>
										</div>
									</form:form>	
									
									<form:form modelAttribute="MFM_V3" id="MFM_V3" method="POST" commandName="MFM_V3">	
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<input name="CName"  class="bkgV3" type="text"  placeholder="ชื่อแม่โค">
										</div>
										<div class="col-md-2">
											<input name="herdNo"  class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
											<input type="hidden" name="sex.id" value="2">
											<input type="text" class="redFontV3" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo"  class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>	
									</div>	
									</form:form>
									
							<!-- ------------- DAM ------------- -->
							<form:form modelAttribute="M_V1" id="M_V1" method="POST" commandName="M_V1">
							<div class="col-md-offset-0 col-md-7">
								<label class="control-label col-sm-1">DAM</label>
								<div class="col-md-3">
									<input name="CName"  class="bkgV1" type="text" placeholder="DAM">
								</div>
								<div class="col-md-2">
									<input name="herdNo"  class="bkgV1" type="text" id="tags" placeholder="เลขประจำฝูง">
								</div>
								<div class="col-md-1">
									<input type="hidden" name="sex.id" value="2">
									<input type="text" class="redFontV1" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<input name="pedigreeNo"  class="bkgV1" type="text" id="tags" placeholder="เลขทะเบียนของสมาคม">
								</div>
							</div>	
							</form:form>
									<form:form modelAttribute="MMF_V3" id="MMF_V3" method="POST" commandName="MMF_V3">
										<div class="col-md-offset-6 col-md-7">
											<div class="col-md-3">
												<input name="CName"  class="bkgV3" type="text"  placeholder="ชื่อพ่อโค">
											</div>
											<div class="col-md-2">
												<input name="herdNo"  class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
											</div>
											<div class="col-md-1">
												<input type="hidden" name="sex.id" value="1">
												<input type="text" class="redFontV3" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<input name="pedigreeNo"  class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
											</div>
											
										</div>
									</form:form>	
								
								<form:form modelAttribute="MM_V2" id="MM_V2" method="POST" commandName="MM_V2">
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<input name="CName"  class="bkgV2" type="text"  placeholder="ชื่อแม่โค">
										</div>
										<div class="col-md-2">
											<input name="herdNo"  class="bkgV2" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
											<input type="hidden" name="sex.id" value="2">
											<input type="text" class="redFontV2" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo"  class="bkgV2" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>
										
									</div>
								</form:form>	
									
								<form:form modelAttribute="MMM_V3" id="MMM_V3" method="POST" commandName="MMM_V3">
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<input name="CName"  class="bkgV3" type="text"  placeholder="ชื่อแม่โค">
										</div>
										<div class="col-md-2">
											<input name="herdNo"  class="bkgV3" type="text"  placeholder="หมายเลขประจำฝูง">
										</div>
										<div class="col-md-1">
												<input type="hidden" name="sex.id" value="2">
												<input type="text" class="redFontV3" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<input name="pedigreeNo"  class="bkgV3" type="text"  placeholder="หมายเลขทะเบียนของสมาคม">
										</div>
									
									</div>	
								</form:form>		 
					<!-- ------------- END DAM ------------- -->
					</fieldset>
					
					
				</div>										
			</div>
		
		<br>
								<div class="col-md-offset-8">
									<button name="action" value="Add" id="add"
										class="btn btn-success btn-lg">
										<i class="fa fa-save fa-lg"></i>&nbsp; บันทึกข้อมูล
									</button>									

									<button name="action" value="cancel" onclick="cancel()"	
									class="btn btn-danger btn-lg">
										<i class="fa fa-times fa-lg"></i>
										&nbsp; ยกเลิก
									</button>	<br><br><br>		
								</div>
				</div>
		</div>
		</div>
</div> 
</div>



<%@ include file="../footer.jsp"%>

<script type="text/javascript">


	function cancel() {
		location.reload();
	} 
	
	// ยืนยันบันทึก
$(document).on('click','#add',function(e){
	/* $.getJSON('pedigree_add',$('#pedigree').serialize()).then(function(result){
		var cattleId.fatherIdV1 = result;
		swal("Success" , "บันทึกข้อมูลสำเร็จ" , "success");
		return cattleId;
	}).then(funtion(cattleId){
		console.log(cattleId);
		swal("Success" , "บันทึกข้อมูลสำเร็จ" , "success");
	})
	 */
/*      return new Promise(function(resolve, reject){
	    	 $.getJSON('pedigree_add',$('#FFF_V3').serialize()).then(function(resultfa){
	 		return resultfa;
	     }).then(function(resultfa){
	    	 $.getJSON('pedigree_add',$('#FFM_V3').serialize()).then(function(resultma){
				 var cattleId = [resultfa,resultma];
				 return cattleId;
			 });
	     });
     }); */
     var cattleFaId = {};
     var cattleMaId = {};
     
	 return $.getJSON('pedigree_add',$('#FFF_V3').serialize()).then(function(resultfa){
		 return $.getJSON('pedigree_add',$('#FFM_V3').serialize()).then(function(resultma){
			 cattleFaId.FFF = resultfa;
			 cattleFaId.FFM = resultma;
			 return cattleFaId;
		 }).then(function(cattleFaId){
			 return $.getJSON('pedigree_add',$('#FF_V2').serialize()+"&fatherId.id="+cattleFaId.FFF+"&motherId.id="+cattleFaId.FFM)
			   	.then(function(resultfa){
				 cattleFaId.FF = resultfa;
				 return cattleFaId;
		  	}); 
		});
	
	}).then(function(cattleFaId){
		return $.getJSON('pedigree_add',$('#FMF_V3').serialize()).then(function(resultfa){
			return $.getJSON('pedigree_add',$('#FMM_V3').serialize()).then(function(resultma){
				 cattleFaId.FMF = resultfa;
				 cattleFaId.FMM = resultma;
				 return cattleFaId; 
			 }).then(function(cattleFaId){
				 return $.getJSON('pedigree_add',$('#FM_V2').serialize()+"&fatherId.id="+cattleFaId.FMF+"&motherId.id="+cattleFaId.FMM)
				   	.then(function(resultfa){
					 cattleFaId.FM = resultfa;
					 return cattleFaId;
			  	}); 
			}); 
		});
	}).then(function(cattleFaId){
		 return $.getJSON('pedigree_add',$('#F_V1').serialize()+"&fatherId.id="+cattleFaId.FF+"&motherId.id="+cattleFaId.FM)
	   	.then(function(resultfa){
		 cattleFaId.F = resultfa;
		 console.log(cattleFaId);
		 return cattleFaId;
  		}); 
	}).then(function(){
		//DAM//
		 return $.getJSON('pedigree_add',$('#MFF_V3').serialize()).then(function(resultfa){
			 return $.getJSON('pedigree_add',$('#MFM_V3').serialize()).then(function(resultma){
				 cattleMaId.MFF = resultfa;
				 cattleMaId.MFM = resultma;
				 return cattleMaId;
			 }).then(function(cattleMaId){
				 return $.getJSON('pedigree_add',$('#MF_V2').serialize()+"&fatherId.id="+cattleMaId.MFF+"&motherId.id="+cattleMaId.MFM)
				   	.then(function(resultfa){
					 cattleMaId.MF = resultfa;
					 return cattleMaId;
			  	}); 
			});
		
		}).then(function(cattleMaId){
			return $.getJSON('pedigree_add',$('#MMF_V3').serialize()).then(function(resultfa){
				return $.getJSON('pedigree_add',$('#MMM_V3').serialize()).then(function(resultma){
					 cattleMaId.MMF = resultfa;
					 cattleMaId.MMM = resultma;
					 return cattleMaId; 
				 }).then(function(cattleMaId){
					 return $.getJSON('pedigree_add',$('#MM_V2').serialize()+"&fatherId.id="+cattleMaId.MMF+"&motherId.id="+cattleMaId.MMM)
					   	.then(function(resultfa){
						 cattleMaId.MM = resultfa;
						 return cattleMaId;
				  	}); 
				}); 
			});
		}).then(function(cattleMaId){
			 $.getJSON('pedigree_add',$('#M_V1').serialize()+"&fatherId.id="+cattleMaId.MF+"&motherId.id="+cattleMaId.MM)
		   	.then(function(resultfa){
			 cattleMaId.M = resultfa;
			 console.log(cattleMaId);
			 swal("Success" , "บันทึกข้อมูลสำเร็จ" , "success");
	  		}); 
		}); 
	     
	});
	 
    
	 
     
	 
	/*  $.getJSON('pedigree_add',"fatherId.id=1")
	 
     console.log($("#pedigree").serialize()) */
     
	/* $.ajax({
		url:"addcattle",
		method:"POST",
		cache : false,
		data:$("#pedigree").serialize()
	}).done(function(s){
		swal({  title: "สำเร็จ",   
			text: "เพิ่มโคเรียบร้อยแล้ว!", 
			type: "success",   
			showCancelButton: false,   
			confirmButtonText: "OK!",   
			closeOnConfirm: false }, 
			
			function(){   
				location.reload();
				});
	}).fail(function() {
		swal("ผิดพลาด", "ไม่สามารถเพิ่มโคได้!", "error");
	}); 

	e.preventDefault(); */
});
	
</script>

</body>
</html>