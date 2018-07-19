 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>คำนวณอาหารข้นราคาต่ำสุด</title>
<style>
	.table-responsive.hill {
		max-height: 300px;
		}
.fixed{
  top:0;
  position:fixed;
  width:auto;
  display:none;
  border:none;
}
body{
  font:1.2em normal Arial,sans-serif;
  color:#34495E;
}

h1{
  text-align:center;
  text-transform:uppercase;
  letter-spacing:-2px;
  font-size:2.5em;
  margin:20px 0;
}

.container{
  width:90%;
  margin:auto;
}

table{
  border-collapse:collapse;
  width:100%;
}

.blue{
  border:2px solid #1ABC9C;
}

.blue thead{
  background:#1ABC9C;
}

.purple{
  border:2px solid #9B59B6;
}

.purple thead{
  background:#9B59B6;
}

thead {
  color:black;
}

th,td{
  text-align:center;
  padding:5px 0;
}

tbody tr:nth-child(even){
  background:#ECF0F1;
}

tbody tr td:hover{
background:#BDC3C7;
  color:black;
}

.fixed{
  top:0;
  position:fixed;
  width:auto;
  display:none;
  border:none;
}

.scrollMore{
  margin-top:600px;
}

.up{
  cursor:pointer;
}
	
</style>
</head>
<body>

<c:if test="${sessionScope.username == null}">
	<c:redirect url="index"/>
</c:if>

	

<%int i=1; %>

<jsp:include page="../menu.jsp"/>
		 <div class="container">
		 <hr>
		 <div class=" row form-group">
				<div class="form-inline">
					<div class="col-md-3">
						<div class="jumbotron" style="background-color: rgb(218, 68, 83)"
							align="center">
							<p style="font-size: 28px; font-weight: 700; color: white;">คำนวณอาหารข้นราคาต่ำสุด</p>
						</div>
					</div>
					 <div align="right">
						<br>
						<label style=" color: red;"> ข้อควรระวัง</label>
						<label>&nbsp&nbsp&nbsp*** วัวเด็กไม่สามารถใช้ยูเรียในการผสมได้</label>
						<label>&nbsp&nbsp&nbsp*** วัวโตห้ามใช้ยูเรียเกิน 2% ของน้ำหนักตัว</label>
					 </div>
				</div>
		 </div>

<%--------------------------------------------------------------------------------------------------------------%>

			  <div class="col-md-12">
				
					 <div class="panel panel-primary">
						 <div class="panel-heading">
							 <h4 class="panel-title" style="font-size: 25px;">รายละเอียดข้อมูลทางโภชนะวัตถุดิบ</h4>
						 </div>
						 <div class="table-responsive">
							 <div class="panel-body">
								 <br>
								
		<table class="table table-striped table-hover" cellspacing="0" cellpadding="0" border="0" width="auto">
  <tr>
    <td>
       <table class="table table-striped table-hover" cellspacing="0" cellpadding="0" border="0" width="auto" >
         <tr >
           								 <th width="11%">ชื่อวัติถุดิบ</th>
										 <th width="7%">วัตถุดิบเเห้ง(%)</th>
										 <th width="7%">โปรตีน(%)</th>
										 <th width="7.2%">TDN</th>
										 <th width="7.2%">NDF</th>
										 <th width="7.2%">ADF</th>
										 <th width="7.2%">แคลเซียม(%)</th>
										 <th width="7%">ฟอสฟอรัส(%)</th>
										 <th width="6.8%">แป้ง(%)</th>
										 <th>%บายพาสโปรตีน</th>
										 <th width="6.8%">%โปรตีนสลายตัว</th>
										 <th>วิตามิน เอ (IU/กก.)</th> 
										 <th>วิตามิน อี (IU/กก.)</th>
         </tr>
       </table>
    </td>
  </tr>
  
  <tr>
    <td>
       <div style="width:auto; height:200px; overflow:auto;">
         <table class="table table-striped table-hover" cellspacing="0" cellpadding="0" border="0" width="auto" id="addtabel_po">
           <tbody></tbody>
         </table>  
       </div>
    </td>
  </tr>
