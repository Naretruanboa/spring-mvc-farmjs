<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/includes.jsp"%>
<%
int a = (int)request.getAttribute("page");
	a=(a-1)*10;
int i=1+a; 

%>
<%-- <fmt:parseDate value="${list.day}" pattern="yyyy-MM-dd" var="Day" /> --%>
								<c:forEach items="${ped}" var="cattle">
								
									<tr>
										<td><%=i++ %></td>
										<td>${cattle.pedigreeNo}</td>
										<td>${cattle.cowNo }</td>
										<td>${cattle.herdNo }</td>										
										<td>${cattle.sex.value }</td>
										<td>${cattle.owner }</td>
										<td>									
											<form:form action="pedigree_edit?id=${cattle.id }" method="POST" >
												<button type="submit" class="btn btn-success">
												<i class="fa fa-search-plus"></i>
												</button>
											</form:form>
										</td>
										<td>
											<form:form action="ReportPedigree?id=${cattle.id }" method="POST" >
												<button type="submit" class="btn btn-success btn-lg" formtarget="_blank">
												<i class="fa fa-print fa-lg" ></i>
												</button>
											</form:form>
										</td>
										
									</tr>
								
						
								</c:forEach>

<input type="hidden" id="countPage" value="${count}"/>
<input type="hidden" id="Page" value="${page}"/>