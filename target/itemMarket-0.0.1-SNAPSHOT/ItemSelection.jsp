<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %>
    <%@ page import="com.Item" %>
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

	<%
	//
		HttpSession sess = request.getSession();
//*************************************************************************Change the URL and password for database **********************************************************************
		final String URL = "jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/?user=be24604c135228";
		final String USER = "be24604c135228";
		final String PASS = "4bd62592";
	    HashMap<String, Integer> quantity = new HashMap<String, Integer>();

	
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			Statement stmt = con.createStatement();
			
			String itemName; 
			
			String query = "SELECT Item_Name, Item_Quantity FROM heroku_4b3d727ef4a8c29.items";
		    ResultSet resultSet = stmt.executeQuery(query);
		    
		    // Iterate through the result set and populate the HashMap
		    while (resultSet.next()) {
		        itemName = resultSet.getString("Item_Name");
		        int itemQuantity = resultSet.getInt("Item_Quantity");
		        quantity.put(itemName, itemQuantity);
		        
		        itemName=null;
		        }
		    
		    resultSet.close();
			con.close();
			stmt.close();
			
			
		}catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}


		
	%>
    
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
			          <a class="nav-link active" aria-current="page">Step 1: Item Selection</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" aria-disabled="true">Step 2: Information</a>
			        </li>
			        
			        <li class="nav-item">
			          <a class="nav-link" aria-disabled="true">Step 3: Confirmation</a>
			        </li>
			        
			    </ul>
		   </div>
		   
	  	</div>	
	</nav>
		
	<!-- ------------------------------------------------------------- User Form -----------------------------------------------------  -->
	
</head>
<body>

    <div class="container mt-5">
    <div class="row">
        <!-- Left column for content -->
        <div class="col-md-7">
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
        <div class="col-md-5">
        	<h4 Style = "text-align: Center">Please select items to buy</h4> <br>
            <form action="Managment" method="Post" class="bg-light p-3">
                <!-- Your form fields go here -->
                <div class="mb-3">
                    <label for="SelectCenter" class="form-label">Select Item</label>
                    <select class="form-select" aria-label="Default select example" name = "itemSelect" ID = "SelectedItem">
                    <option value="">Select</option>
                    
                    
                    <%
                   		 if(quantity != null)
                		{
	                		int i = 0;
	                		for (Map.Entry<String, Integer> entry : quantity.entrySet()) 
	                		{%>
	                		     <option value="<%= entry.getKey()%>"><%= entry.getKey() %>  || Available: <%= entry.getValue() %></option>
	                		
	                	
	                		<%
	                		} 
	                	}
                    %>
     
                    </select>
                </div>
				
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" >
                </div>

                <div class="d-grid">
                	
                    <input type="submit" value="Add" name="submit" class="btn btn-primary mb-2">
                    <input type="submit" value="Request Order" name="submit" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
</div>




</body>
</html>





