<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "com.tax.springsms.models.TeacherAttendance" %>
<html>
<head>
  <%@ include file="header.jsp" %>
</head>
<body>

<%@ include file="navigation.jsp" %>

<div class="container">

	<c:choose>
		<c:when test="${mode == 'VIEW'}">
			<h2>ការរៀបចំកម្មវីធីប្រលងបញ្ចប់វគ្គ</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបញ្ចូល និងមើលកម្មវិធីការប្រលង</i></p>
		 	<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>ល.រ</th>
			        <th>ឈ្មោះ</th>
			        <th>រយៈពេល</th>
			        <th>ស្ថានភាព</th>
			        <th>មុខវិជ្ជា / គ្រូបង្រៀន / ថ្ងៃបង្រៀន</th>
			        <th>កម្មវិធីការប្រលង</th>
			        <th>រៀបចំការប្រលង</th>
			      </tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="course" items="${courses}">
				      <tr>
				        <td id="IDCourse">${course.id}</td>
				        <td>${course.name}</td>
				        <td>${course.duration}</td>
				        <td>${course.status == 0? "វគ្គថ្មី" : course.status == 1? "បើកទទួលពាក្យ" : course.status ==2 ? "កំពុងសិក្សា" : "បានបញ្ចប់"}</td>
				        <td>
				        	<c:forEach var="obj" items="${course.courseSubjects}">
				        		<span class="badge badge-pill badge-secondary">
				        		${obj.subject.name} / ${obj.teacher.name} / 
				        		${ obj.dayOfWeek == 1 ? 'ច័ន្ទ' :
						      	 obj.dayOfWeek == 2 ? 'អង្គារ':
						      	 obj.dayOfWeek == 3 ? 'ពុធ':
						      	 obj.dayOfWeek == 4 ? 'ព្រហស្បតិ៍':
						      	 obj.dayOfWeek == 5 ? 'សុក្រ':
						      	 obj.dayOfWeek == 6 ? 'សៅរ៍':'អាទិត្យ'
						      }
				        		</span> <br>
				        	</c:forEach>
				        </td>
				       	<td><a href="listexamprograms?id=${course.id}"><i class="fa fa-calendar" style="color:blue"></i></a></td>
				       	<td><a href="newexamprograms?id=${course.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
				       	</tr>
			       	</c:forEach>
			    </tbody>
		    </table>
		</c:when>
		<c:when test="${mode == 'NEW' || mode=='MODIFY'}">
			<c:choose>
				<c:when test="${mode=='NEW'}"><h2>បញ្ចូលកម្មវិធីការប្រលងបញ្ចប់ - វគ្គ​ ${ exam_course.name }
				<input type="hidden" name="saveexam" class="saveexam" value="saveexampreparation"/></h2></c:when>
				<c:when test="${mode=='MODIFY'}"><h2>កែប្រែកម្មវិធីការប្រលង - វគ្គ​ ${ exam_course.name }
				<input type="hidden" name="saveexam" class="saveexam" value="saveupdateexam"/></h2></c:when>
			</c:choose>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបញ្ចូល និងមើលកម្មវិធីការប្រលង</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="exampreparations"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <form method="POST" id="frmSubmit">
			 	<input type="hidden" name="id" id="csId">
			 	<input type="hidden" name="course.id" id="csCourseId">
			 	<input type="hidden" name="subject.id" id="csSubjectId">
			 	<input type="hidden" name="teacher.id" id="csTeacherId">
			 	<input type="hidden" name="dayOfWeek" id="csDayOfWeek">
			 	<input type="hidden" name="studyTime" id="csStudyTime">
			 	<input type="hidden" name="startTime" id="csStartTime">
			 	<input type="hidden" name="endTime" ifd="csEndTime">
			 	<div class="form-group row">
			 		<label class="col-form-label col-form-label-sm col-sm-2" for="subject">មុខវិជ្ជាឈ្មោះ (*)</label>
			 		<div class="col-sm-4">
			 		<c:choose>
			 			<c:when test="${mode=='NEW'}">
				 			<select required class="examSelSubject form-control form-control-sm" name="exam[0].schedule.id">
					    		<option></option>
								<c:forEach var="schedule" items="${exam_course.courseSubjects}">
									<option value="${ schedule.id }"
									course_id="${ schedule.course.id }"
									subject_id="${ schedule.subject.id }"
									subject_name="${ schedule.subject.name }"
									teacher_id="${ schedule.teacher.id }"
									dayOfWeek="${ schedule.dayOfWeek }"
									studyTime="${ schedule.studyTime }"
									startTime="${ schedule.startTime }"
									endTime="${ schedule.endTime }"
									>${ schedule.subject.name }</option>
								</c:forEach>
							</select>
			 			</c:when>
			 			<c:when test="${mode=='MODIFY'}">
			 				<select required class="examSelSubject form-control form-control-sm" name="exam[0].schedule.id" disabled="false">
								<option value="${ exam.schedule.id}"
								course_id="${ exam.schedule.course.id }"
								subject_id="${ exam.schedule.subject.id }"
								subject_name="${ exam.schedule.subject.name }"
								teacher_id="${ exam.schedule.teacher.id }"
								dayOfWeek="${ exam.schedule.dayOfWeek }"
								studyTime="${ exam.schedule.studyTime }"
								startTime="${ exam.schedule.startTime }"
								endTime="${ exam.schedule.endTime }"
								selected="true"
								>${ exam.schedule.subject.name }</option>
							</select>
							<input type="hidden" name="exam[0].schedule.id" value="${exam.schedule.id}" id="examSchId">
							<input type="hidden" name="exam[0].id" value="${exam.id}" id="examId">
			 			</c:when>
			 		</c:choose>
				    	
				    </div>
				    <label class="col-form-label col-form-label-sm col-sm-2" for="date">កាលបរិច្ឆេទ (*)</label>
				    <div class="col-sm-4">
				    	<input required type="date" class="form-control form-control-sm" value="${exam.examDate}" name="exam[0].examDate">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label class="col-form-label col-form-label-sm col-sm-2" for="durations">រយះពេល (*)</label>
				    <div class="col-sm-4">
						<input type="text" class="form-control form-control-sm" value="${exam.duration}" name="exam[0].duration" id="durations">
					</div>
				    <label class="col-form-label col-form-label-sm col-sm-2" for="attendances">ពិន្ទុវត្តមាន</label>
				    <div class="col-sm-3">
				    	<input type="text" class="form-control form-control-sm" value="${exam.attendance_piont}" name="exam[0].attendance_piont" id="scoreAtt">
				    </div>
				    <label class="col-form-label col-form-label-sm col-sm-1" style="text-align:right;">/100</label>
				  </div>
				  <div class="form-group row">
				  	<label class="col-form-label col-form-label-sm col-sm-2" for="finalexam">ពិន្ទុប្រលង</label>
				    <div class="col-sm-3">
				    	<input type="text" class="form-control form-control-sm" value="${exam.finalexam_piont}" name="exam[0].finalexam_piont" id="scoreExam">
				    </div>
				    <label class="col-form-label col-form-label-sm col-sm-1" style="text-align:right;">/100</label>
				  </div>
				  <div class="form-group row">        
		      		<div class="offset-sm-2 col-sm-10">
		      			<button id="btnSubmit" type="submit" class="btn btn-primary">រក្សាទុក</button>
		      		</div>
	      		  </div>
			 </form>
		</c:when>
		<c:when test="${mode == 'LIST'}">
			<h2>កម្មវិធីការប្រលងបញ្ចប់ - វគ្គ​ ${ examprograms.name }</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបញ្ចូល និងមើលកម្មវិធីការប្រលងតាមវគ្គនីមួយៗ</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="exampreparations"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <div class="row">
			  	<div class="col-sm-12">
			  		<table class="table table-bordered tblAttendance">
				    <thead>
			    		<th>ឈ្មោះមុខវិជ្ជា</th>
			    		<th>កាលបរិច្ឆេទ</th>
			    		<th>រយះពេល</th>
			    		<th>ពិន្ទុវត្តមាន</th>
			    		<th>ពិន្ទុប្រលង</th>
			    		<th>កែប្រែ</th>
			    		<th>លុប</th>
				    </thead>
				    <tbody>
				    	<c:forEach var="schedule" items="${examprograms.courseSubjects}">	
				    		<c:forEach var="finalexam" items="${schedule.exam}">
				    		<tr>
				    			<td>${ finalexam.schedule.subject.name }</td>
					    		<td>${finalexam.examDate}</td>
					    		<td>${finalexam.duration}</td>
					    		<td>${finalexam.attendance_piont}</td>
					    		<td>${finalexam.finalexam_piont}</td>
					    		<td><a href="/updateexam?id=${examprograms.id}&examID=${finalexam.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
					    		<td><a data-toggle="modal" href="#myModal${finalexam.id}"><i class="fa fa-trash-o" style="color:red"></i></a>
					    			<!-- The Modal -->
									  <div class="modal fade" id="myModal${finalexam.id}">
									    <div class="modal-dialog modal-sm">
									      <div class="modal-content">
									      
									        <!-- Modal Header -->
									        <div class="modal-header">
									          <h4 class="modal-title">បញ្ជាក់</h4>
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									        </div>
									        
									        <!-- Modal body -->
									        <div class="modal-body">
									          តើអ្នកពិតជាចង់លុបទិន្នន័យ ${finalexam.id} នេះមែនទេ?
									        </div>
									        
									        <!-- Modal footer -->
									        <div class="modal-footer">
									          <a href="/deleteexam?id=${finalexam.id}&cosID=${schedule.course.id}"><button type="button" class="btn btn-primary" data-dismiss="model">យល់ព្រម</button></a>
									        </div>
									        
									      </div>
									    </div>
									  </div>
									<!-- End Model -->	
					    		
					    		</td>
					    	</tr>
				    		</c:forEach>
				    	</c:forEach>
				    </tbody>
				  </table>
			  	</div>
		  	</div>
	 	</c:when>
	</c:choose>

</div>