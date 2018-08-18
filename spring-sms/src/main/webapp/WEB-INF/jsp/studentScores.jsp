<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "com.tax.springsms.models.StudentScore" %>
<html>
<head>
  <%@ include file="header.jsp" %>
</head>
<body>

<%@ include file="navigation.jsp" %>

<div class="container">

	<c:choose>
		<c:when test="${mode == 'VIEW'}">
			<h2>ពិន្ទុសិស្សក្នុងវគ្គបណ្តុះបណ្តាលនីមួយៗ</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលលទ្ធផលរបស់សិស្សតាមវគ្គនីមួយៗ</i></p>
		 	<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>ល.រ</th>
			        <th>ឈ្មោះ</th>
			        <th>រយៈពេល</th>
			        <th>ស្ថានភាព</th>
			        <th>មុខវិជ្ជា / គ្រូបង្រៀន / ថ្ងៃបង្រៀន</th>
			        <th>លទ្ធផលនៃការប្រលង</th>
			        <th>ការបញ្ចូលពិន្ទុ</th>
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
				       	<td><a href="liststudentresult?id=${course.id}"><i class="fa fa-calendar" style="color:blue"></i></a></td>
				       	<td><a href="newstudentscores?id=${course.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
				       	</tr>
			       	</c:forEach>
			    </tbody>
		    </table>
		</c:when>
		<c:when test="${mode == 'NEW'}">
			<h2>ការបញ្ចូលពិន្ទុសិស្ស - វគ្គ​ ${ stuCourses[0].course.name}</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលលទ្ធផលរបស់សិស្សតាមវគ្គនីមួយៗ</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="studentscores"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <form method="POST" action="savestudentscore">
