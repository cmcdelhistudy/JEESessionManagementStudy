package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;

@WebServlet("/PurchseServlet")
public class PurchseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String pid = request.getParameter("pid");

		PrintWriter out = response.getWriter();

		HttpSession s = request.getSession(false);

		String code = (String) s.getAttribute("S3CRET");

		if (code == null) {
			out.println("You are not within the session .Please Login");
		} else {

			ArrayList<Product> purchseList = (ArrayList<Product>) s
					.getAttribute("TROLLEY");

			if (pid.equals("1")) {
				Product milk = new Product(1, "Amul Milk", 40, " Drink Healthy");
				purchseList.add(milk);
			} else if (pid.equals("2")) {
				Product bis = new Product(2, "Biscuits", 10, " Crispy");
				purchseList.add(bis);
			} else if (pid.equals("3")) {
				Product maggie = new Product(3, " Sumit Maggie", 20,
						"  Sumit Ki Maggi");
				purchseList.add(maggie);
			} else if (pid.equals("4")) {
				Product veg = new Product(4, "Vegetables", 30, " Veggies");
				purchseList.add(veg);
			}

			request.getRequestDispatcher("shopping.jsp").forward(request,
					response);

		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
