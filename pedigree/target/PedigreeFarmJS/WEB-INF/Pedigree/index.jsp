<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes.jsp"%>
<html>
<head>
<link href="resources/css/animate.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ระบบการคำนวณหาค่่าความต้องการทางด้านโภชนะโคเนื้อและโคนม</title>
<!-- Bootstrap -->
	<style>
		body,html{
			background-image:url('resources/img/bgsummer.jpg');
			padding: 30px 0;
			text-align: center;
			color: white;
			height: auto;
			background-position:center;
			background-attachment: scroll;
			background-repeat: repeat;
			background-size: cover;
		}
	</style>
	
	<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 100%;}
    
    /* Set gray background color and 100% height  */
    .sidenav {
      background-color: #f1f1f1;
      height: 90%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style> 
  
  <script type="text/javascript">
function date_time1(id) {
    date = new Date;
    year = date.getFullYear();
    month = date.getMonth();
    months = new Array('มกราคม', 'กุมภาพันธ์', 'มีนาคม', 'เมษายน', 'พฤษภาคม', 'มิถุนายน', 'กรกฎาคม', 'สิงหาคม', 'กันยายน', 'ตุลาคม', 'พฤศจิกายน', 'ธันวาคม');
    d = date.getDate();
    day = date.getDay();
    days = new Array('อาทิตย์', 'จันทร์', 'อังคาร', 'พุธ', 'พฤหัสดี', 'ศุกร์', 'เสาร์');
    h = date.getHours();
    if (h < 10) {
        h = "0" + h;
    }
    m = date.getMinutes();
    if (m < 10) {
        m = "0" + m;
    }
    s = date.getSeconds();
    if (s < 10) {
        s = "0" + s;
    }
    result = 'วัน' + days[day] + 'ที่\t' + d + ' ' + months[month] + '\tพ.ศ.\t' + (year+543) + '\tเวลา '  + h + ':' + m + '\tน.';
    document.getElementById(id).innerHTML = result;
    setTimeout('date_time("' + id + '");', '1000');
    return true;
}
</script>

<style>

div.panell{
margin: 15px 0px 37px 0px;
}

.panel-footer{
  background:#ffc107;
  border-color: #cccccc; 
 }
 
 .button {
 box-shadow: 0 3px 0 #2F4F4F; 
 background-color: #FFFFFF; 
 border: none; 
 padding: 2px 5px; 
 border-radius: 5px; 
 float: right; 
 margin: 2;" 
 }
 
 .button:hover{
 background-color: #CCFFFF
 }

.button:active {
 
  box-shadow: 0 5px #2F4F4F;
  transform: translateY(4px);
}

</style>
 
</head>

<body OnLoad="JavaScript:date_time1('date_time1')">

<jsp:include page="page/menu.jsp"/>

<div class="container">	
<c:if test="${sessionScope.privilege != null}">	
	<div>	
		<div  align="left" >
	</div>
			<div class="panel-body" id="dash3">
				<div class="row">
					<div class="col-md-12" >
				    		<div class="panel" style="background-color:#c2c2a3">
				           <div class="panel-heading">
					           <div class="row">
					                <div class="col-xs-20 text-right">     
										<span id="date_time1" style="color: #ffffff; font-size: 28px;"></span>	
					                </div>
					            </div>
				           </div>
				           <div class="panell" style="background-color:#eeeeee ">
			                    <div class="panel-heading">
			                        <div class="row">
			                           <div class="col-xs-20 text-right ">
			                           <c:forEach items="${ulist}" var="m">
			                               <div class="huge" style="font-size: 22px; color: black; font-weight : bold ;" >&nbsp;ยินดีต้อนรับ&nbsp;${m.first} ${m.last}&nbsp;ระบบพันธุ์ประวัติ</div>
			                           </c:forEach>      	
			                           </div>
			                        </div>
			                    </div>
			        	      </div>
				       	</div>
				    	</div>
				    
				    	<div class="col-md-4">
			                    <div class="panel" style="background-color:#DC7633">
			                        <div class="panel-heading">
			                            <div class="row">
			                                <div class="col-xs-3">
			                                    <img src="resources/img/17.jpg" alt="logo" style="width:140px;height:120px;">
			                                </div>
			                                <div class="col-xs-9 text-right">
			                                    <div class="huge" style="font-size: 50px; color: white;" >&nbsp;${30}</div>
			                                    <div>จำนวนโคภายในฟาร์ม</div>
			                                </div>
			                            </div>
			                        </div>
			                        <a href="alert" >
			                            <div class="panel-footer "  >
			                                <span class="pull-left">แสดงรายละเอียด</span>
			                                <span class="pull-right"><i class="fa fa-file-text"></i></span>
			                                <div class="clearfix"></div>
			                            </div>
			                        </a>
			                    </div>
			                </div>
			                
			                <div class="col-md-4">
			                    <div class="panel" style="background-color:#E91E63">
			                        <div class="panel-heading">
			                            <div class="row">
			                                <div class="col-xs-3">
			                                    <img src="resources/img/logofama.png" alt="logo" style="width:150px;height:120px;">
			                                </div>
			                                <div class="col-xs-9 text-right">
			                                    <div class="huge" style="font-size: 50px; color: white;" >&nbsp;${5} / ${25}</div>
			                                    <div>พ่อพันธุ์ / แม่พันธุ์</div>
			                                </div>
			                            </div>
			                        </div>
			                        <a href="alert?id=3">
			                            <div class="panel-footer">
			                                <span class="pull-left">แสดงรายละเอียด</span>
			                                <span class="pull-right"><i class="fa fa-file-text"></i></span>
			                                <div class="clearfix"></div>
			                            </div>
			                        </a>
			                    </div>
			                </div>
			                
			                <div class="col-md-4">
		                    	   <div class="panel" style="background-color:#DAA520">
		                        <div class="panel-heading">
		                            <div class="row">
		                                <div class="col-xs-3">
		                                    <img src="resources/img/print.jpg" alt="logo" style="width:150px;height:120px;">
		                                </div>
		                                <div class="col-xs-9 text-right">
		                                    <div class="huge" style="font-size: 50px; color: white;" >&nbsp;${12}</div>
		                                    <div>การพิมพ์ใบพันธุ์ประวัติ</div>
		                                </div>
		                            </div>
		                        </div>
		                        <a href="alert?id=4">
		                            <div class="panel-footer ">
		                                <span class="pull-left">แสดงรายละเอียด</span>
		                                <span class="pull-right"><i class="fa fa-file-text"></i></span>
		                                <div class="clearfix"></div>
		                            </div>
		                        </a>
		                    </div>
		                </div>
				    	
				</div>
			</div>
			
		</div>
		
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 class="panel-title text-right" style="font-size: 28px">ข้อมูลโคในฟาร์ม</h4>
			</div>
					<% int i = 0; %>
		                <div class="panel-body">
		                <div class="table-responsive">
						       <div style="width:auto; height:200px; overflow:auto;">
						         <table class="table table-striped table-hover" cellspacing="0" cellpadding="0" border="0" width="auto" id="addtabel_po">
							        <thead>
										<tr>
											<th>ลำดับที่</th>
											<th>ข้อมูลโค</th>
											<th>พ่อโค</th>
											<th>แม่โค</th>
											<th>พันธุ์ประวัติโค</th>
										</tr>
									</thead>
						           <tbody>
						           	<c:forEach items="${ped}" var="cattle">		
										<tr>
											<td><%=i++ %></td>
											<td>${cattle.cowNo} &nbsp;${cattle.pedigreeNo} &nbsp;${cattle.sex.value}</td>
											<c:if test = "${cattle.fatherId == null}">
											<td>-</td>
											</c:if>
											<c:if test = "${cattle.motherId == null}">
											<td>-</td>
											</c:if>
											<c:if test= "${cattle.motherId != null && cattle.fatherId != null }">
											<td>${cattle.fatherId.cowNo} &nbsp;${cattle.fatherId.pedigreeNo} &nbsp;${cattle.sex.value}</td>
											<td>${cattle.motherId.cowNo} &nbsp;${cattle.motherId.pedigreeNo} &nbsp;${cattle.sex.value}</td>
											</c:if>
											
											<td>									
												<form:form action="pedigree_edit?id=${cattle.id }" method="POST" >
													<button type="submit" class="btn btn-success">
													<i class="fa fa-search-plus"></i>
													</button>
												</form:form>
											</td>
										</tr>
									</c:forEach>
								  </tbody>
						         </table>  
						       </div>
						 
						</div>
					</div>
				</div>
	</c:if>
</div>

<jsp:include page="page/footer.jsp"/>

</body>

<script>

$(document).ready(function(){
	$("#dash3").show();
});
</script>

</html>