</table>
								 <div class="row form-group" id="page" align="center"></div>
						 </div>
							
					 </div>
			  </div>
			  
			   <%--------------------------------------------- รับค่าการจัดสัดส่วนอาหาร ---------------------------------------------------%>
		
				 <%--------------------------------------------- รับค่าวัตถุดิบเเละแสดงราคา วัตถุดิบ แต่ล่ะ ชนิด ---------------------------------------------------%>
		<div class="col-md-7">
				<div class="panel panel-primary"
							style="font-size: 18px; color: black;">
					<div class="panel-heading">
						<h3 class="panel-title" style="font-size: 18px; color: white;">
							<i class="fa fa-cart-plus"></i>&nbsp;กำหนดน้ำหนักของวัตถุดิบ
						</h3>
					</div>
					<div class="table-responsive">
						<div class="panel-body">
							 <form action="rawmaterialprice" method="POST"  id="rawmaterialprice" >
								<center> 
									<div class="row form-group">
										<table class="table table-striped table-hover" class="form-control" class="font-nav" style="font-size: 16px;" 
										border="0" bordercolor="#BDBDBD" id="addtabel" >
											<thead >
											<tr>
												<th>ชื่อวัตถุดิบ</th>
												<th>น้ำหนักต่ำสุด </th>
												<th>น้ำหนักสูงสุด  </th>
												<th >ปริมาณที่คำนวณได้</th>
												<th>ราคา(บาท/กก.)</th>
											</tr>
											</thead>
										</table>
										
										
									
															<%-- <form:option value="0">ผู้บันทึก</form:option> --%>
																<c:forEach items="${ulist}" var="user">
					
																			<%-- <option value="${user.id }">${user.first}&nbsp;${user.last }</option> --%>
																			<input id="userIds" name="userIds" value="${user.id }" type="hidden">
																</c:forEach>
													
														
										
											
										<!-- น้ำหนักรวม & ราคารวม -->
										<input id="totalSum" name="totalSum" type="hidden">
										<input id="priceSum" name="priceSum" type="hidden">
										<!-- ราคาวัติถุดิบ -->
										<input id="priRaw1" size="10" name="priRaw1"  type="hidden" >	
										<input id="priRaw2" size="10" name="priRaw2"  type="hidden">	
										<input id="priRaw3" size="10" name="priRaw3"  type="hidden" >	
										<input id="priRaw4" size="10" name="priRaw4"  type="hidden" >	
										<input id="priRaw5" size="10" name="priRaw5"  type="hidden" >	
										<input id="priRaw6" size="10" name="priRaw6"  type="hidden">	
										<input id="priRaw7" size="10" name="priRaw7"  type="hidden" >	
										<input id="priRaw8" size="10" name="priRaw8" type="hidden"  >	
										<input id="priRaw9" size="10" name="priRaw9" type="hidden"  >	
										<input id="priRaw10" size="10" name="priRaw10" type="hidden"  >	
										<input id="priRaw11" size="10" name="priRaw11" type="hidden"  >	
										<input id="priRaw12" size="10" name="priRaw12" type="hidden"  >	
										<input id="priRaw13" size="10" name="priRaw13" type="hidden"  >	
										<input id="priRaw14" size="10" name="priRaw14" type="hidden"  >	
										<input id="priRaw15" size="10" name="priRaw15" type="hidden"  >
										<!-- ผลรับที่ได้จากการ Optimize -->	
										<input id="solveSave1" name="solveSave1" type="hidden" >
										<input id="solveSave2" name="solveSave2" type="hidden" >
										<input id="solveSave3" name="solveSave3" type="hidden" >
										<input id="solveSave4" name="solveSave4" type="hidden" >
										<input id="solveSave5" name="solveSave5" type="hidden" >
										<input id="solveSave6" name="solveSave6" type="hidden" >
										<input id="solveSave7" name="solveSave7" type="hidden" >
										<input id="solveSave8" name="solveSave8" type="hidden" >
										<input id="solveSave9" name="solveSave9" type="hidden" >
										<input id="solveSave10" name="solveSave10" type="hidden" >
										<input id="solveSave11" name="solveSave11" type="hidden" >
										<input id="solveSave12" name="solveSave12" type="hidden" >
										<input id="solveSave13" name="solveSave13" type="hidden" >
										<input id="solveSave14" name="solveSave14" type="hidden" >
										<input id="solveSave15" name="solveSave15" type="hidden" >
										<!-- ชื่อวัตถุดิบที่เลือก -->
										<input id="rawSave1" name="rawSave1" type="hidden">
										<input id="rawSave2" name="rawSave2" type="hidden">
										<input id="rawSave3" name="rawSave3" type="hidden">
										<input id="rawSave4" name="rawSave4" type="hidden">
										<input id="rawSave5" name="rawSave5" type="hidden">
										<input id="rawSave6" name="rawSave6" type="hidden">
										<input id="rawSave7" name="rawSave7" type="hidden">
										<input id="rawSave8" name="rawSave8" type="hidden">
										<input id="rawSave9" name="rawSave9" type="hidden">
										<input id="rawSave10" name="rawSave10" type="hidden">
										<input id="rawSave11" name="rawSave11" type="hidden">
										<input id="rawSave12" name="rawSave12" type="hidden">
										<input id="rawSave13" name="rawSave13" type="hidden">
										<input id="rawSave14" name="rawSave14" type="hidden">
										<input id="rawSave15" name="rawSave15" type="hidden">
										<!-- ค่าสูงสุดต่ำสุดที่userระบุ -->
										<input id="low_poSave1" name="low_poSave1" type="hidden">	
										<input id="low_poSave2" name="low_poSave2" type="hidden">	
										<input id="low_poSave3" name="low_poSave3" type="hidden">	
										<input id="low_poSave4" name="low_poSave4" type="hidden">	
										<input id="low_poSave5" name="low_poSave5" type="hidden">	
										<input id="low_poSave6" name="low_poSave6" type="hidden">	
										<input id="low_poSave7" name="low_poSave7" type="hidden">	
										<input id="low_poSave8" name="low_poSave8" type="hidden">	
										<input id="low_poSave9" name="low_poSave9" type="hidden">	
										<input id="low_poSave10" name="low_poSave10" type="hidden">	
										<input id="low_poSave11" name="low_poSave11" type="hidden">	
										<input id="low_poSave12" name="low_poSave12" type="hidden">	
										<!-- ค่าโภชนะวัตถุดิบแต่ล่ะชนิดที่คำนวณ -->
										
										<input id="ddSave1" name="ddSave1" type="hidden">
										<input id="ddSave2" name="ddSave2" type="hidden">
										<input id="ddSave3" name="ddSave3" type="hidden">
										<input id="ddSave4" name="ddSave4" type="hidden">
										<input id="ddSave5" name="ddSave5" type="hidden">
										<input id="ddSave6" name="ddSave6" type="hidden">
										<input id="ddSave7" name="ddSave7" type="hidden">
										<input id="ddSave8" name="ddSave8" type="hidden">
										<input id="ddSave9" name="ddSave9" type="hidden">
										<input id="ddSave10" name="ddSave10" type="hidden">
										<input id="ddSave11" name="ddSave11" type="hidden">
										<input id="ddSave12" name="ddSave12" type="hidden">
										
										<input id="sumTimeId" name="sumTimeId" type="hidden" >	
													
										<%-- <input id="ee1" size="10" name="ee1" type="hidden" >
										<input id="ee2" size="10" name="ee2" type="hidden" >
										<input id="ee3" size="10" name="ee3" type="hidden" >
										<input id="ee4" size="10" name="ee4" type="hidden" >
										<input id="ee5" size="10" name="ee5" type="hidden" >
										<input id="ee6" size="10" name="ee6" type="hidden" >
										<input id="IDR1" name="IDR1" type="hidden" value="${IDR[id] }">
										<input id="hh1" name="hh1" size="10" type="hidden" value="${hh[id] }"> --%>
									</div>
								</center>

							</form> 
						</div>
					</div>

				</div>
				
				<button type="button" onclick='addtabelvi();addtabelpo()'>Add few more Rows!</button>
				<button type="button" onclick='subtable()'>Sub Table </button>
				
			</div>

 <!-- รับค่าโภชน  ที่ี users ต้องการ -->

			<div class="col-md-5">
				<div class="panel panel-primary"
							style="font-size: 18px; color: black;">
					<div class="panel-heading">
						<h3 class="panel-title" style="font-size: 18px; color: white;">
							<i class="fa fa-cart-plus"></i>&nbsp;กำหนดคุณทางโภชนะวัตถุดิบ
						</h3>
					</div>
					<div class="table-responsive">

						<div class="panel-body table-responsive">
							
							<!-- <form action="rawmaterialprice" method="POST"  id="rawmaterialprice" >
								
							<center> -->
								<div class="row form-group">
									<table class="table table-striped table-hover" class="form-control" class="font-nav" style="font-size: 16px;"
									 border="0" bordercolor="#BDBDBD"  >
										<thead >

										<tr>
											<th>โภชนะ</th>
											<!-- <th>น้ำหนักต่ำสุด </th> -->
											<th>ปริมาณที่ต้องการ</th>
											<th>ค่าที่คำนวณได้ </th>
										</tr>

										<!-- เปลี่ยนจาก hh -> hu -->
										<tr height="51.5" style="font-size: 18px">
											<th>วัตถุดิบแห้ง(%)</th>
											<th><input id="low_po0" size="10" type="text" value="${hu[0] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po0" size="10" type="text" value="${cattlenutrient.dm}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd0" size="10" name="dd1" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>โปรตีน(%)</th>
											<th><input id="low_po1" size="10" type="text" value="${hu[1] }" placeholder="0"><br></th> 
											<%-- <th><input id="high_po1" size="10" type="text" value="${cattlenutrient.protein}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd1" size="10" name="dd2" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>พลังงาน TDN</th>
											<th><input id="low_po2" size="10" type="text" value="${hu[2] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po2" size="10" type="text" value="${cattlenutrient.tdn}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd2" size="10" name="dd3" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>เยื่อใย NDF</th>
											<th><input id="low_po3" size="10" type="text" value="${hu[3] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po3" size="10" type="text" value="${cattlenutrient.ndf}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd3" size="10" name="dd4" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>ADF</th>
											<th><input id="low_po4" size="10" type="text" value="${hu[4] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po4" size="10" type="text" value="${cattlenutrient.adf}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd4" size="10" name="dd4" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>แคลเซียม(%)</th>
											<th><input id="low_po5" size="10" type="text" value="${hu[5] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po5" size="10" type="text" value="${cattlenutrient.ca}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd5" size="10" name="dd4" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>ฟอสฟอรัส(%)</th>
											<th><input id="low_po6" size="10" type="text" value="${hu[6] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po6" size="10" type="text" value="${cattlenutrient.p}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd6" size="10" name="dd4" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>แป้ง(%)</th>
											<th><input id="low_po7" size="10" type="text" value="${hu[7] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po7" size="10" type="text" value="${cattlenutrient.nfc}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd7" size="10" name="dd4" type="text" ><br></th>

										</tr>

										 <tr height="51.5" style="font-size: 16px">
											<th>%บายพาสโปรตีน</th>
											<th><input id="low_po8" size="10" type="text" value="${hu[8] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po8" size="10" type="text" value="${hh[8] }" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd8" size="10" name="dd4" type="text" ><br></th>
										</tr>

										<tr height="51.5" style="font-size: 18px">
											<th>%โปรตีนสลายได้</th>
											<th><input id="low_po9" size="10" type="text" value="${hu[9] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po9" size="10" type="text" value="${hh[9] }" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd9" size="10" name="dd4" type="text" ><br></th>
										</tr> 

										<tr height="51.5" style="font-size: 18px">
											<th>วิตามิน เอ</th>
											<th><input id="low_po10" size="10" type="text" value="${hu[10] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po10" size="10" type="text" value="${cattlenutrient.vitA}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd10" size="10" name="dd5" type="text" ><br></th>
										</tr>
										
										<tr height="51.5" style="font-size: 18px">
											<th>วิตามิน อี</th>
											<th><input id="low_po11" size="10" type="text" value="${hu[11] }" placeholder="0"><br></th>
											<%-- <th><input id="high_po11" size="10" type="text" value="${cattlenutrient.vitE}" placeholder="100"><br></th> --%>
											<th><input readonly="true" id="dd11" size="10" name="dd6" type="text" ><br></th>
										</tr>
										
								
										
									</thead>
											<%-- <th><input id="low_po11" size="10" type="number" value="${hu[11] }" placeholder="0"><br></th>
											<th><input id="high_po11" size="10" type="number" max="100" value="${hh[11] }" placeholder="100"><br></th> --%>

								</table>
									
											<%-- <input id="IDR1" name="IDR1" type="hidden" value="0">
											<input id="IDR2" name="IDR2" type="hidden" value="0">
											<input id="IDR3" name="IDR3" type="hidden" value="0">
											<input id="IDR4" name="IDR4" type="hidden" value="0">
											<input id="IDR5" name="IDR5" type="hidden" value="0">
											<input id="IDR6" name="IDR6" type="hidden" value="0">
											
											<input id="hh1" name="hh1" size="10" type="hidden" value="${cattlenutrient.dm}">
											<input id="hh2" name="hh2" size="10" type="hidden" value="${cattlenutrient.protein}">
											<input id="hh3" name="hh3" size="10" type="hidden" value="${cattlenutrient.tdn}">
											<input id="hh4" name="hh4" size="10" type="hidden" value="${cattlenutrient.ndf}">
											<input id="hh5" name="hh5" size="10" type="hidden" value="${cattlenutrient.adf}">
											<input id="hh6" name="hh6" size="10" type="hidden" value="${cattlenutrient.ca}">
											<input id="hh7" name="hh7" size="10" type="hidden" value="${cattlenutrient.p}">
											<input id="hh8" name="hh8" size="10" type="hidden" value="${cattlenutrient.nfc}">
											<input id="hh9" name="hh9" size="10" type="hidden" value="${cattlenutrient.vitA}">
											<input id="hh10" name="hh10" size="10" type="hidden" value="${cattlenutrient.vitE}">
									 --%>
									<h5>ปริมาณรวม  : <input  readonly="true"  id="total1" name="total1" size="8" type="text"> กิโลกรัม &nbsp;&nbsp;</h5>
									<h5>ราคาเฉลี่ยรวม  : <input  readonly="true" id="priceSum1" name="priceSum1" size="8" type="text"> บาท/กิโลกรัม</h5>
								</div>
								<p> seconds : <span id="sumTime"></span></p>
							<!-- </center>
							</form> -->
						</div>
					</div>
				</div>
					<div class="col-md-12" align="center">
						<!-- <button type="button" class="btn btn-default btn-lg" id="" onclick=""><a href="setrawmaterialdairy">จัดสัดส่วนอาหารโคนม</a></button> 
						&nbsp; -->
						<button class="btn btn-success" id="calraw_sum" onclick="cal_quantity()">ทำการคำนวณหาค่าปริมาณ</button>
						&nbsp;
						<!-- <button class="btn btn-success" id="cen1" onclick="cal_Nutrition()">ทำการรวมค่าทางโภชนะ</button> -->
						<button type="button" class="btn btn-default btn-lg" id="addcalformula" onclick="addcalformula()">บันทึกสูตร</button>
						&nbsp;
					</div>
			</div>

