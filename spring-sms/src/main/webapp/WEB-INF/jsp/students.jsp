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
		  <h2>បញ្ជីសិស្ស</h2>
		  <p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបង្កើត កែប្រែ និងលុបនូវព៌តមានរបស់សិស្ស</i></p>   
		  <div class="row">
		  	<div class="col-sm-12">
		  		<button type="button" class="btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</button>
		  		<br/><br/>
		  	</div>
		  </div>         
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
		        <th>កែប្រែ</th>
		        <th>លុប</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="student" items="${students}">
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
			       	<td><a href="updateTeacher1?id=${student.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
			       	<td><a href="delete?id=${student.id}"><i class="fa fa-trash-o" style="color:red"></i></a></td>
			      </tr>
		      	</c:forEach>
		    </tbody>
		  </table>
	</c:when>
	<c:when test="${mode == 'MODIFY'}">
		<h2>កែប្រែព៌តមានគ្រូបង្រៀន</h2>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<a class="btn btn-success" href="students"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="">
			<input type="hidden" value="${student.id}" name="id" id="id">
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${student.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="gender">ភេទ </label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="gender" id="gender">
				        <option value="false" ${student.gender? "" : "selected" }>ស្រី</option>
				        <option value="true" ${student.gender? "selected" : "" }>ប្រុស</option>
				      </select>
			      </div>
			  </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃខែឆ្នាំកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${student.dob}" name="dob" id="dob">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="pob">ទីកន្លែងកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control form-control-sm" value="${student.pob}" name="pob" id="pob">
			    </div>
			  </div>
			  <div class="form-group row">
				  <label class="col-form-label col-form-label-sm col-sm-2" for="address">អសយដ្ឋានបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="address" id="address">${student.address}</textarea>
				  </div>
				  <label class="col-form-label col-form-label-sm col-sm-2" for="caddress">អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="caddress" id="caddress">${student.caddress}</textarea>
				  </div>
				</div>
				<div class="form-group row">
			      <label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">ស្ថានភាពគ្រួសារ</label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="fstatus" id="fstatus">
				        <option value="false" ${student.fstatus? "" : "selected" }>នៅលីវ</option>
				        <option value="true" ${student.fstatus? "selected" : "" }>មានគ្រួសារ</option>
				      </select>
			      </div>
			      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">លេខទូរសព្ទ</label>
				    <div class="col-sm-4">
				    	<input type="text" class="form-control form-control-sm" value="${student.phone}" name="phone" id="phone">
				    </div>
		      </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="email">អ៊ីម៉ែល</label>
			    <div class="col-sm-4">
			    	<input type="email" class="form-control form-control-sm" value="${student.email}" name="email" id="email">
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
