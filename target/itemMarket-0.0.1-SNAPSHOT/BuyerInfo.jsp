<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Item Selection</title>

</head>

<style>
@media (max-width: 768px) {
  .custom-toggler {
    position: absolute;
    right: 10px;
    top: 30%;
  }
}


</style>

<body>
<!-- --------------------------------------------------------- NAV BAR Starts -----------------------------------------------------  -->
    <%
		HttpSession sess = request.getSession();

    %>
    
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
		          <a class="nav-link" aria-disabled="true">Step 1: Item Selection</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page">Step 2: Information</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" aria-disabled="true">Step 3: Confirmation</a>
		        </li>
		      </ul>
	    	</div>
  		</div>
  		
	</nav>
	
<!-- ------------------------------------------------------------- User Form -----------------------------------------------------  -->

	<div class = "container mt-5">
		<h4>Please enter your details here</h4> <br>

		<form action = "Managment" method = "post" class = "row g-3">
		
			<div class = "col-sm-4"> 
				<label for="SelectCenter" class= "form-label"> Select Center </label>
				<select class="form-select" aria-label="Default select example" name = "center" id="centerSelect"  required>
					<option value="Edison">Edison</option>
				    <option value="Cherry Hill">Cherry Hill</option>
				    <option value="Atlantic City">Atlantic City</option>
				    <option value="North Bergen">North Bergen</option>
				    <option value="Parsippany">Parsippany</option>
				   	<option value="Robbinsville">Robbinsville</option>
				  
				    
				</select>
			</div>
			
			<div class = "col-md-4">
				<label for="firstName" class= "form-label"> First Name </label>
				<input type = "text" class = "form-control" value = "<%= sess.getAttribute("first_Name") %>" name = "firstName" required>
			</div>
			
			<div class = "col-md-4">
				<label for="Last Name" class= "form-label"> Last Name </label>
				<input type = "text" class = "form-control" value = "<%= sess.getAttribute("last_Name")%>" name = "lastName" required>
			</div>
			
			<div class = "col-md-6">
				<label for="emailInfo" class= "form-label"> E-mail </label>
				<input type = "email" class = "form-control" value = "<%= sess.getAttribute("email_")%>" name = "email" required>
			</div>
			
			<div class = "col-md-6">
				<label for="phoneNumber" class= "form-label"> Phone Number </label>
				<input type = "tel" class = "form-control" value = "<%= sess.getAttribute("phone_")%>"  name = "phone"  placeholder = "+1(415)867-5309"required>
			</div>
			
    		<div class="col-md-6">
        		<input type="submit" value="Next" name="submit"  style=" align: right; padding: 10px 20px; background-color: #0000FF; color: #fff; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">
    		</div>
			
			
		</form>
	</div>
	<script>
	  // Function to load the selected value from localStorage
	  function loadSelectedValue() {
	    const centerSelect = document.getElementById('centerSelect');
	    const selectedValue = localStorage.getItem('selectedCenter');

	    if (selectedValue) {
	      centerSelect.value = selectedValue;
	    }
	  }

	  // Function to handle the change event of the select element
	  function handleSelectChange() {
	    const centerSelect = document.getElementById('centerSelect');
	    const selectedValue = centerSelect.value;
	    localStorage.setItem('selectedCenter', selectedValue);
	  }

	  // Call the loadSelectedValue function when the page loads
	  window.onload = loadSelectedValue;

	  // Add an event listener to the select element
	  const centerSelect = document.getElementById('centerSelect');
	  centerSelect.addEventListener('change', handleSelectChange);
	</script>


</body>
</html>