</div>

	
	<jsp:include page="../footer.jsp" />
	
	
  <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
  <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>

	<script type="text/javascript">
	
	var mat_arr = [];
	var mat_arr_each = [];

	var id_list_mat_po = 0;
	var id_list_mat = 0;
	var select_arr = [];
	
	var list_rawid = [];
	var list_rawid_buffer = [];
	var list_rawid_sp = [];
	
	var list_priceid = [];
	
	var raw_optimize;
	
	///ส่งค่าผ่านurl to calculatelowcost
	var price1 = $('#price1').val();
	
	

	var test_arr = `<c:forEach items="${rawlist}" var="group">
		<c:if test="${group.typeMaterial.id == 2}">
			<c:if test="${IDR[id] != group.id }">
				[${group.id},"${group.name}"],
			</c:if>
		</c:if>
	</c:forEach>`;
	test_arr = test_arr.replace(/\s+/g, '');
	test_arr = test_arr.slice(0,-1);
	list_rawid = JSON.parse("["+test_arr+"]");
	list_rawid_buffer = JSON.parse("["+test_arr+"]");
	
	
/* 	$.ajax({
		url: "helloJson",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify({"param": [555, 666]}),
		dataType: "json",
		success:function(kk) {
			console.log(kk);
		}
	}); */
	
