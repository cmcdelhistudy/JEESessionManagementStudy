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

/**
 * Servlet implementation class RemoveProductServlet
 */
@WebServlet("/RemoveProductServlet")
public class RemoveProductServlet extends HttpServlet {

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

			int pidInt = Integer.parseInt(pid);

			for (Product p : purchseList) {
				if (p.id == pidInt) {
					purchseList.remove(p);
					break;
				}
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
