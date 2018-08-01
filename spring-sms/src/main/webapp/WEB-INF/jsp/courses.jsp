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
			        <td>${course.status == 0? "វគ្គថ្មី" : course.status == 1? "បើកទទួលពាក្យ" : course.status ==2 ? "កំពុងសិក្សា" : "បានបញ្ចប់"}</td>
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
	<c:when test="${mode == 'MODIFY' || mode == 'NEW' || mode == 'SCHEDULE'}">
		<c:choose>
			<c:when test="${mode == 'MODIFY'}">
				<h2>កែប្រែព៌តមានវគ្គបណ្តុះបណ្តាល</h2>
			</c:when>
			<c:when test="${mode == 'NEW'}">
				<h2>បង្កើតវគ្គបណ្តុះបណ្តាលថ្មី</h2>
			</c:when>
			<c:when test="${mode == 'SCHEDULE'}">
				<h2>កាលវិភាគរបស់វគ្គបណ្តុះបណ្តាល</h2>
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
				<c:when test="${mode == 'MODIFY' || mode == 'SCHEDULE'}">
					<input class="clsCourseId" type="hidden" value="${course.id}" name="id" id="id">
				</c:when>
			</c:choose>
			<div class="form-group row ${mode == 'SCHEDULE'? 'd-none' : ''}">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${course.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">រយៈពេល (*)</label>
			    <div class="col-sm-4">
			    	<input type="number" required class="form-control form-control-sm" value="${course.duration}" name="duration" id="duration">
			    </div>
			  </div>
			  <div class="form-group row ${mode == 'SCHEDULE'? 'd-none' : ''}">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃចាប់ផ្តើម </label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${course.startDate}" name="startDate" id="startDate">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃបញ្ចប់</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${course.endDate}" name="endDate" id="endDate">
			    </div>
			  </div>
			  <c:choose>
				<c:when test="${mode == 'MODIFY' || mode == 'SCHEDULE'}">
				  <div class="form-group row ${mode == 'SCHEDULE'? 'd-none' : ''}">
				  	<label class="col-form-label col-form-label-sm col-sm-2" for="status">ស្ថានភាព </label>
				  	<div class="col-sm-4">
				      	<select class="form-control form-control-sm" name="status" id="status">
				      		<option value="0" ${course.status == 0? "selected" : "" }>វគ្គថ្មី</option>
					        <option value="1" ${course.status == 1? "selected" : "" }>បើកទទួលពាក្យ</option>
					        <option value="2" ${course.status == 2? "selected" : "" }>កំពុងសិក្សា</option>
					        <option value="3" ${course.status == 3? "selected" : "" }>បានបញ្ចប់</option>
					    </select>
				     </div>
				  </div>
				  </c:when>
			  </c:choose>
			  <c:choose>
				<c:when test="${mode == 'MODIFY' || mode == 'SCHEDULE'}">
			  <div class="form-group row ${mode == 'MODIFY'? 'd-none' : ''}">
			  	<div class="col-sm-12">
			  		<div class="row">
			  			<input type="hidden" class="clsEditId" name="editId" value="">
			  			<label class="col-form-label col-form-label-sm col-sm-2" for="selectsubject">មុខវិជ្ជាសិក្សា</label>
			  			<select class="form-control form-control-sm col-sm-4" name="selectsubject">
			  				<option></option>
			  				<c:forEach var="indSubject" items="${subjectList}">
			  					<option
			  					value="${ indSubject.id }" 
			  					abbr="${ indSubject.abbr }" 
			  					subjectName="${ indSubject.name }">
			  						${ indSubject.name }
			  					</option>
			  				</c:forEach>
			  			</select>
			  			<label class="col-form-label col-form-label-sm col-sm-2" for="selectteacher">គ្រូបង្រៀន</label>
			  			<select class="form-control form-control-sm col-sm-4" name="selectteacher">
			  			</select>
			  		</div>
			  		<br>
			  		<div class="row">
			  			<label class="col-form-label col-form-label-sm col-sm-2" for="dayofweek">ថ្ងៃប្រចាំសប្តាហ៍</label>
				      	<select class="form-control form-control-sm col-sm-4" name="dayofweek" id="dayofweek">
					      	<option value="1">ច័ន្ទ</option>
						    <option value="2">អង្គារ</option>
						    <option value="3">ពុធ</option>
						    <option value="4">ព្រហស្បតិ៍</option>
						    <option value="5">សុក្រ</option>
						    <option value="6">សៅរ៍</option>
						    <option value="7">អាទិត្យ</option>
					    </select>
					    <label class="col-form-label col-form-label-sm col-sm-2" for="studytime">ចំនួនម៉ោងសិក្សា (H)</label>
					    <input type="number" class="col-sm-4 form-control form-control-sm" value="" name="studytime" id="studytime">
			  		</div>
			  		<br>
			  		<div class="row">
			  			<label class="col-form-label col-form-label-sm col-sm-2" for="starttime">ចាប់ពីម៉ោង</label>
			  			<input type="text" class="form-control form-control-sm col-sm-4" value="" name="starttime" id="starttime">
			  			<label class="col-form-label col-form-label-sm col-sm-2" for="endtime">ដល់ម៉ោង</label>
			  			<input type="text" class="form-control form-control-sm col-sm-4" value="" name="endtime" id="endtime">
			  		</div>
			  		<div class="row">
			  			<div class="col-sm-12">
			  				<br>
			  				<a class="btnAddCourseSubject btn btn-success"><i class="fa fa-plus"></i> បញ្ចូលទៅក្នុងតារាង</a>
			  			</div>			  			
			  		</div>
			  		<br>
			  		<table class="table table-bordered table-sm tbCoursesList">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">អក្សរកាត់</th>
						      <th scope="col">មុខវិជ្ជា</th>
						      <th scope="col">គ្រូបង្រៀន</th>
						      <th scope="col">ថ្ងៃប្រចាំសប្តាហ៍</th>
						      <th scope="col">ចំនួនម៉ោងសិក្សា</th>
						      <th scope="col">ចាប់ពីម៉ោង</th>
						      <th scope="col">ដល់ម៉ោង</th>
						      <th scope="col">កែប្រែ</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="t" items="${course.courseSubjects}" varStatus="element">
						    <tr>	
						      <input type="hidden" name="courseSubjects[${element.index}].id" value="${t.id}">
						      <input type="hidden" name="courseSubjects[${element.index}].course.id" value="${course.id}">
						      <input type="hidden" name="courseSubjects[${element.index}].subject.id" value="${t.subject.id}">
						      <input type="hidden" name="courseSubjects[${element.index}].teacher.id" value="${t.teacher.id}">
						      <input type="hidden" name="courseSubjects[${element.index}].dayOfWeek" value="${t.dayOfWeek}">
						      <input type="hidden" name="courseSubjects[${element.index}].studyTime" value="${t.studyTime}">
						      <input type="hidden" name="courseSubjects[${element.index}].startTime" value="${t.startTime}">
						      <input type="hidden" name="courseSubjects[${element.index}].endTime" value="${t.endTime}">
						       
						      <th scope="row">${element.count}</th>
						      <td>${t.subject.abbr}</td>
						      <td>${t.subject.name}</td>
						      <td>${t.teacher.name}</td>
						      <td>
						      ${ t.dayOfWeek == 1 ? 'ច័ន្ទ' :
						      	 t.dayOfWeek == 2 ? 'អង្គារ':
						      	 t.dayOfWeek == 3 ? 'ពុធ':
						      	 t.dayOfWeek == 4 ? 'ព្រហស្បតិ៍':
						      	 t.dayOfWeek == 5 ? 'សុក្រ':
						      	 t.dayOfWeek == 6 ? 'សៅរ៍':'អាទិត្យ'
						      }
						      </td>
						      <td>${t.studyTime}H</td>
						      <td>${t.startTime}</td>
						      <td>${t.endTime}</td>
						      <td><a href="#" class="cmdEditRowCourseSubject"><i class="fa fa-pencil" style="color:green"></i></a></td>
						      <td><a href="#" class="cmdDeleteRowCourseSubject"><i class="fa fa-trash-o" style="color:red"></i></a></td>
						      
						    </tr>
						    </c:forEach>
						  </tbody>
						</table>
			  	</div>
			  </div>
			  </c:when>
			  </c:choose>
			  <div class="form-group row">        
	      		<div class="offset-sm-2 col-sm-10">
	      			<button type="submit" class="btn btn-primary">រក្សាទុក</button>
	      		</div>
	    	</div>
		  </form>
	</c:when>
</c:choose>
</div>