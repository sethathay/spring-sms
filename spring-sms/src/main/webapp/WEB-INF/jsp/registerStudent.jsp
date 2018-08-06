<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <%@ include file="header.jsp" %>
</head>
<body>

<%@ include file="navigation.jsp" %>

<div class="container">
<c:choose>
	<c:when test="${mode == 'NEW'}">
	<form method="POST" action="/savesRegister">	
		<h2>ចុះឈ្មោះចូលរៀន</h2>
		  <br/><br/>		  
				<div class="form-group row">
					<div class="col-sm-10">
						<div class="row">					
							<label class="col-form-label col-form-label-sm col-sm-4" for="name">ឈ្មោះសិស្ស (*)</label>
							<select class="selectStu form-control form-control-sm col-sm-4" name="selectstudent">
								<c:forEach var="indStudent" items="${studentList}">
									<option value="${ indStudent.id }" 
									name="${ indStudent.name }"
									gender = "${indStudent.gender}" 
									dob="${indStudent.dob}"
									pob="${indStudent.pob}"
									address="${indStudent.address}"
									fstatus="${indStudent.fstatus}"
									phone = "${ indStudent.phone }"
									caddress = "${ indStudent.caddress}" 
									email = "${ indStudent.email }" 
									>${ indStudent.name }</option>								
								</c:forEach>
							</select>
							&nbsp;
							<span class="col-sm-2" style="padding:0px 0px !important"><a href="/newstudent" class="form-control-sm btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</a></span>
						</div>
						</div>
					</div>
						<br/>
						<!-- <form>	 -->	  
							<input type="hidden" value="${studentList[0].id}" name="id" id="id">
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
								<div class="col-sm-4">
									<input type="text" required class="form-control form-control-sm" value="${studentList[0].name}" name="name" id="name" readonly="true">
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="gender">ភេទ </label>
								<div class="col-sm-4">
								    <select class="form-control form-control-sm" name="gender" id="gender" disabled="false">
										<option value="false" ${studentList[0].gender? "" : "selected" }>ស្រី</option>
									    <option value="true" ${studentList[0].gender? "selected" : "" }>ប្រុស</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃខែឆ្នាំកំណើត</label>
								<div class="col-sm-4">
								   <input type="date" class="form-control form-control-sm" value="${studentList[0].dob}" name="dob" id="dob" readonly="true">
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="pob">ទីកន្លែងកំណើត</label>
								<div class="col-sm-4">
								   <input type="text" class="form-control form-control-sm" value="${studentList[0].pob}" name="pob" id="pob" readonly="true">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="address">អសយដ្ឋានបច្ចុប្បន្ន</label>
								<div class="col-sm-4">
									<textarea class="form-control form-control-sm" rows="3" name="address" id="address" readonly="true">${studentList[0].address}</textarea>
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="caddress">អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</label>
								<div class="col-sm-4">
									<textarea class="form-control form-control-sm" rows="3" name="caddress" id="caddress" readonly="true">${studentList[0].caddress}</textarea>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">ស្ថានភាពគ្រួសារ</label>
								<div class="col-sm-4">
									<select class="form-control form-control-sm" name="fstatus" id="fstatus" disabled="false">
									    <option value="false" ${studentList[0].fstatus? "" : "selected" }>នៅលីវ</option>
									    <option value="true" ${studentList[0].fstatus? "selected" : "" }>មានគ្រួសារ</option>
									 </select>
								</div>
								      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">លេខទូរសព្ទ</label>
									    <div class="col-sm-4">
									    	<input type="text" class="form-control form-control-sm" value="${studentList[0].phone}" name="phone" id="phone" readonly="true">
									    </div>
							</div>
							<div class="form-group row">
								  <label class="col-form-label col-form-label-sm col-sm-2" for="email">អ៊ីម៉ែល</label>
								<div class="col-sm-4">
								  <input type="email" class="form-control form-control-sm" value="${studentList[0].email}" name="email" id="email" readonly="true">
								</div>
							</div>
						<!-- </form> -->
						<br/>
					<div class="form-group row">
						<div class="col-sm-10">
						<div class="row">
							<label class="col-form-label col-form-label-sm col-sm-4" for="selectcourse">សូមជ្រើសរើសវគ្គបណ្តុះបណ្តាល(*)</label>
							<select class="form-control form-control-sm col-sm-4" name="selectcourse">
								<c:forEach var="indCourse" items="${courseList}">
									<option value="${ indCourse.id}" 
									name="${indCourse.name }"
									duration="${ indCourse.duration}"
									startDate="${ indCourse.startDate}"
									endDate="${ indCourse.endDate}"
									status="${ indCourse.status}"
									>${indCourse.name }</option>
								</c:forEach>
							</select>
							&nbsp;
						    <a class="btnAddCourse btn btn-success"><i class="fa fa-plus"></i></a>
						</div>
						<br>
						<table class="table table-bordered table-sm tblCoursesList">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">ឈ្មោះ</th>
						      <th scope="col">រយះពេល</th>
						      <th scope="col">ថ្ងៃចាប់ផ្តើម</th>
						      <th scope="col">ថ្ងៃបញ្ចប់</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<%-- <c:forEach var="t" items="${indStudent.index].stuCourse}" varStatus="element">
						    <tr>
								      <!-- Binding list of teachers for field you display -->
								      <input type="hidden" name="stuCourse[${element.index}].id" value="${t.id}">
								      <input type="hidden" name="stuCourse[${element.index}].course.id" value=7>
								      <input type="hidden" name="stuCourse[${element.index}].student.id" value="17">
								      <input type="hidden" name="stuCourse[${element.index}].regDate" value=new Date()>
								      
								      <th scope="row">${element.count}</th>
								      <td>${t.name}</td>
								      <td>${t.duration}</td>
								      <td>${t.startDate}</td>
								      <td>${t.endDate}</td>
								      <td><a href="#" class="cmdDeleteRowCourse"><i class="fa fa-trash-o" style="color:red"></i></a></td>
						    </tr>
						    </c:forEach> --%>
						  </tbody>
						</table>
					</div>
				</div>			  
			  <div class="form-group row">        
	      		<div class="col-sm-10">
	      			<button type="submit" class="btn btn-primary">រក្សាទុក</button>
	      		</div>
	    	</div>
			</form>
	</c:when>
</c:choose>
  
</div>

</body>
</html>
