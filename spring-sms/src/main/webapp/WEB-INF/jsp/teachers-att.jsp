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
			<h2>ចុះវត្តមានគ្រូបង្រៀន</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលវត្តមានរបស់គ្រូបង្រៀនតាមវគ្គនីមួយៗ</i></p>
		 	<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>ល.រ</th>
			        <th>ឈ្មោះ</th>
			        <th>រយៈពេល</th>
			        <th>ស្ថានភាព</th>
			        <th>មុខវិជ្ជា / គ្រូបង្រៀន / ថ្ងៃបង្រៀន</th>
			        <th>បញ្ជីវត្តមាន</th>
			        <th>កត់វត្តមាន</th>
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
				       	<td><a href="listteacheratt?id=${course.id}&month=7&year=2018"><i class="fa fa-calendar" style="color:blue"></i></a></td>
				       	<td><a href="newteacheratt?id=${course.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
				       	</tr>
			       	</c:forEach>
			    </tbody>
		    </table>
		</c:when>
		<c:when test="${mode == 'NEW'}">
			<h2>ចុះវត្តមានគ្រូបង្រៀន - វគ្គ​ ${ course.name }</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលវត្តមានរបស់គ្រូបង្រៀនតាមវគ្គនីមួយៗ</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="teachers-att"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <form method="POST" action="saveattendance">
			 	<input type="hidden" name="id" id="csId">
			 	<input type="hidden" name="course.id" id="csCourseId">
			 	<input type="hidden" name="subject.id" id="csSubjectId">
			 	<input type="hidden" name="teacher.id" id="csTeacherId">
			 	<input type="hidden" name="dayOfWeek" id="csDayOfWeek">
			 	<input type="hidden" name="studyTime" id="csStudyTime">
			 	<input type="hidden" name="startTime" id="csStartTime">
			 	<input type="hidden" name="endTime" id="csEndTime">
			 	<div class="form-group row">
				    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">ឈ្មោះគ្រូ (*)</label>
				    <div class="col-sm-4">
				    	<select required class="clsSelTeacher form-control form-control-sm" name="attendances[0].schedule.id">
				    		<option></option>
							<c:forEach var="schedule" items="${course.courseSubjects}">
								<option value="${ schedule.id }"
								course_id="${ course.id }"
								subject_id="${ schedule.subject.id }"
								subject_name="${ schedule.subject.name }"
								teacher_id="${ schedule.teacher.id }"
								dayOfWeek="${ schedule.dayOfWeek }"
								studyTime="${ schedule.studyTime }"
								startTime="${ schedule.startTime }"
								endTime="${ schedule.endTime }"
								>${ schedule.teacher.name }</option>
							</c:forEach>
						</select>
						<label style="color:tomato" id="lblDisplay" class="col-form-label col-form-label-sm"></label>
				    </div>
				    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ថ្ងៃកត់វត្តមាន (*)</label>
				    <div class="col-sm-4">
				    	<input required type="date" class="form-control form-control-sm" name="attendances[0].scheduleDate">
				    </div>
				  </div>
				  <div class="form-group row">
				    <label class="col-form-label col-form-label-sm col-sm-2" for="abbr">ប្រភេទវត្តមាន (*)</label>
				    <div class="col-sm-4">
				    	<select required class="form-control form-control-sm" name="attendances[0].absent">
					        <option></option>
					        <option value="0">អវត្តមាន</option>
					        <option value="1">មានវត្តមាន</option>
					        <option value="2">សុំច្បាប់</option>
					    </select>
				    </div>
				    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ផ្សេងៗ</label>
				    <div class="col-sm-4">
				    	<textarea class="form-control form-control-sm" rows="3" name="attendances[0].remark"></textarea>
				    </div>
				  </div>
				  <div class="form-group row">        
		      		<div class="offset-sm-2 col-sm-10">
		      			<button type="submit" class="btn btn-primary">រក្សាទុក</button>
		      		</div>
	      		  </div>
			 </form>
		</c:when>
		<c:when test="${mode == 'LIST'}">
			<h2>បញ្ជីវត្តមានគ្រូបង្រៀន - វគ្គ​ ${ course.name }</h2>
		 	<p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការកត់ត្រា និងមើលវត្តមានរបស់គ្រូបង្រៀនតាមវគ្គនីមួយៗ</i></p>
		 	<div class="row">
			  	<div class="col-sm-12">
			  		<br/>
			  		<a class="btn btn-success" href="teachers-att"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
			  		<br/><br/>
			  	</div>
			 </div>
			 <%
      			//Get a calendar instance
      			Calendar calendar = Calendar.getInstance();
      			// Get the last date of the current month. To get the last date for a
           		// specific month you can set the calendar month using calendar object
           		// calendar.set(Calendar.MONTH, theMonth) method.
           		int month, year,lastDay, textFirstDay,currentYear,currentMonth;
           		if(pageContext.findAttribute("month") != null && pageContext.findAttribute("year") != null){
           			month = (int) pageContext.getAttribute("month");
					year = (int) pageContext.getAttribute("year");
					calendar.set(Calendar.MONTH, month);
					calendar.set(Calendar.YEAR, year);
					
					lastDay = calendar.get(Calendar.DAY_OF_MONTH);
					textFirstDay = calendar.get(Calendar.DAY_OF_WEEK);
					currentYear = calendar.get(Calendar.YEAR);
          		  	currentMonth = calendar.get(Calendar.MONTH);
           		}else{
      		    	int lastDate = calendar.getActualMaximum(Calendar.DATE);
      		  		// Set the calendar date to the last date of the month so then we can
              		// get the last day of the month
      		    	calendar.set(Calendar.DATE, lastDate);
      		    	lastDay = calendar.get(Calendar.DAY_OF_MONTH);
      		    	//Calendar cl = Calendar.getInstance();
          		  	int firstDate = calendar.getActualMinimum(Calendar.DATE);
          		  	calendar.set(Calendar.DATE, firstDate);
          		  	textFirstDay = calendar.get(Calendar.DAY_OF_WEEK);
          		  	currentYear = calendar.get(Calendar.YEAR);
          		  	currentMonth = calendar.get(Calendar.MONTH);
           		}
    		 %>
			 <div class="row">
			 	<div class="col-sm-12">
			 		<div class="form-group row">
				    <label class="col-form-label col-form-label-sm col-sm-1" for="month">ជ្រើសរើសខែ</label>
				    <div class="col-sm-2">
				    	<select class="form-control form-control-sm" name="month">
					        <option value="0" <%=currentMonth == 0? "selected" : "" %>>មករា</option>
					        <option value="1" <%=currentMonth == 1? "selected" : "" %>>កុម្ភៈ</option>
					        <option value="2" <%=currentMonth == 2? "selected" : "" %>>មិនា</option>
					        <option value="3" <%=currentMonth == 3? "selected" : "" %>>មេសា</option>
					        <option value="4" <%=currentMonth == 4? "selected" : "" %>>ឧសភា</option>
					        <option value="5" <%=currentMonth == 5? "selected" : "" %>>មិថុនា</option>
					        <option value="6" <%=currentMonth == 6? "selected" : "" %>>កក្កដា</option>
					        <option value="7" <%=currentMonth == 7? "selected" : "" %>>សីហា</option>
					        <option value="8" <%=currentMonth == 8? "selected" : "" %>>កញ្ញា</option>
					        <option value="9" <%=currentMonth == 9? "selected" : "" %>>តុលា</option>
					        <option value="10" <%=currentMonth == 10? "selected" : "" %>>វិច្ឆិកា</option>
					        <option value="11" <%=currentMonth == 11? "selected" : "" %>>ធ្នូ</option>
					    </select>
				    </div>
				    <label class="col-form-label col-form-label-sm" for="year">ជ្រើសរើសឆ្នាំ</label>
				    <div class="col-sm-2">
				    	<select class="form-control form-control-sm" name="year">
				    		<%for(int y=currentYear; y>=currentYear-20; y--){ %>
					        <option value="<%=y%>"><%=y %></option>
					        <%} %>
					    </select>
				    </div>
				    <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> ស្វែងរក</button>
				  </div>
			 	</div>
			 </div>
			 <div class="row">
			  	<div class="col-sm-12">
			  		<table class="table table-bordered tblAttendance">
				    <thead>
			    		<th>ឈ្មោះគ្រូបង្រៀន</th>
				    	<%
				    		for(int i=1; i<=lastDay; i++){
				    			String dateText = "";
				    			if(textFirstDay == 7){
				    				dateText = "ស";
				    				textFirstDay = 1;
				    			}else{
				    				dateText = textFirstDay % 7 == 1 ? "អទ" :
				    					textFirstDay % 7 == 2 ? "ច" :
				    					textFirstDay % 7 == 3 ? "អ":
				    					textFirstDay % 7 == 4 ? "ព":
				    					textFirstDay % 7 == 5 ? "ព្រ":
		    							textFirstDay % 7 == 6 ? "សុ": "";
				    				textFirstDay++;
				    			}
		    			%>
				    		<th><%=dateText %><br><%=i %></th>
				    	<%
				    		}
				    	%>
				    </thead>
				    <tbody>
				      <c:forEach var="schedule" items="${course.courseSubjects}">
				      	<tr>
				      		<td>${schedule.teacher.name}</td>
				      			<c:forEach var="i" begin="1" end="<%=lastDay %>">
				      				<%boolean hasDate = false; %>	
				      				<c:forEach var="att" items="${ schedule.attendances }">
			      						<% 
			      						TeacherAttendance att = (TeacherAttendance) pageContext.getAttribute("att");
			      						SimpleDateFormat fts = new SimpleDateFormat ("d");
			      						
			      						int ind = (Integer) pageContext.getAttribute("i");
			      						
			      						if(ind == Integer.parseInt(fts.format(att.getScheduleDate()))){
			      							hasDate = true;
			      						%>
			      							<td><%=att.getAbsent() == 0? "A" : att.getAbsent() == 1? "O" : "P" %></td>
			      						<%
			      						}
			      						%>
			      					</c:forEach>
			      					<%if(!hasDate) %> <td></td>
				      			</c:forEach>
				      	</tr>
				      </c:forEach>
				    </tbody>
				  </table>
			  	</div>
		  	</div>
	 	</c:when>
	</c:choose>

</div>