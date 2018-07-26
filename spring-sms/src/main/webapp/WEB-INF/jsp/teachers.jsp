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
		  <h2>???????????????</h2>
		  <p><i>????????????????????????????????????? ?????? ?????????????????????????????</i></p>   
		  <div class="row">
		  	<div class="col-sm-12">
		  		<button type="button" class="btn btn-success"><i class="fa fa-plus"></i> ??????????</button>
		  		<br/><br/>
		  	</div>
		  </div>         
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>?.?</th>
		        <th>?????</th>
		        <th>???</th>
		        <th>????????????????</th>
		        <th>?????????????</th>
		        <th>????????????????????</th>
		        <th>???????????????</th>
		        <th>??????????????????????????????</th>
		        <th>??????????</th>
		        <th>???????</th>
		        <th>??????</th>
		        <th>???</th>
		      </tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="teacher" items="${teachers}">
			      <tr>
			        <td>${teacher.id}</td>
			        <td>${teacher.name}</td>
			        <td>${teacher.gender? "?????": "????"}</td>
			        <td>${teacher.dob}</td>
			        <td>${teacher.pob}</td>
			        <td>${teacher.address}</td>
			        <td>${teacher.fstatus? "??????????": "?????"}</td>
			        <td>${teacher.caddress}</td>
			        <td>${teacher.phone}</td>
			        <td>${teacher.email}</td>
			       	<td><a href="updateTeacher?id=${teacher.id}"><i class="fa fa-pencil" style="color:green"></i></a></td>
			       	<td><a href="delete?id=${teacher.id}"><i class="fa fa-trash-o" style="color:red"></i></a></td>
			      </tr>
		      	</c:forEach>
		    </tbody>
		  </table>
	</c:when>
	<c:when test="${mode == 'MODIFY'}">
		<h2>??????????????????????</h2>
		 <div class="row">
		  	<div class="col-sm-12">
		  		<a class="btn btn-success" href="teachers"><i class="fa fa-mail-reply"></i> ???????????</a>
		  		<br/><br/>
		  	</div>
		  </div>
			<form method="POST" action="">
			<input type="hidden" value="${teacher.id}" name="id" id="id">
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="name">????? (*)</label>
			    <div class="col-sm-4">
			    	<input type="text" required class="form-control form-control-sm" value="${teacher.name}" name="name" id="name">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="gender">??? </label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="gender" id="gender">
				        <option value="false" ${teacher.gender? "" : "selected" }>????</option>
				        <option value="true" ${teacher.gender? "selected" : "" }>?????</option>
				      </select>
			      </div>
			  </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="dob">????????????????</label>
			    <div class="col-sm-4">
			    	<input type="date" class="form-control form-control-sm" value="${teacher.dob}" name="dob" id="dob">
			    </div>
			    <label class="col-form-label col-form-label-sm col-sm-2" for="pob">?????????????</label>
			    <div class="col-sm-4">
			    	<input type="text" class="form-control form-control-sm" value="${teacher.pob}" name="pob" id="pob">
			    </div>
			  </div>
			  <div class="form-group row">
				  <label class="col-form-label col-form-label-sm col-sm-2" for="address">????????????????????</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="address" id="address">${teacher.address}</textarea>
				  </div>
				  <label class="col-form-label col-form-label-sm col-sm-2" for="caddress">??????????????????????????????</label>
				  <div class="col-sm-4">
				  	<textarea class="form-control form-control-sm" rows="3" name="caddress" id="caddress">${teacher.caddress}</textarea>
				  </div>
				</div>
				<div class="form-group row">
			      <label class="col-form-label col-form-label-sm col-sm-2" for="fstatus">??????????????? </label>
			      <div class="col-sm-4">
			      	<select class="form-control form-control-sm" name="fstatus" id="fstatus">
				        <option value="false" ${teacher.fstatus? "" : "selected" }>?????</option>
				        <option value="true" ${teacher.fstatus? "selected" : "" }>??????????</option>
				      </select>
			      </div>
			      <label class="col-form-label col-form-label-sm col-sm-2" for="phone">??????????</label>
				    <div class="col-sm-4">
				    	<input type="text" class="form-control form-control-sm" value="${teacher.phone}" name="phone" id="phone">
				    </div>
		      </div>
			  <div class="form-group row">
			    <label class="col-form-label col-form-label-sm col-sm-2" for="email">???????</label>
			    <div class="col-sm-4">
			    	<input type="email" class="form-control form-control-sm" value="${teacher.email}" name="email" id="email">
			    </div>
			  </div>
			  <div class="form-group row">        
	      		<div class="offset-sm-2 col-sm-10">
	      			<button type="submit" class="btn btn-primary">????????</button>
	      		</div>
	    	</div>
			</form>
	</c:when>
</c:choose>
  
</div>

</body>
</html>
