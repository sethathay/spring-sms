<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <%@ include file="header.jsp" %>
</head>
<body>

<%@ include file="navigation.jsp" %>

<div class="container">
	<form method="POST" action="#">	
		<h2>លិខិតចុះឈ្មោះចូលរៀន</h2>
		  <br/><br/>		  
				<div class="form-group row">
					<div class="col-sm-10">
						<div class="row">					
					
						</div>
						</div>
					</div>
						<br/>
						<!-- <form>	 -->
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="name">ឈ្មោះ (*)</label>
								<div class="col-sm-4">
									<label class="col-form-label col-form-label-sm" for="name">:${stuRegisters[0].student.name}</label>
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="gender">ភេទ </label>
								<div class="col-sm-4">
								<label class="col-form-label col-form-label-sm" for="gender">:${stuRegisters[0].student.gender?"ប្រុស":"ស្រី"}</label>
								    <%-- <select class="form-control form-control-sm" name="gender" id="gender" disabled="false">
										<option value="false" ${studentList[0].gender? "" : "selected" }>ស្រី</option>
									    <option value="true" ${studentList[0].gender? "selected" : "" }>ប្រុស</option>
									</select> --%>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="dob">ថ្ងៃខែឆ្នាំកំណើត</label>
								<div class="col-sm-4">
									<label class="col-form-label col-form-label-sm" for="dob">:${stuRegisters[0].student.dob} </label>
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="pob">ទីកន្លែងកំណើត</label>
								<div class="col-sm-4">
								   <label class="col-form-label col-form-label-sm" for="pob">:${stuRegisters[0].student.pob} </label>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="address">អសយដ្ឋានបច្ចុប្បន្ន</label>
								<div class="col-sm-4">
									<label class="col-form-label col-form-label-sm" for="address">:${stuRegisters[0].student.address} </label>
								</div>
								<label class="col-form-label col-form-label-sm col-sm-2" for="caddress">អសយដ្ឋានទំនាក់ទំនងបច្ចុប្បន្ន</label>
								<div class="col-sm-4">
									<label class="col-form-label col-form-label-sm" for="caddress">:${stuRegisters[0].student.caddress} </label>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">ស្ថានភាពគ្រួសារ</label>
								<div class="col-sm-4">
								<label class="col-form-label col-form-label-sm" for="fstatus">:${stuRegisters[0].student.fstatus?"មានគ្រួសារ":"នៅលីវ"} </label>
									<%-- <select class="form-control form-control-sm" name="fstatus" id="fstatus" disabled="false">
									    <option value="false" ${studentList[0].fstatus? "" : "selected" }>នៅលីវ</option>
									    <option value="true" ${studentList[0].fstatus? "selected" : "" }>មានគ្រួសារ</option>
									 </select> --%>
								</div>
								      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">លេខទូរសព្ទ</label>
									    <div class="col-sm-4">
									    	<label class="col-form-label col-form-label-sm" for="phone">:${stuRegisters[0].student.phone} </label>
									    </div>
							</div>
							<div class="form-group row">
								  <label class="col-form-label col-form-label-sm col-sm-2" for="email">អ៊ីម៉ែល</label>
								<div class="col-sm-4">
								  <label class="col-form-label col-form-label-sm" for="email">:${stuRegisters[0].student.email} </label>
								</div>
							</div>
						<!-- </form> -->
						<br/>	
					<div class="form-group row">
			      			<label class="col-form-label col-form-label-sm col-sm-12" for="courseDes">បានចុះឈ្មោះចូលរៀនវគ្គបណ្តុះបណ្តាល
			      			<c:forEach var="stuCourse" items="${stuRegisters}">
			      				, ${stuCourse.course.name}
			      			</c:forEach>
			      			</label>
	    			</div>	  
	    			<div class="form-group row">
			      			<label class="col-form-label col-form-label-sm col-sm-12" for="courseDes">កាលបរិច្ឆេទ ៖ ${(stuRegisters[0].regDate).toString()}
			      			</label>
	    			</div>	  
			  <div class="form-group row">        
	      		<div class="col-sm-10">
	      			<button type="submit" class="btn btn-primary">បោះពុម្ព</button>
	      		</div>
	    	</div>
			</form>
  
</div>

</body>
</html>
