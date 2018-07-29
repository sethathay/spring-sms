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
		  <h2>បញ្ជីគ្រូបង្រៀន</h2>
		  <p><i>ក្នុងផ្នែកនេះលោកអ្នកអាចធ្វើការបង្កើត កែប្រែ និងលុបនូវព៌តមានរបស់គ្រូបង្រៀន</i></p>   
		  <div class="row">
		  	<div class="col-sm-12">
		  		<a href="/newteacher" class="btn btn-success"><i class="fa fa-plus"></i> បង្កើតថ្មី</a>
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
		        <th>មុខវិជ្ជា</th>
		        <th>កែប្រែ</th>
		        <th>លុប</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="teacher" items="${teachers}">
			      <tr>
			        <td id="IDTeacher">${teacher.id}</td>
			        <td>${teacher.name}</td>
			        <td>${teacher.gender? "ប្រុស": "ស្រី"}</td>
			        <td>${teacher.dob}</td>
			        <td>${teacher.pob}</td>
			        <td>${teacher.address}</td>
			        <td>${teacher.fstatus? "មានគ្រួសារ": "នៅលីវ"}</td>
			        <td>${teacher.caddress}</td>
			        <td>${teacher.phone}</td>
			        <td>${teacher.email}</td>  <!-- deleteteacher?id=${teacher.id} -->
			        <td>
			        	<c:forEach var="subject" items="${teacher.subjects}">
			        		<span class="badge badge-pill badge-secondary">${subject.name}</span> &nbsp;
			        	</c:forEach>
			        </td>
			       	<td><a href="updateteacher?id=${teacher.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
			       	<td><a data-toggle="modal" href="#myModal${teacher.id}"><i class="fa fa-trash-o" style="color:red"></i></a>
			       		<!-- The Modal -->
						  <div class="modal fade" id="myModal${teacher.id}">
						    <div class="modal-dialog modal-sm">
						      <div class="modal-content">
						      
						        <!-- Modal Header -->
						        <div class="modal-header">
						          <h4 class="modal-title">បញ្ជាក់</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						        
						        <!-- Modal body -->
						        <div class="modal-body">
						          តើអ្នកពិតជាចង់លុបទិន្នន័យ ${teacher.id} នេះមែនទេ?
						        </div>
						        
						        <!-- Modal footer -->
						        <div class="modal-footer">
						          <a href="deleteteacher?id=${teacher.id}"><button type="button" class="btn btn-primary" data-dismiss="model">យល់ព្រម</button></a>
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
	<c:when test="${mode == 'MODIFY'}">
		<h2>កែប្រែព៌តមានគ្រូបង្រៀន</h2>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<br/>
		  		<a class="btn btn-success" href="teachers"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="saveteacher">
			<input type="hidden" value="${teacher.id}" name="id" id="id">
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${teacher.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="gender">ភេទ </label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="gender" id="gender">
				        <option value="false" ${teacher.gender? "" : "selected" }>ស្រី</option>
				        <option value="true" ${teacher.gender? "selected" : "" }>ប្រុស</option>
				      </select>
			      </div>
			  </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃខែឆ្នាំកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${teacher.dob}" name="dob" id="dob">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="pob">ទីកន្លែងកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control form-control-sm" value="${teacher.pob}" name="pob" id="pob">
			    </div>
			  </div>
			  <div class="form-group row">
				  <label class="col-form-label col-form-label-sm col-sm-2" for="address">អសយដ្ឋានបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="address" id="address">${teacher.address}</textarea>
				  </div>
				  <label class="col-form-label col-form-label-sm col-sm-2" for="caddress">អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="caddress" id="caddress">${teacher.caddress}</textarea>
				  </div>
				</div>
				<div class="form-group row">
			      <label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">ស្ថានភាពគ្រួសារ</label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="fstatus" id="fstatus">
				        <option value="false" ${teacher.fstatus? "" : "selected" }>នៅលីវ</option>
				        <option value="true" ${teacher.fstatus? "selected" : "" }>មានគ្រួសារ</option>
				      </select>
			      </div>
			      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">លេខទូរសព្ទ</label>
				    <div class="col-sm-4">
				    	<input type="text" class="form-control form-control-sm" value="${teacher.phone}" name="phone" id="phone">
				    </div>
		      </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="email">អ៊ីម៉ែល</label>
			    <div class="col-sm-4">
			    	<input type="email" class="form-control form-control-sm" value="${teacher.email}" name="email" id="email">
			    </div>
			  </div>
			  
			  	<div class="form-group row">
					<div class="offset-sm-2 col-sm-10">
						<div class="row">
							<label class="col-form-label col-form-label-sm col-sm-4" for="selectsubject">សូមជ្រើសរើសមុខវិជ្ជាដែលគ្រូអាចបង្រៀន</label>
							<select class="form-control form-control-sm col-sm-4" name="selectsubject">
								<c:forEach var="indSubject" items="${subjectList}">
									<option value="${ indSubject.id }"
									abbr = "${ indSubject.abbr}"
									name = "${ indSubject.name}"
									description = "${ indSubject.description}"
									>${ indSubject.name }</option>
								</c:forEach>
							</select>
							&nbsp;
						    <a class="btnAddSubject btn btn-success"><i class="fa fa-plus"></i></a>
						</div>
						<br>
						<table class="table table-bordered table-sm tblSubjectList">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">អក្សរកាត់</th>
						      <th scope="col">ឈ្មោះ</th>
						      <th scope="col">បរិយាយផ្សេងៗ</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="sub" items="${teacher.subjects}" varStatus="element">
						    <tr>
						      <!-- Binding list of teachers for field you display -->
						      <input type="hidden" name="subjects[${element.index}].id" value="${sub.id}">
						      <th scope="row">${element.count}</th>
						      <td>${sub.abbr}</td>
						      <td>${sub.name}</td>
						      <td>${sub.description}</td>
						      <td><a href="#" class="cmdDeleteRowSubject"><i class="fa fa-trash-o" style="color:red"></i></a></td>
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
	<c:when test="${mode == 'NEW'}">
		<h2>បង្កើតគ្រូបង្រៀនថ្មី</h2>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<br/>
		  		<a class="btn btn-success" href="teachers"><i class="fa fa-mail-reply"></i> ត្រលប់ក្រោយ</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="saveteacher">
			<!-- No need it will generate ID auto -->
			<!--<input type="hidden" value="${teacher.id}+3" name="id" id="id">-->
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${teacher.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="gender">ភេទ </label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="gender" id="gender">
				        <option value="false" ${teacher.gender? "" : "selected" }>ស្រី</option>
				        <option value="true" ${teacher.gender? "selected" : "" }>ប្រុស</option>
				      </select>
			      </div>
			  </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃខែឆ្នាំកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${teacher.dob}" name="dob" id="dob">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="pob">ទីកន្លែងកំណើត</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control form-control-sm" value="${teacher.pob}" name="pob" id="pob">
			    </div>
			  </div>
			  <div class="form-group row">
				  <label class="col-form-label col-form-label-sm col-sm-2" for="address">អសយដ្ឋានបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="address" id="address">${teacher.address}</textarea>
				  </div>
				  <label class="col-form-label col-form-label-sm col-sm-2" for="caddress">អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="caddress" id="caddress">${teacher.caddress}</textarea>
				  </div>
				</div>
				<div class="form-group row">
			      <label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">ស្ថានភាពគ្រួសារ</label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="fstatus" id="fstatus">
				        <option value="false" ${teacher.fstatus? "" : "selected" }>នៅលីវ</option>
				        <option value="true" ${teacher.fstatus? "selected" : "" }>មានគ្រួសារ</option>
				      </select>
			      </div>
			      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">លេខទូរសព្ទ</label>
				    <div class="col-sm-4">
				    	<input type="text" class="form-control form-control-sm" value="${teacher.phone}" name="phone" id="phone">
				    </div>
		      </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="email">អ៊ីម៉ែល</label>
			    <div class="col-sm-4">
			    	<input type="email" class="form-control form-control-sm" value="${teacher.email}" name="email" id="email">
			    </div>
			  </div>
			  
			  <div class="form-group row">
					<div class="offset-sm-2 col-sm-10">
						<div class="row">
							<label class="col-form-label col-form-label-sm col-sm-4" for="selectsubject">សូមជ្រើសរើសមុខវិជ្ជាដែលគ្រូអាចបង្រៀន</label>
							<select class="form-control form-control-sm col-sm-4" name="selectsubject">
								<c:forEach var="indSubject" items="${subjectList}">
									<option value="${ indSubject.id }"
									abbr = "${ indSubject.abbr}"
									name = "${ indSubject.name}"
									description = "${ indSubject.description}"
									>${ indSubject.name }</option>
								</c:forEach>
							</select>
							&nbsp;
						    <a class="btnAddSubject btn btn-success"><i class="fa fa-plus"></i></a>
						</div>
						<br>
						<table class="table table-bordered table-sm tblSubjectList">
						  <thead>
						    <tr>
						      <th scope="col">ល.រ</th>
						      <th scope="col">អក្សរកាត់</th>
						      <th scope="col">ឈ្មោះ</th>
						      <th scope="col">បរិយាយផ្សេងៗ</th>
						      <th scope="col">លុប</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="sub" items="${teacher.subjects}" varStatus="element">
						    <tr>
						      <!-- Binding list of teachers for field you display -->
						      <input type="hidden" name="subjects[${element.index}].id" value="${sub.id}">
						      <th scope="row">${element.count}</th>
						      <td>${sub.abbr}</td>
						      <td>${sub.name}</td>
						      <td>${sub.description}</td>
						      <td><a href="#" class="cmdDeleteRowSubject"><i class="fa fa-trash-o" style="color:red"></i></a></td>
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
