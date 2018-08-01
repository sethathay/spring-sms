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
		<h2>ចុះឈ្មោះចូលរៀន</h2>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<a href="/newstudent" class="btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="saveregister">
				<div class="form-group row">
					<div class="col-sm-10">
						<div class="row">
							<label class="col-form-label col-form-label-sm col-sm-4" for="name">ឈ្មោះសិស្ស (*)</label>
							<select class="form-control form-control-sm col-sm-4" name="selectstudent">
								<c:forEach var="indStudent" items="${studentList}">
									<option value="${ indStudent.id }" 
									text="${ indStudent.name }"
									gender = "${indStudent.gender? "ប្រុស" : "ស្រី" }" 
									phone = "${ indStudent.phone }" 
									email = "${ indStudent.email }" 
									>${ indStudent.name }</option>								
								</c:forEach>
							</select>
						</div>
						</div>
						<br/>
						<div class="col-sm-12">
							<div class="row">
								<table class="table table-striped">
								    <thead>
								      <tr>
								        <th>ល.រ</th>
								        <th>ឈ្មោះ</th>
								        <th>ភេទ</th>
								        <th>ថ្ងៃខែឆ្នាំកំណើត</th>
								        <th>ទីកន្លែងកំណើត</th>
								        <th>អសយដ្ឋានបច្ចុប្បន្ន</th>
								        <th>ស្ថានភាពគ្រួសារ</th>
								        <th>អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</th>
								        <th>លេខទូរសព្ទ</th>
								        <th>អ៊ីម៉ែល</th>
								      </tr>
								    </thead>
								    <tbody>
								    	 <c:forEach var="student" items="${studentList}">
									      <tr>
									        <td>${student.id}</td>
									        <td>${student.name}</td>
									        <td>${student.gender? "ប្រុស": "ស្រី"}</td>
									        <td>${student.dob}</td>
									        <td>${student.pob}</td>
									        <td>${student.address}</td>
									        <td>${student.fstatus? "មានគ្រួសារ": "នៅលីវ"}</td>
									        <td>${student.caddress}</td>
									        <td>${student.phone}</td>
									        <td>${student.email}</td>
									      </tr>
								      	</c:forEach>
								    </tbody>
								  </table>
							</div>
						</div>
						<br/>
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
						  	<c:forEach var="t" items="${indStudent.courses}" varStatus="element">
						    <tr>
								      <!-- Binding list of teachers for field you display -->
								      <input type="hidden" name="courses[${element.index}].id" value="${t.id}">
								      <th scope="row">${element.count}</th>
								      <td>${t.name}</td>
								      <td>${t.duration}</td>
								      <td>${t.startDate}</td>
								      <td>${t.endDate}</td>
								      <td><a href="#" class="cmdDeleteRowCourse"><i class="fa fa-trash-o" style="color:red"></i></a></td>
						    </tr>
						    </c:forEach>
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
