<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-success navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">School Mgt SYSTEM</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Dashboard</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Teachers
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#"><i class="fa fa-plus"></i> New Teacher</a>
        <a class="dropdown-item" href="#"><i class="fa fa-bars"></i> List Teachers</a>
      </div>
    </li>
  </ul>
</nav>

<div class="container">
  <h2>List Teachers</h2>
  <p>Function of List Teachers: Create, Update, and Delete</p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Date of Birth</th>
        <th>Place of Birth</th>
        <th>Address</th>
        <th>Family Status</th>
        <th>Current Address</th>
        <th>Phone No</th>
        <th>Email Address</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="teacher" items="${teachers}">
	      <tr>
	        <td>${teacher.id}</td>
	        <td>${teacher.name}</td>
	        <td>${teacher.gender? "Male": "Female"}</td>
	        <td>${teacher.dob}</td>
	        <td>${teacher.pob}</td>
	        <td>${teacher.address}</td>
	        <td>${teacher.fstatus? "Married": "Single"}</td>
	        <td>${teacher.caddress}</td>
	        <td>${teacher.phone}</td>
	        <td>${teacher.email}</td>
	      </tr>
      	</c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
