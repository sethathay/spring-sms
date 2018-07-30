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
		 <h2>បញ្ជីវគ្គបណ្តុះបណ្តាល</h2>
		 <p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបង្កើត កែប្រែ និងលុបនូវព៌តមានរបស់វគ្គបណ្តុះបណ្តាល</i></p>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<a href="/newcourse" class="btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</a>
		  		<br/><br/>
		  	</div>
		  </div>
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>ល.រ</th>
		        <th>ឈ្មោះ</th>
		        <th>រយៈពេល</th>
		        <th>ថ្ងៃចាប់ផ្តើម</th>
		        <th>ថ្ងៃបញ្ចប់</th>
		        <th>ស្ថានភាព</th>
		        <th>មុខវិជ្ជា / គ្រូបង្រៀន</th>
		        <th>កាលវិភាគ</th>
		        <th>កែប្រែ</th>
		        <th>លុប</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="course" items="${courses}">
			      <tr>
			        <td id="IDCourse">${course.id}</td>
			        <td>${course.name}</td>
			        <td>${course.duration}</td>
			        <td>${course.startDate}</td>
			        <td>${course.endDate}</td>
			        <td>${course.status == 1? "បើកទទួលពាក្យ" : course.status ==2 ? "កំពុងសិក្សា" : "បានបញ្ចប់"}</td>
			        <td>
			        	<c:forEach var="obj" items="${course.courseSubjects}">
			        		<span class="badge badge-pill badge-secondary">${obj.subject.name} / ${obj.teacher.name}</span> <br>
			        	</c:forEach>
			        </td>
			       	<td><a href="schedulecourse?id=${course.id}"><i class="fa fa-calendar" style="color:blue"></i></a></td>
			       	<td><a href="updatecourse?id=${course.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
			       	<td><a data-toggle="modal" href="#myModal${course.id}"><i class="fa fa-trash-o" style="color:red"></i></a>
			       		<!-- The Modal -->
						  <div class="modal fade" id="myModal${course.id}">
						    <div class="modal-dialog modal-sm">
						      <div class="modal-content">
						      
						        <!-- Modal Header -->
						        <div class="modal-header">
						          <h4 class="modal-title">បញ្ជាក់</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						        
						        <!-- Modal body -->
						        <div class="modal-body">
						          តើអ្នកពិតជាចង់លុបទិន្នន័យ ${course.id} នេះមែនទេ?
						        </div>
						        
						        <!-- Modal footer -->
						        <div class="modal-footer">
						          <a href="deletecourse?id=${course.id}"><button type="button" class="btn btn-primary" data-dismiss="model">យល់ព្រម</button></a>
						        </div>
						        
						      </div>
						    </div>
						  </div>
						<!-- End Model -->
			       	</td>
			      </tr>
		      	</c:forEach>
		    </tbody>
		  </table>  
	</c:when>
	<c:when test="${mode == 'MODIFY' || mode == 'NEW'}">
		<c:choose>
			<c:when test="${mode == 'MODIFY'}">
				<h2>កែប្រែព៌តមានវគ្គបណ្តុះបណ្តាល</h2>
			</c:when>
			<c:when test="${mode == 'NEW'}">
				<h2>បង្កើតវគ្គបណ្តុះបណ្តាលថ្មី</h2>
			</c:when>
		</c:choose>
		<div class="row">
		  	<div class="col-sm-12">
		  		<br/>
		  		<a class="btn btn-success" href="courses"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
		  		<br/><br/>
		  	</div>
		  </div>
		  <form method="POST" action="savecourse">
		  <c:choose>
				<c:when test="${mode == 'MODIFY'}">
					<input type="hidden" value="${course.id}" name="id" id="id">
				</c:when>
			</c:choose>
			<div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${course.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">រយៈពេល (*)</label>
			    <div class="col-sm-4">
			    	<input type="number" required class="form-control form-control-sm" value="${course.duration}" name="duration" id="duration">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃចាប់ផ្តើម </label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${course.startDate}" name="startDate" id="startDate">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃបញ្ចប់</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${course.endDate}" name="endDate" id="endDate">
			    </div>
			  </div>
			  <div class="form-group row">
			  	<div class="offset-sm-2 col-sm-10">
			  		<div class="row">
			  			<label class="col-form-label col-form-label-sm col-sm-4" for="selectsubject">សូមជ្រើសរើសគ្រូដែលអាចបង្រៀនមុខវិជ្ជានេះ</label>
			  			<select class="form-control form-control-sm col-sm-4" name="selectsubject">
			  			</select>
			  			&nbsp;
						<a class="btnAddSubject btn btn-success"><i class="fa fa-plus"></i></a>
			  		</div>
			  		<br>
			  		<table class="table table-bordered table-sm tbCoursesList">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">អក្សរកាត់</th>
						      <th scope="col">មុខវិជ្ជា</th>
						      <th scope="col">គ្រូបង្រៀន</th>
						      <th scope="col">លេខទូរសព្ទ</th>
						      <th scope="col">អ៊ីម៉ែល</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="t" items="${course.courseSubjects}" varStatus="element">
						    <tr>
						      <input type="hidden" name="courseSubjects[${element.index}].course" value="${t}">
						      <input type="hidden" name="courseSubjects[${element.index}].subject" value="${t.subject}">
						      <input type="hidden" name="courseSubjects[${element.index}].teacher" value="${t.teacher}">
						      <th scope="row">${element.count}</th>
						      <td>${t.subject.abbr}</td>
						      <td>${t.subject.name}</td>
						      <td>${t.teacher.name}</td>
						      <td>${t.teacher.phone}</td>
						      <td>${t.teacher.email}</td>
						      <td><a href="#" class="cmdDeleteRowCourseSubject"><i class="fa fa-trash-o" style="color:red"></i></a></td>
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