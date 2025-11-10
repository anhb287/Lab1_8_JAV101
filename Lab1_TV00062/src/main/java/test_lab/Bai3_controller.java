package test_lab;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bai3")
public class Bai3_controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		
		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI();
		String queryString = req.getQueryString();
		String servletPath = req.getServletPath();
		String contextPath = req.getContextPath();
		String pathInfo = req.getPathInfo();
		String method = req.getMethod();
		
		resp.getWriter().println("<h2> URL: " + url + " </h2>");
		resp.getWriter().println("<h2> URI: " + uri + " </h2>");
		resp.getWriter().println("<h2> Query String: " + queryString + " </h2>");
		resp.getWriter().println("<h2> Servlet Path: " + servletPath + " </h2>");
		resp.getWriter().println("<h2> Context Path: " + contextPath + " </h2>");
		resp.getWriter().println("<h2> Path Info: " + pathInfo + " </h2>");
		resp.getWriter().println("<h2> Method: " + method + " </h2>");
	}
}