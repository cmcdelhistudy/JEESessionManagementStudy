package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SecondServlet")
public class SecondServlet extends HttpServlet {
	
	String[] fruits={"Orange","Peaches","Avocado","Grapes","Mango"};
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("Inside doGet Method");
		
		String result="";
		
		String fn=request.getParameter("fruitname");
		
		
		for (String f :fruits) {
			if(f.equals(fn)){
				result="Available";
			}
		}
		
		response.getWriter().println(result);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
