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
	<c:when test="${mode == 'VIEW'}">
		  <h2>បញ្ជីមុខវិជ្ជា</h2>
		  <p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបង្កើត កែប្រែ និងលុបនូវព៌តមានរបស់មុខវិជ្ជា</i></p>   
		  <div class="row">
		  	<div class="col-sm-12">
		  		<a href="/newsubject" class="btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</a>
		  		<br/><br/>
		  	</div>
		  </div>         
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>ល.រ</th>
		        <th>អក្សរកាត់</th>
		        <th>ឈ្មោះ</th>
		        <th>បរិយាយផ្សេងៗ</th>
		        <th>គ្រូបង្រៀន</th>
		        <th>កែប្រែ</th>
		        <th>លុប</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="subject" items="${subjects}">
			      <tr>
			        <td>${subject.id}</td>
			        <td>${subject.abbr}</td>
			        <td>${subject.name}</td>
			        <td>${subject.description}</td>
			        <td>
			        <!--  Loop to show teacher who teach this subject -->
			        <c:forEach var="teacher" items="${subject.teachers}">
			        	<span class="badge badge-pill badge-secondary">${teacher.name}</span> &nbsp;
			        </c:forEach>
			        </td>
			       	<td><a href="updatesubject?id=${subject.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
			       	<td><a href="deletesubject?id=${subject.id}"><i class="fa fa-trash-o" style="color:red"></i></a></td>
			      </tr>
		      	</c:forEach>
		    </tbody>
		  </table>
	</c:when>
	<c:when test="${mode == 'MODIFY' || mode == 'NEW'}">
		<c:choose>
			<c:when test="${mode == 'MODIFY'}">
				<h2>កែប្រែព៌តមានមុខវិជ្ជា</h2>
			</c:when>
			<c:when test="${mode == 'NEW'}">
				<h2>បង្កើតមុខវិជ្ជាថ្មី</h2>
			</c:when>
		</c:choose>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<br/>
		  		<a class="btn btn-success" href="subjects"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="savesubject">
			<c:choose>
				<c:when test="${mode == 'MODIFY'}">
					<input type="hidden" value="${subject.id}" name="id" id="id">
				</c:when>
			</c:choose>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">អក្សរកាត់ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${subject.abbr}" name="abbr" id="abbr">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${subject.name}" name="name" id="name">
			    </div>
			  </div>
			  <div class="form-group row">
				  <label class="col-form-label col-form-label-sm col-sm-2" for="description">បរិយាយផ្សេងៗ</label>
				  <div class="col-sm-10">
				  	<textarea class="form-control form-control-sm" rows="3" name="description" id="description">${subject.description}</textarea>
				  </div>
				</div>
				<div class="form-group row">
					<div class="offset-sm-2 col-sm-10">
						<div class="row">
							<label class="col-form-label col-form-label-sm col-sm-4" for="description">សូមជ្រើសរើសគ្រូដែលអាចបង្រៀនមុខវិជ្ជានេះ</label>
							<select class="form-control form-control-sm col-sm-4" aria-describedby="passwordHelpBlock">
							</select>
							&nbsp;
						    <a href="#" class="btn btn-success"><i class="fa fa-plus"></i></a>
						</div>
						<br>
						<table class="table table-bordered table-sm">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">ឈ្មោះ</th>
						      <th scope="col">ភេទ</th>
						      <th scope="col">លេខទូរសព្ទ</th>
						      <th scope="col">អ៊ីម៉ែល</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="t" items="${subject.teachers}" varStatus="element">
						    <tr>
						      <!-- Binding list of teachers for field you display -->
						      <th scope="row"><input type="hidden" name="teachers[${element.index}].id" value="${t.id}">${element.count}</th>
						      <td><input type="hidden" name="teachers[${element.index}].name" value="${t.name}">${t.name}</td>
						      <td><input type="hidden" name="teachers[${element.index}].gender" value="${t.gender}">${t.gender? "ប្រុស" : "ស្រី" }</td>
						      <td><input type="hidden" name="teachers[${element.index}].phone" value="${t.phone}">${t.phone}</td>
						      <td><input type="hidden" name="teachers[${element.index}].email" value="${t.email}">${t.email}</td>
						      <!-- Binding list of teachers for field you didn't want to display -->
						      <input type="hidden" name="teachers[${element.index}].dob" value="${t.dob}">
						      <input type="hidden" name="teachers[${element.index}].pob" value="${t.pob}">
						      <input type="hidden" name="teachers[${element.index}].address" value="${t.address}">
						      <input type="hidden" name="teachers[${element.index}].caddress" value="${t.caddress}">
						      <input type="hidden" name="teachers[${element.index}].fstatus" value="${t.fstatus}">
						      <td><a href="#" class="cmdDeleteRowTeacher" onClick="$(this).closest('tr').remove();"><i class="fa fa-trash-o" style="color:red"></i></a></td>
						    </tr>
						    </c:forEach>
						  </tbody>
						</table>
					</div>
				</div>
			  <div class="form-group row">        
	      		<div class="offset-sm-2 col-sm-10">
	      			<button type="submit" class="btn btn-primary">រក្សាទុក</button>
	      		</div>
	    	</div>
			</form>
	</c:when>
</c:choose>
  
</div>

</body>
</html>
