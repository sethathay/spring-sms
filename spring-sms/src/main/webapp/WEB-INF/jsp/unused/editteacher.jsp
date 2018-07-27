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
      <a class="nav-link" href="/">School Mgt SYSTEM</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/dashboard">Dashboard</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Teachers
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/newTeacher"><i class="fa fa-plus"></i> New Teacher</a>
        <a class="dropdown-item" href="/teachers"><i class="fa fa-bars"></i> List Teachers</a>
      </div>
    </li>
  </ul>
</nav>



<div class="container">
  <h2>Edit Teacher</h2>
	  <form action="/action_page.php">
	  	 <div class="form-group">
		    <label for="name">ID:</label>
		    <input type="text" readOnly=true class="form-control" id="id" value="${teacher.id}">
		  </div>
		  
		  <div class="form-group">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control" id="name" value="${teacher.name}">
		  </div>
		  
		  <div class="form-group">
		    <label for="gender">Gender:</label>
		    <div class="col-sm-offset-2 col-sm-10">
		        <span class="radio">
		          <label class="col-sm-2"><input type="radio" name="gender" value="male" id="male"> Male</label>
		          <label class="col-sm-2"><input type="radio" name="gender" value="female" id="female"> Female</label>
		        </span>
		     </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="dob">Date of Birth:</label>
		    <input type="date" class="form-control" id="dob" value="${teacher.dob}">
		  </div>
		  
		  <div class="form-group">
		    <label for="placeBirth">Place of Birth:</label>
		    <input type="text" class="form-control" id="placeBirth" value="${teacher.pob}">
		  </div>
		  
		  <div class="form-group">
		    <label for="address">Address:</label>
		    <input type="text" class="form-control" id="address" value="${teacher.address}">
		  </div>
		  
		  <div class="form-group">
		    <label for="famStatus">Family Status:</label>
		    <div class="col-sm-offset-2 col-sm-10">
		        <span class="radio">
		          <label class="col-sm-2"><input type="radio" name="famStatus" value="single" id="single"> Single</label>
		          <label class="col-sm-2"><input type="radio" name="famStatus" value="married" id="married"> Married</label>
		          <label class="col-sm-2"><input type="radio" name="famStatus" value="widow" id="widow"> Widow</label>
		          <label class="col-sm-2"><input type="radio" name="famStatus" value="widower" id="widower"> Widower</label>
		        </span>
		     </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="currentAddr">Current Address:</label>
		    <input type="text" class="form-control" id="currentAddr" value="${teacher.caddress}">
		  </div>
		  
		   <div class="form-group">
		    <label for="phoneNo">Phone No:</label>
		    <input type="text" class="form-control" id="phonNo" value="${teacher.phone}">
		  </div>
		  
		   <div class="form-group">
		    <label for="email">Email:</label>
		    <input type="email" class="form-control" id="email" value="${teacher.email}">
		  </div>
		  <button style="background-color: #4CAF50;color:#fff" type="submit" class="btn btn-default" >Submit</button>
	</form>
</div>

</body>
</html>
  