<!-- 			 	<input type="hidden" name="id" id="csId">
			 	<input type="hidden" name="course.id" id="csCourseId">
			 	<input type="hidden" name="subject.id" id="csSubjectId">
			 	<input type="hidden" name="teacher.id" id="csTeacherId">
			 	<input type="hidden" name="dayOfWeek" id="csDayOfWeek">
			 	<input type="hidden" name="studyTime" id="csStudyTime">
			 	<input type="hidden" name="startTime" id="csStartTime">
			 	<input type="hidden" name="endTime" id="csEndTime"> -->
			 	<input type="hidden" name="exam.id" id="examID">
			 	<input type="hidden" name="cosID" id="courseID">
			 	<div class="form-group row">
				    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">មុខវិជ្ជាឈ្មោះ (*)</label>
			 		<div class="col-sm-4">
				    	<select required class="clsScoreSelSubject form-control form-control-sm">
				    		<option></option>
							<c:forEach var="schedule" items="${stuCourses[0].course.courseSubjects}">
								<option value="${ schedule.id }"
								course_id="${ schedule.course.id }"
								<%-- subject_id="${ schedule.subject.id }"
								subject_name="${ schedule.subject.name }"
								teacher_id="${ schedule.teacher.id }"
								dayOfWeek="${ schedule.dayOfWeek }"
								studyTime="${ schedule.studyTime }"
								startTime="${ schedule.startTime }"
								endTime="${ schedule.endTime }" --%>
								exam_id="${schedule.exam[0].id}"
								attScore="${ schedule.exam[0].attendance_piont}"
								examScore="${ schedule.exam[0].finalexam_piont}"
								>${ schedule.subject.name }</option>
							</c:forEach>
						</select>
				    </div>
				    
				    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">ឈ្មោះសិស្ស (*)</label>
				    <div class="col-sm-4">
				    	<select required class="form-control form-control-sm" name="studentCourse.ID">
				    		<option></option>
							<c:forEach var="stuCourse" items="${stuCourses}">
								<option value="${ stuCourse.ID }"
								>${ stuCourse.student.name }</option>
							</c:forEach>
						</select>
				    </div>
				  </div>
				  <div class="form-group row">
					  <label class="col-form-label col-form-label-sm col-sm-2" for="attendances">ពិន្ទុវត្តមាន</label>
					    <div class="col-sm-3">
					    	<input type="text" class="form-control form-control-sm" value="${exam.attendance_piont}" name="attendance_score" id="scoreAtt">
					    </div>
					    <label class="col-form-label col-form-label-sm col-sm-1" style="text-align:right;" id="attScore">/100</label>
					    
					    <label class="col-form-label col-form-label-sm col-sm-2" for="attendances">ពិន្ទុប្រលង</label>
					    <div class="col-sm-3">
					    	<input type="text" class="form-control form-control-sm" value="${exam.attendance_piont}" name="finalexam_piont" id="scoreFinalExam">
					    </div>
					    <label class="col-form-label col-form-label-sm col-sm-1" style="text-align:right;" id="examScore">/100</label>
				  
				  </div>
				  <div class="form-group row">        
		      		<div class="offset-sm-2 col-sm-10">
		      			<button type="submit" class="btn btn-primary">រក្សាទុក</button>
		      		</div>
	      		  </div>
			 </form>
		</c:when>
		<c:when test="${mode == 'LIST'}">
			<h2>លទ្ធផលនៃការប្រលងបញ្ចប់វគ្គ - វគ្គ​ ${ studentPoint.name }</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលលទ្ធផលរបស់សិស្សតាមវគ្គនីមួយៗ</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="studentscores"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <div class="row">
			  	<!-- <div class="col-sm-12"> -->
			  		<table class="table table-bordered tblAttendance">
				    <tr>
			    		<th>ឈ្មោះសិស្ស</th>
			    		<%int count=0; %>
						<c:forEach var="subjects" items="${ studentPoint.courseSubjects }">
							<th>
								<table style="border:none !important;" width="100%" class="table-bordered tblAttendance">
									<tr><td colspan="2" style="border:none !important;">${subjects.subject.name}</td></tr>
									<tr>
										<td style="border:none; border-right:1px solid #dee2e6 !important; width:50%;">ពិន្ទុវត្តមាន</td>
										<td style="border:none !important; width:50%;">ពិន្ទុប្រលង</td>
									</tr>
								</table>
							</th>
							<%count=count+1; %>
						</c:forEach>
				    	<th>ពិន្ទុសរុប</th>
				    	<th>លទ្ធផល</th>
				    </tr>
				    <tbody>
				      <c:forEach var="examresults" items="${studentPoint.studentCourse}">
				      <%
							float totalScore=0;
						 	long att_score,exam_score;
			    	  %>
				      	<tr>
				      		<td>${examresults.student.name}</td>
				      		<c:forEach var="subjects" items="${ studentPoint.courseSubjects }">
				      			<%boolean hasSub= false;%>
					      		<c:forEach var="subjectscore" items="${examresults.studentscores}">
					      			<c:choose>
					      				<c:when test="${subjects.subject.id==subjectscore.exam.schedule.subject.id}">
					      					<td>
								      			<table style="border:none !important;" width="100%" class="table-bordered tblAttendance">
													<tr>
														<td style="border:none; border-right:1px solid #dee2e6 !important; width:50%;">${subjectscore.attendance_score }</td>
														<td style="border:none !important; width:50%;">${subjectscore.finalexam_piont}</td>
													</tr>
												</table>
							      			</td>
							      			<%
							      				StudentScore score = (StudentScore) pageContext.getAttribute("subjectscore");
							      				att_score=score.getAttendance_score();
							      				exam_score=score.getFinalexam_piont();
							      				totalScore=totalScore+(att_score + exam_score);
							      				hasSub=true;
							      			%>
					      				</c:when>
					      			</c:choose>
					      			
					      		</c:forEach>
					      		<%if(!hasSub) %><td></td>
					      	</c:forEach>
				      		<td><%= totalScore/count %></td>
				      		<td><%= (totalScore/count)>=50?"ជាប់":"ធ្លាក់"%></td>
				      	</tr>
				      </c:forEach>
				    </tbody>
				  </table>
			  	<!-- </div> -->
		  	</div>
	 	</c:when>
	</c:choose>

</div>