//$('#cen1').html("<a href='calculatedairywithParam?param="+price[i]+"&G="+arr_sum+"&dim="+[i]+"&idR="+id_r[i]+"&h="+high_po[i]+"&h=-100.0&lb="+low_raw[i]+"&ub="+high_raw[i]+"'>ทำการคำนวณหาค่าปริมาณ</a>");
	var sum_optimize = 0; 
	var price_cal = [];
	var sum_price_cal = 0;
	var sumraw_sh_po_dm = 0;
	var sumraw_sh_po_protein = 0;
	var sumraw_sh_po_tdn = 0;
	var sumraw_sh_po_ndf = 0;
	var sumraw_sh_po_adf = 0;
	var sumraw_sh_po_ca = 0;
	var sumraw_sh_po_p = 0;
	var sumraw_sh_po_nfc = 0;
	var sumraw_sh_po_uip = 0;
	var sumraw_sh_po_dip = 0;
	var sumraw_sh_po_vitA= 0;
	var sumraw_sh_po_vitE = 0;
	
	var raw_sh_po = [];
	
	
	function precisionRound(number, precision) {
		  var factor = Math.pow(10, precision);
		  return Math.round(number * factor) / factor;
		}

	
	$(document).on('click','#calraw_sum',function(e){ //id of button
		var timeStart;
		/* var n = event.timeStamp;
			
			document.getElementById("demo").innerHTML = n; */
			timeStart(e);
			function timeStart(event) {
			    /* var n = event.timeStamp; */ 
			    current_date = new Date();
			   timeStart = current_date.getMilliseconds();
			   /*  var timeStart = Math.floor(new Date().getTime() / 1000); */
			    
			   
			} 
			
		var data = cal_quantity();
	
		/* var result_sum = {"param":price,"G":arr_sum,"dim":price.length,"idR":id_r,"h":high_po,"lb":low_raw,"ub":high_raw}; */
		var result_sum = {"param":data[0],"gg":data[1],"dim":data[2],"idr":data[3],"height":data[4],"lb":data[5],"ub":data[6]};
			console.log("result_data : ",result_sum);
			
		$.ajax({
			url:"helloJson", //send to controller
			method:"POST",
			contentType: "application/json",
			data: JSON.stringify(result_sum),
			dataType: "json",
			success:function (callback) {
				console.log("callback_f : ",callback);
				
				timeEnd(callback);
				function timeEnd(event) {
				    /* var n = event.timeStamp; */
				    
				    current_date = new Date();
			  		var timeEnd = current_date.getMilliseconds();
				    /* var timeEnd = Math.floor(new Date().getTime() / 1000); */
				    /* document.getElementById("timeEnd").innerHTML = timeEnd; */
				   /*   console.log("timeStamp_Start",timeStart); 
				    	 console.log("timeStamp_End",timeEnd); */ 
				    	 
				   /*  	 sec = Math.floor((ms/1000) % 60);
				    	 console.log(min + ':' + sec); */
				    	 
				    	 var sumTime = ((timeEnd - timeStart) / 1000);
				    	 var sumTimeId = sumTime;
				    	 $("#sumTimeId").val(sumTimeId);
				    	 document.getElementById("sumTime").innerHTML = sumTime;
				    	 console.log("sumTime",sumTime); 
				} 
				
				
				sum_optimize=0;
					raw_optimize =  callback.result;
					console.log("ค่าวัตถุดิบ_optimize : ",raw_optimize);
					MsgError = "";
					MsgError+="ปริมาณรวมควรไม่เกิน 100 กิโลกรัม\n หรือคุณค่าทางโภชนะยังไม่พอ กรุณาเลือกวัตถุดิบใหม่ \nหรือลดค่าคุณค่าที่ต้องการ";
					for(var i=0;i<raw_optimize.length;i++){
						sum_optimize += raw_optimize[i];
						if(sum_optimize > 101){
							swal("คำนวณไม่สำเร็จ",MsgError, "error");
						}else
							swal("สำเร็จ", "ทำการรวมสำเร็จ", "success");
						}
					
					console.log("ผลรวมน้ำหนัก 100 : ",sum_optimize);
					$( "#total1" ).val(precisionRound(sum_optimize, 0));
					$( "#totalSum" ).val(precisionRound(sum_optimize, 0));
					var data=cal_quantity();
					var price = data[0];
					var arr_sum = data[1];
					console.log("price :",price);
					$("#PRIC").val(price);
					console.log("arr_sum_po:",arr_sum);
					
					sum_price_cal=0;
					//ราคาเฉลี่ยวัตถุดิ	
					for (var j=0; j<raw_optimize.length; j++){
						sum_price_cal += (raw_optimize[j]*price[j])/100;
						//console.log("Show_pcal",sum_price_cal[j]);
					}
						//sum_price_cal += price_cal[j] ;	
						console.log("ราคาเฉลี่ยรวม : ",sum_price_cal);
					$( "#priceSum1" ).val(precisionRound(sum_price_cal, 2));
					$( "#priceSum" ).val(precisionRound(sum_price_cal, 2));
					
					for (var i=0; i< raw_optimize.length; i++) {				
						$("#solve"+(i+1)).val(precisionRound(raw_optimize[i], 2));
						//$("#solveSave"+(i+1)).val(precisionRound(raw_optimize[i], 2));
						//console.log("solve:",raw_optimize[i]);
					}
					
					sumraw_sh_po_dm=0;
					// sum raw_optimize && dm
					for (var i=0; i< raw_optimize.length; i++) {
							var raw_dm =[];
							raw_dm[i] = parseFloat($('#dm'+(i+1)).val());
							console.log("raw_sh_po dm:",raw_sh_po[i+1]); 
							sumraw_sh_po_dm += (((raw_optimize[i])*(raw_dm[i]))/100);
					}
					
					sumraw_sh_po_protein=0;
					// sum raw_optimize && protein	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_protein=[];
						var raw_dmP =[];
						
						raw_dmP[i] = parseFloat($('#dm'+(i+1)).val());
						/* console.log("raw_dmP:",raw_dmP[i]);  */
						
						raw_protein[i] = parseFloat($('#protein'+(i+1)).val());
						sumraw_sh_po_protein += (((((raw_optimize[i])*(raw_protein[i]))/100)/100)*(raw_dmP[i]));
					}
					
					sumraw_sh_po_tdn=0;
					// sum raw_optimize && tdn	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_tdn=[];
						var raw_dmT=[];
						
						raw_dmT[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_tdn[i] = parseFloat($('#tdn'+(i+1)).val());
						sumraw_sh_po_tdn += (((((raw_optimize[i])*(raw_tdn[i]))/100)/100)*(raw_dmT[i]));
					}
					
					sumraw_sh_po_ndf=0;
					// sum raw_optimize && ndf	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_ndf=[];
						var raw_dmN=[];
						
						raw_dmN[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_ndf[i] = parseFloat($('#ndf'+(i+1)).val());
						sumraw_sh_po_ndf += (((((raw_optimize[i])*(raw_ndf[i]))/100)/100)*(raw_dmN[i]));
					}
					
					sumraw_sh_po_adf=0;
					// sum raw_optimize && adf	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_adf=[];
						var raw_dmA=[];
						
						raw_dmA[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_adf[i] = parseFloat($('#adf'+(i+1)).val());
						sumraw_sh_po_adf += (((((raw_optimize[i])*(raw_adf[i]))/100)/100)*(raw_dmA[i]));
					}
					
					sumraw_sh_po_ca=0;
					// sum raw_optimize && ca	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_ca=[];
						var raw_dmC=[];
						
						raw_dmC[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_ca[i] = parseFloat($('#ca'+(i+1)).val());
						sumraw_sh_po_ca += (((((raw_optimize[i])*(raw_ca[i]))/100)/100)*(raw_dmC[i]));
					}
					
					sumraw_sh_po_p=0;
					// sum raw_optimize && p	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_p=[];
						var raw_dmPO=[];
						
						raw_dmPO[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_p[i] = parseFloat($('#p'+(i+1)).val());
						sumraw_sh_po_p += (((((raw_optimize[i])*(raw_p[i]))/100)/100)*(raw_dmPO[i]));
					}
					
					sumraw_sh_po_nfc=0;
					// sum raw_optimize && nfc	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_nfc=[];
						var raw_dmNF=[];
						
						raw_dmNF[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_nfc[i] = parseFloat($('#NFC'+(i+1)).val());
						sumraw_sh_po_nfc += (((((raw_optimize[i])*(raw_nfc[i]))/100)/100)*(raw_dmNF[i]));
					}
					
					sumraw_sh_po_uip=0;
					// sum raw_optimize && uip	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_uip=[];
						var raw_dmUI=[];
						
						raw_dmUI[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_uip[i] = parseFloat($('#UIP'+(i+1)).val());
						sumraw_sh_po_uip += (((((raw_optimize[i])*(raw_uip[i]))/100)/100)*(raw_dmUI[i]));
					}
					
					sumraw_sh_po_dip = 0;
					// sum raw_optimize && dip	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_dip=[];
						var raw_dmDI=[];
						
						raw_dmDI[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_dip[i] = parseFloat($('#DIP'+(i+1)).val());
						sumraw_sh_po_dip += (((((raw_optimize[i])*(raw_dip[i]))/100)/100)*(raw_dmDI[i]));
					}
					
					sumraw_sh_po_vitA = 0;
					// sum raw_optimize && vitA	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_vitA=[];
						var raw_dmVA=[];
						
						raw_dmVA[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_vitA[i] = parseFloat($('#vitA'+(i+1)).val());
						sumraw_sh_po_vitA += ( (((((raw_optimize[i])*(raw_vitA[i]))/100)/100)*(raw_dmVA[i]))*100 );
					}
					
					sumraw_sh_po_vitE = 0;
					// sum raw_optimize && vitE	
					for(var i=0; i< raw_optimize.length; i++){
						var raw_vitE=[];
						var raw_dmVE=[];
						
						raw_dmVE[i] = parseFloat($('#dm'+(i+1)).val());
						
						raw_vitE[i] = parseFloat($('#vitE'+(i+1)).val());
						sumraw_sh_po_vitE += (((((raw_optimize[i])*(raw_vitE[i]))/100)/100)*(raw_dmVE[i]));
					}
					
					
					//console.log("sumraw_sh_po_dm:",sumraw_sh_po_dm);
					$("#dd0").val(precisionRound(sumraw_sh_po_dm, 2));
					$("#dd1").val(precisionRound(sumraw_sh_po_protein, 2));
					$("#dd2").val(precisionRound(sumraw_sh_po_tdn, 2));
					$("#dd3").val(precisionRound(sumraw_sh_po_ndf, 2));
					$("#dd4").val(precisionRound(sumraw_sh_po_adf, 2));
					$("#dd5").val(precisionRound(sumraw_sh_po_ca, 2));
					$("#dd6").val(precisionRound(sumraw_sh_po_p, 2));
					$("#dd7").val(precisionRound(sumraw_sh_po_nfc, 2));
					$("#dd8").val(precisionRound(sumraw_sh_po_uip, 2));
					$("#dd9").val(precisionRound(sumraw_sh_po_dip, 2));
					$("#dd10").val(precisionRound(sumraw_sh_po_vitA, 2));
					$("#dd11").val(precisionRound(sumraw_sh_po_vitE, 2));
					
				/* var price01 = $('#price01').val();
					$("#priRaw1").val(price01);
				var price02 = $('#price02').val();
					$("#priRaw2").val(price02);
				var price03 = $('#price03').val();
					$("#priRaw3").val(price03);	
				var price04 = $('#price04').val();
					$("#priRaw4").val(price04);
				var price05 = $('#price05').val();
					$("#priRaw5").val(price05);
				var price06 = $('#price06').val();
					$("#priRaw6").val(price06);
				var price07 = $('#price07').val();
					$("#priRaw7").val(price07);
				var price08 = $('#price08').val();
					$("#priRaw8").val(price08);
				var price09 = $('#price09').val();
					$("#priRaw9").val(price09);
				var price10 = $('#price10').val();
					$("#priRaw10").val(price10);
				var price11 = $('#price11').val();
					$("#priRaw11").val(price11);
				var price12 = $('#price12').val();
					$("#priRaw12").val(price12);
				var price13 = $('#price13').val();
					$("#priRaw13").val(price13);
				var price14 = $('#price14').val();
					$("#priRaw14").val(price14);
				
				
				if($('#price15').val() == undefined){
					var price15 = 0;
					$("#priRaw15").val(price15);	
					}else{
						var price15 = $('#price15').val();
						$("#priRaw15").val(price15);
					} */
				
					//console.log("$('#price1').val() : ",$('#price1').val());	
				 for (var i=0; i<= 15; i++) {
						if($('#price'+i).val() == undefined || $('#price'+i).val() == ""){
							//$('#price'+i).val(0) 
								var num = 0;
							$("#priRaw"+i).val( num );
						}else{
							var price = $('#price'+i).val();
							$("#priRaw"+i).val(price);
						}
						
						//console.log("solve:",raw_optimize[i]);
					} 
				 
				 for (var i=0; i<= 15; i++) {
						if($('#solve'+i).val() == undefined || $('#solve'+i).val() == ""){
							//$('#price'+i).val(0) 
								var num = 0;
							$("#solveSave"+i).val( num );
						}else{
							var cal = $('#solve'+i).val();
							$("#solveSave"+i).val(cal);
						}
						
						//console.log("solve:",raw_optimize[i]);
					} 
					
				 
				 for (var i=0; i<= 15; i++) {
						if($('#raw'+i).val() == undefined || $('#raw'+i).val() == ""){
							//$('#price'+i).val(0) 
								var num = 0;
							$("#rawSave"+i).val( num );
						}else{
							var cal = $('#raw'+i).val();
							$("#rawSave"+i).val(cal);
						}
						
						//console.log("solve:",raw_optimize[i]);
					} 
				
				for (var i=0; i< 12; i++) {
					if($('#low_po'+i).val() == ""){
						$("#low_poSave"+(i+1)).val( $('#low_po'+i).val(0) );
					}
					$("#low_poSave"+(i+1)).val( $('#low_po'+i).val() );
					//console.log("solve:",raw_optimize[i]);
				}
				
				 
				for (var i=0; i< 12; i++) {				
						$("#ddSave"+(i+1)).val( $('#dd'+i).val() );
						//console.log("solve:",raw_optimize[i]);
					} 
				
					
					/* for (var i=0; i< raw_optimize.length; i++) {				
						$("#dd"+(i+1)).val((raw_optimize[i]));
						console.log("solve:",raw_optimize[i]);
					}
					 */
					 
				/// get ค่าที่ผู้ใช้กำหนด
				var dm = $('#low_po0').val();
				var cp = $('#low_po1').val();
				var tdn = $('#low_po2').val();

				var mg_dm = "";
				var mg_cp ="";
				var mg_tdn = "";
				
				
			 		//console.log(mg_dm);
			
		MsgError = "";
		 
		//console.log("totalSum : ",totalSum);	 
		 if($('#total1').val() > 101){
			 MsgError+="ปริมาณรวมควรไม่เกิน 100 กิโลกรัม\n หรือคุณค่าทางโภชนะยังไม่พอ กรุณาเลือกวัตถุดิบใหม่ \nหรือลดค่าคุณค่าที่ต้องการ\n";		 
			//swal("คำนวณไม่สำเร็จ",MsgError, "error");
		}	
		
		//console.log(dm , " > " ,sumraw_sh_po_dm);
		if(dm > sumraw_sh_po_dm ){
			MsgError +="ค่าเปอร์เซ็นวัตถุดิบแห้งไม่เพียงพอ ขาด ";
			MsgError += precisionRound(dm - sumraw_sh_po_dm,2);
			MsgError += "%\n";
			//swal("คำนวณไม่สำเร็จ",mg_dm, "error");
		}
		if(cp > sumraw_sh_po_protein ){
			MsgError +="ค่าเปอร์เซ็นโปรตีนวัตถุดิบไม่เพียงพอ ขาด ";
			MsgError += precisionRound(cp - sumraw_sh_po_protein,2);
			MsgError += "%\n";
			//swal("คำนวณไม่สำเร็จ",mg_cp, "error");
		}
		if(tdn > sumraw_sh_po_tdn ){
			MsgError +="ค่าเปอร์เซ็นTDNวัตถุดิบไม่เพียงพอ ขาด ";
			MsgError += precisionRound(tdn - sumraw_sh_po_tdn,2);
			MsgError += "%\n";
			//swal("คำนวณไม่สำเร็จ",mg_tdn, "error");
		}
		if($('#total1').val() > 101 || dm > sumraw_sh_po_dm || cp > sumraw_sh_po_protein || tdn > sumraw_sh_po_tdn ){
			
			swal("คำนวณไม่สำเร็จ",MsgError, "error");
		}
		 
		 else{
			swal("สำเร็จ", "ทำการรวมสำเร็จ", "success");
		}
					 
					 
					
				
			}
		});
		/* $.ajax({url: "listoptimize",data : {id:selectedValue}}).done(function(element) {
			var json = JSON.parse(element);
			$( "#solve_r"+id ).val(json.);
		}) */
		
		
	});
	
	//console.log("Optimize_raw : ",raw_optimize);
	
	function selectmat(id){
		var arrsum = {"id":0,"protein":0.0,"tdn":0.0,"nfc":0,"dm":0,"uip":0,"dip":0,"ca":0.0,"p":0.0,"urea":0.0,"cl":0.0,"k":0.0,"s":0.0,"mg":0.0,"zn":0.0,"cu":0.0,"mn":0.0,"co":0.0,"se":0.0,"i":0.0,"vitA":0.0,"vitD":0.0,"vitE":0.0,"nel":0,"nem":0,"neg":0,"ndf":0.0,"ee":0.0,"cp":0.0,"cf":0.0,"ash":0.0,"nfe":0.0,"adf":0.0,"adl":0.0,"de":0.0,"me":0.0,"na":0.0,"fe":0.0};
		mat_arr[id] = arrsum;
		select_arr[id] = '';
		mat_arr_each[id] = [0, 'เลือกวัตถุดิบ', arrsum];
        var str = `<select class="form-control rawid " name="raw`+id+`" id="raw`+id+`" onchange="listdata(`+id+`)" ><option value="0" id="opt` + id + `_0">เลือกวัตถุดิบ</option>`;
        if (id == 1) {
            for (var i=0; i<list_rawid.length; i++) {
                str += `<option value="` + list_rawid[i][0] + `" id="opt` + id + `_` + list_rawid[i][0] + `">` + list_rawid[i][1] + `</option>`;
            }
        }else {
            for (var j = 0; j < list_rawid.length; j++) {
                var has = false;
                if (mat_arr_each.length > 0){
                    for (var i=1; i<mat_arr_each.length; i++) {
                        if (mat_arr_each[i][0] == list_rawid[j][0])
                            has = true;
                    }
				}
				if (!has){
                    str += `<option value="` + list_rawid[j][0] + `" id="opt` + id + `_` + list_rawid[j][0] + `">` + list_rawid[j][1] + `</option>`;
				}
            }
        }
		
		str += `</select>`;
		return str;
	}

	/*`<select class="form-control rawid " name="raw`+id+`" id="raw`+id+`" onchange="listdata(`+id+`)" >
		<option value="0">เลือกวัตถุดิบ</option>
		 <c:forEach items="${rawlist}" var="group">
			<c:if test="${IDR[id] == group.id }">
				<option value="${group.id}" selected="selected" >${group.name}</option></c:if>
			<c:if test="${group.typeMaterial.id == 2}">
				<c:if test="${IDR[id] != group.id }">
					<option value="${group.id }" id="opt`+id+`_${group.id}">
						${group.name}	
					</option>
				</c:if>
			</c:if>
		</c:forEach> 
	</select>`;*/
	

    function onSelect(id) {
        var value = $('#test_' + id).val();
        var text = $('#opt_' + id + '_' + value).html();
        var data = mat_arr_each[id][2];
        mat_arr_each[id] = [];
        mat_arr_each[id] = [value, text, data];
        console.log(mat_arr_each[id]);
        onChange();
        
    }

	function onChange() {
		
        for (var k=1; k<mat_arr_each.length; k++) {
            var str = `<option value="0" id="opt` + k + `_0">เลือกวัตถุดิบ</option>`;
            for (var j=0; j<list_rawid.length; j++) {
                var has = false;
                if (mat_arr_each.length > 0) {
                    for (var i=1; i<mat_arr_each.length; i++) {
                        if (mat_arr_each[i][0] == list_rawid[j][0])
                            has = true;
                    }
                    if (mat_arr_each[k][0] == list_rawid[j][0])
                        str += `<option value="` + list_rawid[j][0] + `" id="opt` + k + `_` + list_rawid[j][0] + `" selected>` + list_rawid[j][1] + `</option>`;
                }
                if (!has) {
                 	   str += `<option value="` + list_rawid[j][0] + `" id="opt` + k + `_` + list_rawid[j][0] + `">` + list_rawid[j][1] + `</option>`;
                }
            }
            $('#raw' + k).html(str);
        }
    }
	
	function inputdatamat(id, cell){
		if (cell==1){
			return `<input id="low_raw`+id+`" size="10" type="text" value="${ll[id] }" placeholder="0">`;
		}
		if (cell==2){
			return `<input id="high_raw`+id+`" size="10" type="text" value="${uu[id] }" placeholder="100">`;
		}
		if (cell==3){
			return `<input readonly="true" id="solve`+id+`" size="10"  type="text"value="${d[id] }" >`;
		}
		if (cell==4){
			return `<input readonly="true" id="price`+id+`" size="10"  type="text" value="${c[id] }">`;
		}
	}
	
	function addtabelvi() {
		if(id_list_mat<15){
		    var table = document.getElementById("addtabel");
		    var header = table.createTHead();
		    var row = header.insertRow(-1);
		    var cell1 = row.insertCell(0);
		    var cell2 = row.insertCell(1);
		    var cell3 = row.insertCell(2);
		    var cell4 = row.insertCell(3);
		    var cell5 = row.insertCell(4);
		    var id = ++id_list_mat;
		    cell1.innerHTML = '<b>' + selectmat(id) + '</b>';
		    cell2.innerHTML = '<b>' + inputdatamat(id,1) + '</b>';
		    cell3.innerHTML = '<b>' + inputdatamat(id,2) + '</b>';
		    cell4.innerHTML = '<b>' + inputdatamat(id,3) + '</b>';
		    cell5.innerHTML = '<b>' + inputdatamat(id,4) + '</b>';
		    
		//      if (mat_arr_each.length > 0) {
		// 	var plus = 0;
		// 		for (var i =1; i<mat_arr_each.length; i++) {
		// 		plus += mat_arr_each[i][2].ca;
		// 			console.log(mat_arr_each[i][1],": ",mat_arr_each[i][2]);
		// 	}
		// 		console.log('CA: ', Math.round(plus));
		// } 
			
		}
   }
	
	function inputdatapo(id, cell){
		if (cell==0){
			return `<input readonly="true" id="name`+id+`" size="25" name="name`+id+`"  type="text">`;
		}
		if(cell==1){
			return `<input readonly="true" id="dm`+id+`" size="15" name="dm`+id+`" type="text">`;
		}
		if(cell==2){
			return `<input readonly="true" id="protein`+id+`" size="15" name="protein`+id+`" type="text">`;
		}
		if(cell==3){
			return `<input readonly="true" id="tdn`+id+`" size="15" name="tdn`+id+`" type="text">`;
		}
		if(cell==4){
			return `<input readonly="true" id="ndf`+id+`" size="15" name="ndf`+id+`" type="text">`;
		}
		if(cell==5){
			return `<input readonly="true" id="adf`+id+`" size="15" name="adf`+id+`" type="text">`;
		}
		if(cell==6){
			return `<input readonly="true" id="ca`+id+`" size="15" name="ca`+id+`" type="text">`;
		}
		if(cell==7){
			return `<input readonly="true" id="p`+id+`" size="15" name="p`+id+`" type="text">`;
		}
		if(cell==8){
			return `<input readonly="true" id="NFC`+id+`" size="15" name="NFC`+id+`" type="text">`;
		}
		if(cell==9){
			return `<input readonly="true" id="UIP`+id+`" size="15" name="UIP`+id+`" type="text">`;
		}
		if(cell==10){
			return `<input readonly="true" id="DIP`+id+`" size="15" name="DIP`+id+`" type="text">`;
		}
		if(cell==11){
			return `<input readonly="true" id="vitA`+id+`" size="20" name="vitA`+id+`">`;
		}
		if(cell==12){
			return `<input readonly="true" id="vitE`+id+`" size="20" name="vitE`+id+`">`;
		}
	}
	
	//เพิ่มปริมาณการเลือกวัตถุดิบ
	function addtabelpo() {
		if(id_list_mat_po<15){
	    var table = document.getElementById("addtabel_po").getElementsByTagName('tbody')[0];
	    //var header = table.createTBody();
	    //var row = header.insertRow(-1);
	    var row = table.insertRow(-1);
	    var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5 = row.insertCell(4);
	    var cell6 = row.insertCell(5);
	    var cell7 = row.insertCell(6);
	    var cell8 = row.insertCell(7);
	    var cell9 = row.insertCell(8);
	    var cell10 = row.insertCell(9);
	    var cell11 = row.insertCell(10);
	    var cell12 = row.insertCell(11);
	    var cell13 = row.insertCell(12);
	   
	    var id = ++id_list_mat_po;
	    cell1.innerHTML = '<b>' + inputdatapo(id,0) + '</b>';
	    cell2.innerHTML = '<b>' + inputdatapo(id,1) + '</b>';
	    cell3.innerHTML = '<b>' + inputdatapo(id,2) + '</b>';
	    cell4.innerHTML = '<b>' + inputdatapo(id,3) + '</b>';
	    cell5.innerHTML = '<b>' + inputdatapo(id,4) + '</b>';
	    cell6.innerHTML = '<b>' + inputdatapo(id,5) + '</b>';
	    cell7.innerHTML = '<b>' + inputdatapo(id,6) + '</b>';
	    cell8.innerHTML = '<b>' + inputdatapo(id,7) + '</b>';
	    cell9.innerHTML = '<b>' + inputdatapo(id,8) + '</b>';
	    cell10.innerHTML = '<b>' + inputdatapo(id,9) + '</b>';
	    cell11.innerHTML = '<b>' + inputdatapo(id,10) + '</b>';
	    cell12.innerHTML = '<b>' + inputdatapo(id,11) + '</b>';
	    cell13.innerHTML = '<b>' + inputdatapo(id,12) + '</b>';
		}
   }
	
	function makeItNull (id) {
		
		mat_arr_each[id][0] = 0;
		mat_arr_each[id][1] = 'เลือกวัตถุดิบ';
		
		mat_arr_each[id][2].dm = 0;
		mat_arr_each[id][2].protein = 0;
		mat_arr_each[id][2].tdn = 0;
		mat_arr_each[id][2].ndf = 0;
		mat_arr_each[id][2].ca = 0;
		mat_arr_each[id][2].p = 0;
		mat_arr_each[id][2].vitA =0;
		mat_arr_each[id][2].vitE =0;
		mat_arr_each[id][2].adf =0;
		mat_arr_each[id][2].nfc =0;
		mat_arr_each[id][2].uip =0;
		mat_arr_each[id][2].dip =0;
	}
	
	function subtable(){
		if(id_list_mat>1){
		var id = id_list_mat--;
		var table = document.getElementById("addtabel");
			table.deleteRow(id);
		    id = id_list_mat_po--;
		var table = document.getElementById("addtabel_po");
			table.deleteRow(id-1);	
			var arrsum = {"id":0,"protein":0.0,"tdn":0.0,"nfc":0,"dm":0,"uip":0,"dip":0,"ca":0.0,"p":0.0,"urea":0.0,"cl":0.0,"k":0.0,"s":0.0,"mg":0.0,"zn":0.0,"cu":0.0,"mn":0.0,"co":0.0,"se":0.0,"i":0.0,"vitA":0.0,"vitD":0.0,"vitE":0.0,"nel":0,"nem":0,"neg":0,"ndf":0.0,"ee":0.0,"cp":0.0,"cf":0.0,"ash":0.0,"nfe":0.0,"adf":0.0,"adl":0.0,"de":0.0,"me":0.0,"na":0.0,"fe":0.0};
			makeItNull(id);
			var json = arrsum;
			$( "#IDR"+id ).val(json.id);
			$( "#dm"+id ).val(json.dm);
			$( "#protein"+id ).val(json.protein);
			$( "#tdn"+id ).val(json.tdn);
			$( "#ndf"+id ).val(json.ndf);
			$( "#ca"+id ).val(json.ca);
			$( "#p"+id ).val(json.p);
			$( "#vitA"+id ).val(json.vitA);
			$( "#vitE"+id ).val(json.vitE);
			$( "#adf"+id ).val(json.adf);
			$( "#NFC"+id ).val(json.nfc); 	/* แป้ง */
			$( "#UIP"+id ).val(json.uip); 	/*บายโปรตีน*/
			$( "#DIP"+id ).val(json.dip); 
		}
	}
	
	function toShow(id) {
		var arrsum = {"id":0,"protein":0.0,"tdn":0.0,"nfc":0,"dm":0,"uip":0,"dip":0,"ca":0.0,"p":0.0,"urea":0.0,"cl":0.0,"k":0.0,"s":0.0,"mg":0.0,"zn":0.0,"cu":0.0,"mn":0.0,"co":0.0,"se":0.0,"i":0.0,"vitA":0.0,"vitD":0.0,"vitE":0.0,"nel":0,"nem":0,"neg":0,"ndf":0.0,"ee":0.0,"cp":0.0,"cf":0.0,"ash":0.0,"nfe":0.0,"adf":0.0,"adl":0.0,"de":0.0,"me":0.0,"na":0.0,"fe":0.0};
			arrsum.dm = mat_arr[id].dm;
			arrsum.protein = mat_arr[id].protein;
			arrsum.tdn = mat_arr[id].tdn;
			arrsum.ndf = mat_arr[id].ndf;
			arrsum.ca = mat_arr[id].ca;
			arrsum.p = mat_arr[id].p;
			arrsum.vitA = mat_arr[id].vitA;
			arrsum.vitE = mat_arr[id].vitE;
			arrsum.adf = mat_arr[id].adf;
			arrsum.nfc = mat_arr[id].nfc;
			arrsum.uip = mat_arr[id].uip;
			arrsum.dip = mat_arr[id].dip;
		var json = arrsum;
		$('#name'+id).val(select_arr[id]);
		$( "#IDR"+id ).val(json.id);
		$( "#dm"+id ).val(json.dm);
		$( "#protein"+id ).val(json.protein);
		$( "#tdn"+id ).val(json.tdn);
		$( "#ndf"+id ).val(json.ndf);
		$( "#ca"+id ).val(json.ca);
		$( "#p"+id ).val(json.p);
		$( "#vitA"+id ).val(json.vitA);
		$( "#vitE"+id ).val(json.vitE);
		$( "#adf"+id ).val(json.adf);
		$( "#NFC"+id ).val(json.nfc); 	/* แป้ง */
		$( "#UIP"+id ).val(json.uip); 	/*บายโปรตีน*/
		$( "#DIP"+id ).val(json.dip); 
	}
	

