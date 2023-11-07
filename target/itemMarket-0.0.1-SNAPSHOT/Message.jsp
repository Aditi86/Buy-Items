<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request Submitted</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<Style>
.center-container {
  display: flex;
  justify-content: center;
  align-items: center;

}


</Style>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  	<div class="container-fluid">
	  	
		    <a class="navbar-brand" href="#">
		    	<button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      			<span class="navbar-toggler-icon"></span>
	    		</button>
		    </a>
		    
		    <div class="collapse navbar-collapse" id="navbarNav">
			    <ul class="navbar-nav">
			    
			        <li class="nav-item">
			          <a class="nav-link" aria-current="page">Step 1: Item Selection</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" aria-disabled="true">Step 2: Information</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link active" aria-disabled="true">Step 3: Confirmation</a>
			        </li>
			        
			    </ul>
		   </div>
		   
	  	</div>	
	</nav>

		<br><br>

		<form action="ItemSelection.jsp">
	    <h4 Style = "text-align: Center"> Your order has been received. Someone from Mandir will reach out to you. </h4> <br>
	    <div class="center-container">
	    <input type="submit" value="     OK     " name="goBack" class="btn btn-primary mb-2">
	    </div>
	    </form>
	
        	
</body>
</html>