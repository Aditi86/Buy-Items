<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.util.*" %>
     <%@ page import="com.Item" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
			          <a class="nav-link" aria-current="page" >Step 1: Item Selection</a>
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
	
<!-- ------------------------------------------------------------- User Form -----------------------------------------------------  -->
	
	<div class="container mt-5">
    <div class="row">
        <!-- Left column for content -->
        <div class="col-md-8">
            <h5 Style = "text-align: Center">Selected Items</h5>
            <table class="table">
			  
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">Item</th>
			      <th scope="col">Quantity</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  
            <%
    			HttpSession sess = request.getSession();

           		HashMap<String, Integer> selectedItems = (HashMap<String, Integer>)sess.getAttribute("selectedItem");
            	if(selectedItems != null)
            	{
            		int i = 0;
            		for (Map.Entry<String, Integer> entry : selectedItems.entrySet()) 
            		{
            			i++;
            		    String key = entry.getKey();
            		    int value = entry.getValue();
            		    // you code here
            		
                %>
    		            <tbody>
    					    <tr>
    					      <th scope="row"><%= i%></th>
    					      <td><%= key %> </td>
    					      <td><%= value %></td>
    					      <td>
    					      <form action = "AddItemServlet" method = "Post">
    					        <input type="hidden" name="itemIndex" value="<%= key %>">
    					      	<input type="submit" value="Delete" name="submit" class="btn btn-danger mb-2">
    					      </form>
    					      
    					      </td>
    					    </tr>
    					    
    					  </tbody>
            	<% } %>
    			 
            <%}%>
            	
			</table>
			
            
        </div>

        <!-- Right column for form -->
        <div class="col-md-4">
        
        	<h4 Style = "text-align: Center">You will be reached once you confirm.</h4> <br>
        	
        	<% 
     
        		String centerName = (String)sess.getAttribute("center_Name");
        		String firstName = (String)sess.getAttribute("first_Name");
        		String lastName = (String)sess.getAttribute("last_Name");
        		String email = (String)sess.getAttribute("email_");
        		String phone = (String)sess.getAttribute("phone_");
        	%>
            <form action="Managment" method="Post" class="bg-light p-3">
                <!-- Your form fields go here -->
                <div class="mb-3">
                	<p>Your Center: <%= centerName %> </p>
                	<p>First Name: <%= firstName +" "+ lastName%> </p>
                	<p>Email: <%= email %> </p>
                	<P>Phone: <%= phone %> </P>
                    
                </div>
                <div class="d-grid">
                	
                    <input type="submit" value="Change Your Information" name="submit" class="btn btn-primary mb-2">
                    <input type="submit" value="Change Your Items" name="submit" class="btn btn-primary mb-2">
                    <input type="submit" value="Confirm" name="submit" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
</div>
	
	
	
	
</body>
</html>