function listdata(id) { //เอาหน่วยที่ใช้ในคลังอออกมา

	var selectedValue = $("#raw"+id).val();  //หลังclass form control
    var text = $('#opt' + id + '_' + selectedValue).html();
    

 	if(selectedValue != 0){

		var name = $("#opt" + id + "_" + selectedValue).html();
		select_arr[id] = name;//name.replace(/\s+/g, '');
		
		$.ajax({url: "listData1",data : {id:selectedValue}}).done(function(element) {
			var json = JSON.parse(element);
			$( "#price"+id ).val(json.price);
			$( "#nameraw0"+id ).val(json.rawMaterial.id);
			
		});

		
		$.ajax({url: "listData",data : {id:selectedValue}}).done(function(element) {
			var json = JSON.parse(element);
			mat_arr[id] = json;
			mat_arr_each[id][2] = json;
			toShow(id);
		    mat_arr_each[id] = [];
		    mat_arr_each[id] = [selectedValue, text, json];
		    
		});

	} else {
		select_arr[id] = '';
		$( "#price"+id ).val("");
		$( "#nameraw0"+id ).val("");
		makeItNull(id);
		toShow(id);
	}
 	
 	setTimeout(function(){
 		onChange();
 		cal_quantity();
 	}, 300);
}

function cal_quantity() {
	var price = [];
	var low_raw = [];
	var high_raw =[];
	var low_po = [];
	var high_po = [];
	var id_r = [];	
	var data = [];
	
	 //create price
	for (var i=1; i<= id_list_mat; i++) {
		if ($('#price'+i).val() == '')
			price[i-1] = 0;
		else
			price[i-1] = parseFloat($('#price'+i).val());
	}
	
	//create low_raw
	for (var i=1; i<= id_list_mat; i++){
		if ($('#low_raw'+i).val() == '')
			low_raw[i-1] = 0;
		else
			low_raw[i-1] = parseFloat($('#low_raw'+i).val());
	}
	//create high_raw
	for (var i=1; i<= id_list_mat; i++){
		if ($('#high_raw'+i).val() == '')
			high_raw[i-1] = 0;
		else
			high_raw[i-1] = parseFloat($('#high_raw'+i).val());

	}
	
	
	//create low_po
	for (var i=1; i<= id_list_mat; i++){
		if ($('#low_po'+i).val() == '')
			low_po[i-1] = 0;
		else
			low_po[i-1] = parseFloat($('#low_po'+i).val());
	}
	
	//create high_po
	for (var i=0; i<12; i++){
		if ($('#high_po'+i).val() == '')
			high_po[i] = 0;
		else
			high_po[i] = parseFloat($('#high_po'+i).val());
	} 
	//create id_r
	for (var i=1; i<= id_list_mat; i++){
		if (mat_arr_each[1][2].id == '')
			id_r[i-1] = 0;
		else
			id_r[i-1] = mat_arr_each[i][2].id;
	} 
	
	//console.log(mat_arr_each[1][2].id);
	
	// make dm, protein, ... , vitE into data
	for (var i=1; i<=id_list_mat; i++) {
		data[i] = [];
		for (var j=0; j<12; j++) {
			// dm
			if (j == 0) data[i][j] = -(mat_arr_each[i][2].dm/100);
			// protein
			if (j == 1) data[i][j] = -(mat_arr_each[i][2].protein/100);
			// tdn
			if (j == 2) data[i][j] = -(mat_arr_each[i][2].tdn/100);
			// ndf
			if (j == 3) data[i][j] = -(mat_arr_each[i][2].ndf/100);
			// adf
			if (j == 4) data[i][j] = -(mat_arr_each[i][2].adf/100);
			// ca
			if (j == 5) data[i][j] = -(mat_arr_each[i][2].ca/100);
			// p
			if (j == 6) data[i][j] = -(mat_arr_each[i][2].p/100);
			// nfc
			if (j == 7) data[i][j] = -(mat_arr_each[i][2].nfc/100);
			// uip
			if (j == 8) data[i][j] = -(mat_arr_each[i][2].uip/100);
			// dip
			if (j == 9) data[i][j] = -(mat_arr_each[i][2].dip/100);
			// vitA
			if (j == 10) data[i][j] = -(mat_arr_each[i][2].vitA/100);
			// vitE
			if (j == 11) data[i][j] = -(mat_arr_each[i][2].vitE/100);
		}
	}
	
	
	var arr_sum = [[]];
	var k = 0;
	
	// make all data in arr_sum
	for (var i=1; i<=id_list_mat; i++) {
		arr_sum[i-1] = [];
		for (var j=0; j<12; j++) {
			arr_sum[i-1][j]=data[i][j];	
		}
	}
	
	/* // -1 in arr_sum : how manay data?
	 arr_sum[id_list_mat] = [];
	for (var i=0; i<id_list_mat; i++) {
		arr_sum[id_list_mat][i]=-1.0;
	// }  */
	
	
	return [price, arr_sum, price.length-1, id_r, high_po, low_raw, high_raw];
	
}	


