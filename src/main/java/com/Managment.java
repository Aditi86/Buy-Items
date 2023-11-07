package com;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddItems
 */
@WebServlet("/Managment")
public class Managment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/?user=be24604c135228";
	private static final String USER = "be24604c135228";
	private static final String PASS = "4bd62592";
	private String firstName = "";
	private String lastName = "";
	private String email = "";
	private String phone = "";
    
	
    public Managment() {
        super();
    }
	
    HashMap<String, Integer> selectedItems = new HashMap<String, Integer>();



	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession sess = request.getSession();
		
		sess.setAttribute("first_Name", firstName);
		sess.setAttribute("last_Name", lastName);
		sess.setAttribute("email_", email);
		sess.setAttribute("phone_", phone);
		
		

		
		if(request.getParameter("submit").equalsIgnoreCase("Add"))
		{
			addItem(request, response);
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Request Order"))
		{
			response.sendRedirect("BuyerInfo.jsp");
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Delete"))
		{
			String key = request.getParameter("itemIndex");	
			selectedItems.remove(key);
			
			sess.setAttribute("selectedItem", selectedItems);
			response.sendRedirect("ItemSelection.jsp");

		}
		else if(request.getParameter("submit").equalsIgnoreCase("Next"))
		{
			buyerDetail(request, response);
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Change Your Information"))
		{
			response.sendRedirect("BuyerInfo.jsp");
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Confirm"))
		{
			Confirm(request, response);
		}
		else if(request.getParameter("submit").equalsIgnoreCase("Change Your Items"))
		{
			response.sendRedirect("ItemSelection.jsp");
		}
		
	}
	
	protected void addItem(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		HttpSession sess = request.getSession();	
		
		if(request.getParameter("submit").equalsIgnoreCase("Add"))
		{
			String itemName = request.getParameter("itemSelect");
			String quantity = request.getParameter("quantity");
			
			
			if(!itemName.isEmpty() && !quantity.isEmpty() && Integer.parseInt(quantity) >0)	
			{
				int amount = Integer.parseInt(quantity);
				
				if(!selectedItems.isEmpty()) 
				{
					if(selectedItems.containsKey(itemName))
					{
						
						
						int value = selectedItems.get(itemName);
						selectedItems.put(itemName, value+amount);

					}
					else
					{
						selectedItems.put(itemName, amount);

					}
				}
				else
				{
					selectedItems.put(itemName, amount);
				}
				sess.setAttribute("selectedItem", selectedItems);
				response.sendRedirect("ItemSelection.jsp");
			}
			else
			{

				sess.setAttribute("selectedItem", selectedItems);
				response.sendRedirect("ItemSelection.jsp");

			}
			
			
	    }

	}
	
	protected void buyerDetail(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		HttpSession sess = request.getSession();
		String center = request.getParameter("center");
		firstName = request.getParameter("firstName");
		lastName = request.getParameter("lastName");
		email = request.getParameter("email");
		phone = request.getParameter("phone");
		
		sess.setAttribute("center_Name", center);
		sess.setAttribute("first_Name", firstName);
		sess.setAttribute("last_Name", lastName);
		sess.setAttribute("email_", email);
		sess.setAttribute("phone_", phone);
				
		response.sendRedirect("Confirmation.jsp");
	
	}
	
	protected void Confirm(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException
	{
		HttpSession sess = request.getSession();

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			Statement stmt = con.createStatement();
			
			String centerName = (String)sess.getAttribute("center_Name");
    		firstName = (String)sess.getAttribute("first_Name");
    		lastName = (String)sess.getAttribute("last_Name");
    		email = (String)sess.getAttribute("email_");
    		phone = (String)sess.getAttribute("phone_");


    		String key = "";
    		int value = 0;
    		
    		String sql = "";
    		String sql2 = "";
        	if(selectedItems != null)
        	{
        		for (Map.Entry<String, Integer> entry : selectedItems.entrySet()) 
        		{
        			key = entry.getKey();
        		    value = entry.getValue();

        		    
        			sql = "INSERT INTO heroku_4b3d727ef4a8c29.buyers(Center, First_Name, Last_Name, Email, Phone, Ordered_Item, Ordred_Quantity)"
        					+ "VALUES('"+centerName+"','"+firstName+"','"+lastName+"','"+email+"','"+phone+"','"+key+"','"+value+"');";
        			
        		    
        			sql2 = "UPDATE heroku_4b3d727ef4a8c29.items SET  Item_Quantity = Item_Quantity - '"+value+"' WHERE Item_Name = '"+key+"'";
        			
        			stmt.executeUpdate(sql);
        			stmt.executeUpdate(sql2);

        		}
        	}
    					
			con.close();
			stmt.close();
			
			selectedItems.clear();
			
			firstName = "";
			lastName = "";
			email = "";
			phone = "";

			sess.setAttribute("first_Name", firstName);
			sess.setAttribute("last_Name", lastName);
			sess.setAttribute("email_", email);
			sess.setAttribute("phone_", phone);

			sess.invalidate();
			response.sendRedirect("Message.jsp");
			
			
		}catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	
}
