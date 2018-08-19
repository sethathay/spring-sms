<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<%@ include file="header.jsp" %>
  
</head>
<body>

<%@ include file="navigation.jsp" %>

<div class="container">
  <h2>ទំព័រដើម</h2>
  <p><i>អ្នកអាចមើលព៌តមានសង្ខេបរបស់ប្រព័ន្ធទាំងមូលបានដូចខាងក្រោម</i></p>
  
  <div class="row">
    <div class="col-lg-3 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">ចំនួនគ្រូបង្រៀនសរុប</div>
          <div class="circle-tile-number text-faded ">${countTeachers}</div>
          <a class="circle-tile-footer" href="/teachers">More Info<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
     
    <div class="col-lg-3 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-address-card-o fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded">ចំនួនសិស្សសរុប</div>
          <div class="circle-tile-number text-faded ">${countStudents}</div>
          <a class="circle-tile-footer" href="/students">More Info<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading green"><i class="fa fa-language fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content green">
          <div class="circle-tile-description text-faded">ចំនួនវគ្គបណ្តុះបណ្តាលសរុប</div>
          <div class="circle-tile-number text-faded ">${countCourses}</div>
          <a class="circle-tile-footer" href="/courses">More Info<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div>
    <div class="col-lg-3 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading blue"><i class="fa fa-book fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content blue">
          <div class="circle-tile-description text-faded">ចំនួនមុខវិជ្ជាសរុប</div>
          <div class="circle-tile-number text-faded ">${countSubjects}</div>
          <a class="circle-tile-footer" href="/subjects">More Info<i class="fa fa-chevron-circle-right"></i></a>
        </div>
      </div>
    </div> 
  </div>
   
</div>

</body>
</html>
  