function cal_Nutrition() {
	var price, dm, protein, tdn, ndf, adf, ca, p, nfc, uip, dip, vitA, vitE  = [];
	var solve, solve_sum = [];
	
	var MsgError="";
	var result=[];
	var solve_sumvalue = 0;
	//var price01 = $('#price03').val();
		//console.log("price01 : ",price01);
	for (var i=1; i<= id_list_mat; i++) {
	    c[i] = $('#price'+i)
	   
	}
	for (var i=0; i<=12; i++) {
		// dm
			dm[i] = (mat_arr_each[i][2].dm);
		// protein
			protein[i] = (mat_arr_each[i][2].protein);
		// tdn
			tdn[i] = (mat_arr_each[i][2].tdn);
		// ndf
			ndf[i] = (mat_arr_each[i][2].ndf);
		// adf
			adf[i] = (mat_arr_each[i][2].adf);
		// ca
			ca[i] = (mat_arr_each[i][2].ca);
		// p
			p[i] = (mat_arr_each[i][2].p);
		// nfc
			nfc[i] = (mat_arr_each[i][2].nfc);
		// uip
			uip[i] = (mat_arr_each[i][2].uip);
		// dip
			dip[i] = (mat_arr_each[i][2].dip);
		// vitA
			vitA[i] = (mat_arr_each[i][2].vitA);
		// vitE
			vitE[i] = (mat_arr_each[i][2].vitE);
	}
	
	// sum po & solve
	for (var i=0; i< 12; i++) {
		var sum = 0;
		for (var j=1; j<=id_list_mat; j++){
			solve[j] = $('#solve'+j).val();
			if (i == 0) sum += (solve[j]*dm[j]);
			if (i == 1) sum += (solve[j]*protein[j]);
			if (i == 2) sum += (solve[j]*tdn[j]);
			if (i == 3) sum += (solve[j]*ndf[j]);
			if (i == 4) sum += (solve[j]*adf[j]);
			if (i == 5) sum += (solve[j]*ca[j]);
			if (i == 6) sum += (solve[j]*p[j]);
			if (i == 7) sum += (solve[j]*nfc[j]);
			if (i == 8) sum += (solve[j]*uip[j]);
			if (i == 9) sum += (solve[j]*dip[j]);
			if (i == 10) sum += (solve[j]*vitA[j]);
			if (i == 11) sum += (solve[j]*vitE[j]);
		}
		
	sovle_sum[i] = sum;
	solve_sumvalue += sovle_sum[i]*1;
		
//	console.log(solve_sumvalue);
		
	/* //ราคาเฉลี่ยวัตถุดิ	
	for (var j=1; j<=id_list_mat; j++){
		price_cal[j] = (raw_optimize[i]*price[j])/100;
	}
	sum_price_cal += price_cals[i] ;	 */
		//console.log(sum_price_cal);
	
	
	}
}

