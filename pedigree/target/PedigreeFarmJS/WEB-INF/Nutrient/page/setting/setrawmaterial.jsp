<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@ include file="/WEB-INF/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>ข้อมูลวัตถุดิบ</title>

</head>

<body>

	<jsp:include page="../menu.jsp"/>
<%int i =1; %>
		<div class="container" style="color: black;">
		 <hr>
		<div class=" row form-group">
				<div class="form-inline">
					<div class="col-md-3">
						<div class="jumbotron" style="background-color: rgb(218, 68, 83)"
							align="center">
							<p style="font-size: 28px; font-weight: 700; color: white;">ข้อมูลวัตถุดิบ</p>
						</div>
					</div>
					<div class="col-md-9" align="right">
						<div class="input-group form-search">

						<span class="input-group-btn search-query"> <select class="form-control  search-query btn-info" id="selectValue" style="width: 150px;color: white;">								
								<!-- <option value="0">ทั้งหมด</option> -->
								<option value="1">ชื่อวัตถุดิบ</option>							
								<option value="2">ประเภท</option>
						</select> 
						<input id="search" class="form-control search-query " oninput="search()"
							style="margin-left: -2px; margin-right: -1px;">

							<button 
								class="btn btn-info search-query glyphicon glyphicon-search"
								style="padding: 5px 10px 5px 10px;"></button>
						</span>
					</div>
					</div>
				</div>
			</div>
		<hr>
<div class="panel panel-primary">
		<div class="panel-heading">
	        <h4 class="panel-title" style="font-size: 25px;">ข้อมูลวัตถุดิบ</h4>
	   	</div>
		<div class="panel-body">
		<div>
		<a href="add_rawN"><button type="button" class="btn btn-success">ลงทะเบียนวัตถุดิบ</button></a>
		</div><br>
		  	<table class="table table-striped table-hover  table-bordered">
				<thead >
					<tr>
						<th><center>ลำดับที่</center></th>
				    	<th><center>ชื่อ</center></th>
				    	<th><center>ประเภท</center></th>
				         <th><center>สถานที่</center></th>
				        <th><center>แก้ไข</center></th>
				        <th><center>ลบ</center></th> 
				      </tr>
				      
				      
				    </thead>
				  <tbody style="text-align: center;" id="list">
				  
				</tbody>
				
			</table>
			<div class="row form-group" id="page" align="center"></div>
		</div>
	</div>
</div>
 <!-- end container -->

<jsp:include page="../footer.jsp" />
	
<script>

function chkdel(str){ //alert(str);
	swal({  title: "ยืนยันการลบข้อมูล!",   
			text: "คุณต้องการลบใช่หรือไม่?",   
			type: "warning",   
			showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "ต้องการ",   
			cancelButtonText: "ไม่ต้องการ",   
			closeOnConfirm: false,   closeOnCancel: false 
			}, function(isConfirm){   
				if (isConfirm) {     
					$.ajax({
						url:'del_rawN',
						type:'POST',
						data:{
							id:str,
						},success : function (result){
					swal({title:"สำเร็จ", 
							text:"ลบเรียบร้อยแล้ว!", 
							type:"success",
							timer: 2000,   
							showConfirmButton: false
						},function(isClose){ 
							window.location.reload();
						}
						);   
						}
					,error: function(result){
						swal("ผิดพลาด", "ไม่สามารถลบได้!", "error");
					}
					
				});
					} 
				else {     swal({
						title:"ยกเลิก", 
						text:"ยกเลิกการลบเรียบร้อยแล้ว!", 
						type:"error",
						timer: 2000,   
						showConfirmButton: false
				});} 
			});
	}
	
	
	
	
$("#list").load('search_raw',{ id : 0 ,value : 0},function(){
	$("#page").load('page',{ pagePresent : $("#Page").val(), pageLast  : $("#countPage").val()},function(m){
		for(i=0 ;i<=8;i++){
			if($("[id=pageNum]").eq(i).val()==$("#Page").val()){
				$("[id=pageNum]").eq(i).addClass("active");
			}
		}
	});
});

function search(){ //ตอนกดปุ่ม search จะส่ง  selectValue กับค่าที่กรอก search
	$("#list").load('search_raw',{ id : $("#selectValue").val(), value : $("#search").val()},function(){
		$("#page").load('page',{ pagePresent : $("#Page").val(), pageLast : $("#countPage").val()},function(m){
			for(i=0 ;i<=8;i++){
				if($("[id=pageNum]").eq(i).val()==$("#Page").val()){
					$("[id=pageNum]").eq(i).addClass("active");
				}
			}
		});
	});
}
$(document).on('click','#pageNum',function(e){
	 var id =  $('[id=pageNum]').index(e.target);
	 $("#list").load('search_raw',{ id : $("#selectValue").val(), value : $("#search").val(),page:$("[id=pageNum]").eq(id).val()},function(){
			$("#page").load('page',{ pagePresent : $("#Page").val(), pageLast : $("#countPage").val()},function(m){
				for(i=0 ;i<=8;i++){
					if($("[id=pageNum]").eq(i).val()==$("#Page").val()){
						$("[id=pageNum]").eq(i).addClass("active");
					}
				}
			});
			
		}); 
});

		</script>
</body>
</html>