
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/fileinput.css" />" media="all"
	rel='stylesheet' type='text/css' />

<link href="<c:url value="/resources/css/easy-autocomplete.min.css" />" rel='stylesheet' type='text/css' />
<link href="<c:url value="/resources/css/easy-autocomplete.themes.min.css" />" rel='stylesheet' type='text/css' />
<script src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script src="<c:url value="/resources/js/jquery.easy-autocomplete.min.js" />"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">

<script src="<c:url value="/resources/js/clicktable.js" />"></script>
<script src="<c:url value="/resources/js/fileinput.js" />"></script>
<title>แก้ไขข้อมูลโค</title>
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
	  background-image: url("/WEB-INF/Pedigree/page/report/img/pedigreeFarmJS01.jpg");
	}
	
</style>
</head>
<body>
<%@ include file="../menu.jsp"%>
	<br><br>
	<div class="img-black">
	
	</div>
	
	<div id="wrapper">
		<div id="content">
			<div class="container">
				<div class="col-md-3">
					<div class="jumbotron" style="background-color: rgb(218, 68, 83)"
						align="center">
						<p style="font-size: 25px; font-weight: 900; color: white;">แก้ไขข้อมูลโค</p>
					</div><br>
				</div>
				<div class="row">
					<hr>
				</div>
				<div class="row form-group">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4 class="panel-title">
						<a><span class="fa fa-list-alt fa-lg"></span>แก้ไขข้อมูลโค</a>
						</h4>
				</div>
							
				<div class="panel-body img-black"  >
							<form:form action="" method="POST"  id="cattleById" modelAttribute="cattleById"  commandName="sh" >
							<form:input path="id" type="hidden"  />
						
						<div class="row form-group">
						<div class="col-md-6 ">
								<fieldset><br>
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font> Pedigree No. </label>
							<div class="col-md-6">
								<form:input path="pedigreeNo" id="pedigreeNo" placeholder="หมายเลขพันธุ์ประวัติ"   type="name" class="form-control"/>
							</div>
						</div>
								
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red">* </font> Sex </label>
							<div class="col-md-6">
								<form:select class="form-control" id="sex.id" path="sex.id">
									<form:option value="0">เลือกเพศโค</form:option>
										<c:forEach items="${sexAll}" var="sex">
											<form:option value="${sex.id }" >&nbsp;${sex.value }</form:option>
										</c:forEach>	
								</form:select>	
							</div>
						</div>
						
						<div class="row form-group">
							<label class="col-md-offset-s col-md-3 control-lable"><font color="red"> *</font> Color </label>
							<div class="col-md-6">
								<form:select class="form-control" id="color.id" path="color.id">
									<form:option value="0">เลือกสีโค</form:option>
										<c:forEach items="${colorAll}" var="color">
											<form:option value="${color.id }" >&nbsp;${color.value }</form:option>
										</c:forEach>	
								</form:select>	
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
								<form:input path="birthDate" id="birthDate" type="text" class="form-control"/>
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
								<form:input path="registerDate" id="registerDate" type="text" class="form-control"/>
							</div>
						</div>
								
									
															
								
								</fieldset>
							</div>
					<fieldset>
					<!--------------- START SIRE --------------->
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<form:input path="fatherId.fatherId.fatherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อพ่อโค" /> 
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.fatherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
												<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.fatherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>		
									</div>
									
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<form:input path="fatherId.fatherId.cowNo" class="bkgV2" type="text" placeholder="ชื่อพ่อโค" />
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.herdNo" class="bkgV2" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
											<input type="text" class="redFontV2" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.pedigreeNo" class="bkgV2" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>	
									</div>
						
								<div class="col-sm-offset-6 col-sm-7">
									<div class="col-md-3">
										<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อแม่โค" /> 
									</div>
									<div class="col-md-2">
										<form:input path="motherId.motherId.motherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
									</div>
									<div class="col-md-1">
										<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
									</div>
									<div class="col-md-2">
										<form:input path="motherId.motherId.motherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
									</div>
								</div>
						<!--------------- SIRE --------------->
						<div class="col-md-offset-0 col-md-7">
							<label class="control-label col-sm-1" for="pwd">SIRE</label>
							<div class="col-md-3">
								<form:input path="fatherId.cowNo" class="bkgV1" type="text" placeholder="SIRE" /> 
							</div>
							<div class="col-md-2">
								<form:input path="fatherId.herdNo" class="bkgV1" type="text" placeholder="หมายเลขประจำฝูง" /> 
							</div>
							<div class="col-md-1">
								<input type="text" class="redFontV1" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
							</div>
							<div class="col-md-2">
								<form:input path="fatherId.pedigreeNo" class="bkgV1" type="text" placeholder="หมายเลขทะเบียน" /> 
							</div>
						</div>
						
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<form:input path="fatherId.fatherId.fatherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อพ่อโค" /> 
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.fatherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
												<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="fatherId.fatherId.fatherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>
									</div>
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<form:input path="motherId.motherId.cowNo" class="bkgV2" type="text" placeholder="ชื่อแม่โค" />
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.herdNo" class="bkgV2" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
											<input type="text" class="redFontV2" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.pedigreeNo" class="bkgV2" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>
									</div>
								<div class="col-md-offset-6 col-md-7">
									<div class="col-md-3">
										<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อแม่โค" />
									</div>
									<div class="col-md-2">
										<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" />
									</div>
									<div class="col-md-1">
										<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
									</div>
									<div class="col-md-2">
										<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /><br>
									</div><br><br>
								</div>
								<!--------------- END SIRE --------------->
								
								<!--------------- START DAM --------------->
										<div class="col-md-offset-6 col-md-7">
											<div class="col-md-3">
												<form:input path="fatherId.fatherId.fatherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อพ่อโค" /> 
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.fatherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
											</div>
											<div class="col-md-1">
												<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.fatherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
											</div>		
										</div>
										
										<div class="col-md-offset-3 col-md-7">
											<div class="col-md-3">
												<form:input path="fatherId.fatherId.cowNo" class="bkgV2" type="text" placeholder="ชื่อพ่อโค" />
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.herdNo" class="bkgV2" type="text" placeholder="หมายเลขประจำฝูง" /> 
											</div>
											<div class="col-md-1">
												<input type="text" class="redFontV2" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.pedigreeNo" class="bkgV2" type="text" placeholder="หมายเลขทะเบียน" /> 
											</div>
										</div>
									
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
										<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อแม่โค" />
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" />
										</div>
										<div class="col-md-1">
											<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /><br>
										</div>	
									</div>	
							<!--------------- DAM --------------->
							<div class="col-md-offset-0 col-md-7">
								<label class="control-label col-sm-1">DAM</label>
								<div class="col-md-3">
									<form:input path="motherId.cowNo" class="bkgV1" type="text" placeholder="DAM" />
								</div>
								<div class="col-md-2">
									<form:input path="motherId.cowNo" class="bkgV1" type="text" placeholder="หมายเลขประจำฝูง" />
								</div>
								<div class="col-md-1">
									<input type="text" class="redFontV1" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
								</div>
								<div class="col-md-2">
									<form:input path="motherId.cowNo" class="bkgV1" type="text" placeholder="หมายเลขทะเบียน" /><br>
								</div>
							</div>	
							
										<div class="col-md-offset-6 col-md-7">
											<div class="col-md-3">
												<form:input path="fatherId.fatherId.fatherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อพ่อโค" /> 
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.fatherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
											</div>
											<div class="col-md-1">
												<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="BULL" readonly="readonly" >
											</div>
											<div class="col-md-2">
												<form:input path="fatherId.fatherId.fatherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
											</div>
											
										</div>
							
									<div class="col-md-offset-3 col-md-7">
										<div class="col-md-3">
											<form:input path="motherId.motherId.cowNo" class="bkgV2" type="text" placeholder="ชื่อแม่โค" />
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.herdNo" class="bkgV2" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
											<input type="text" class="redFontV2" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.pedigreeNo" class="bkgV2" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>
										
									</div>
									
									<div class="col-md-offset-6 col-md-7">
										<div class="col-md-3">
											<form:input path="motherId.motherId.motherId.cowNo" class="bkgV3" type="text" placeholder="ชื่อแม่โค" />
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.motherId.herdNo" class="bkgV3" type="text" placeholder="หมายเลขประจำฝูง" /> 
										</div>
										<div class="col-md-1">
											<input type="text" class="redFontV3" id="disabledTextInput" name="sex" value="COW" readonly="readonly" >
										</div>
										<div class="col-md-2">
											<form:input path="motherId.motherId.motherId.pedigreeNo" class="bkgV3" type="text" placeholder="หมายเลขทะเบียน" /> 
										</div>
									
									</div>			
					<!--------------- END DAM --------------->
					</fieldset>
													
			</div>
			 			
																
			
			
	<!-- 			END		------------------------------------------------------	 -->																				
												
						</form:form>
								
							
								<div class="col-md-offset-8">
									<button name="action" value="Add" id="add" onclick="edit()"
										class="btn btn-success btn-lg">
										<i class="fa fa-save fa-lg"></i>&nbsp; บันทึกข้อมูล
									</button>
									

									<a href="cattlelist"><button name="action" value="cancel" onclick="cancel()"
										class="btn btn-danger btn-lg">
										<i class="fa fa-times fa-lg"></i>&nbsp; ยกเลิก
									</button></a>	
								</div>
	</div>	
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
	 function edit(){
		console.log("dwvfigdwiugv");
		
		swal({	title: "ยืนยันบันทึกข้อมูล?",   
			text: "คุณต้องการยืนยันบันทึกข้อมูลโคหรือไม่!",   
			type: "warning",   
			showCancelButton: true,   
			confirmButtonColor: "#55c7dd",   
			confirmButtonText: "ต้องการ",
			cancelButtonText: "ไม่ต้องการ",   
			closeOnConfirm: false,   
			closeOnCancel: false }, 
			function(isConfirm){   
				if (isConfirm) {
					if($("#num").val() == ""){
						swal("กรุณากรอกหมายเลขโค");
					}else if($("#numDate").val() == ""){
						swal("กรุณากรอกเบอร์แรกเกิด");						
					}else{
					$.post('edited_cattle_test',$("#cattleTest").serialize(),
					      function (result) {
					     	swal({	title: "Success!",   
								/* text: "หมายเลขยา "+result,  */   
								timer: 200,   
								type: "success",
								showConfirmButton: false },
								function(){   
									window.location.href='cattlelist'; 
							});
							
							/* setInterval(function(){location.reload()}, 2000); */
						})
					}
					} else { 
					swal({	title: "Cancelled!",   
							text: "คุณได้ยกเลิกการบันทึกข้อมูล",   
							timer: 1000,   
							type: "error",
							showConfirmButton: false 
					});
				} 
			}
		);
		
	 }
	
</script>


</body>
</html>