/* function list_cal() {
	
	
	
	$('#cen5').html("<a href='Set_tmr?weight="+weight+"&wpD="+addweight+"&dm="+d111+"&tdn="+d222+"&nel="+""+"&ndf="+d334+"&adf="+d335+"&protein="+d444+"&uip="+d555+"&dip="+d666+"&ca="+d777+"&p="+d888+"&vitA="+d999+"&nfc="+d1010+"&age="+age+"&pregnant="+pregnant+"&lactation="+lactation+"&lactationPerDays="+lactationperdays+"
			&fatMilk="+fatmilk+"&unitBond="+t2+"&typeEating="+Type_eating+"&strain="+Strain+"&unitEnergy="+Unit_energy+"&priceMilk="+price+"&stageWalk="+stage_walk+"&id="+1+"&vitE="+0+"'>นำไปจัดสัดส่วนอาหารTMR</a>");
} */

$(document).on('click','#calraw_sum',function(e){
	var pri = [];	
	mg_ch_sum ="";
	mg_ch_lb = "";
	mg_ch_ub = "";
	mg_ch_sum += "กรุณาตรวจสอบน้ำหนัก";
	mg_ch_lb += "กรุณาตรวจสอบน้ำหนักต่ำสุดเกินกว่าที่กำหนด";
	mg_ch_ub += "กรุณาตรวจสอบน้ำหนักต่ำสูงสุดเกินกว่าที่กำหนด"
	for (var i=1; i<= id_list_mat; i++){
		if (low_raw[i-1]>high_raw[i-1]){
			swal("ผิดพลาด",mg_ch, "error");
		}if(low_raw[i-1]==101||low_raw[i-1]<0){
			swal("ผิดพลาด",mg_ch_lb, "error");
		}if(high_raw[i-1]==101||high_raw[i-1]<0){
			swal("ผิดพลาด",mg_ch_ub, "error");
		}

	}
	
	
	
	/* for (var i=1; i<= id_list_mat; i++) {
	    pri[i] = $('#price0'+i)
	    console.log("pri : ",pri[i]);
	} */
	
	
});
 

$(document).on('click','#addcalformula',function(e){ //id of button
	var sol1 = $('#total1').val(); 
	var MsgError=""; 
	MsgError+="กรุณาทำการรวมค่าทางโภชนะก่อน";
	if(sol1==""){
		
		swal("คำนวณไม่สำเร็จ",MsgError, "error");
	}else{
		console.log("savecal : ",$("#rawmaterialprice").serialize());
		$.ajax({
		url:"savecal", //send to controller
		method:"POST",
		cache : false,
		data:$("#rawmaterialprice").serialize(), //idform
		success:function (callb) {
			console.log(callb);
		}
	}).fail(function() {
		 swal("สำเร็จ", "บันทึกสำเร็จ", "success");
	}); 
	
	e.preventDefault(); 
	}
});
 
		</script>



</body>
</html>