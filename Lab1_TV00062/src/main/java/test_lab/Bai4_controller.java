package test_lab;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/bai4", "/nv/insert", "/nv/update", "/nv/delete", "/nv/find"})
public class Bai4_controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("bai4.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = req.getRequestURI();
		
		if(url.contains("/nv/insert")) {
			resp.getWriter().println("<h1> Insert data </h1>");
		}
		else if(url.contains("/nv/update")) {
			resp.getWriter().println("<h1> Update data </h1>");
		}
		else if(url.contains("/nv/delete")) {
			resp.getWriter().println("<h1> Delete data</h1>");
		}
		else  {
			resp.getWriter().println("<h1> Find </h1>");
		}
	}
}