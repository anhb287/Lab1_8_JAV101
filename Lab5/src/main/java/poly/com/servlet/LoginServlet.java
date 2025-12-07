package poly.com.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import poly.com.utils.Cookies;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = Cookies.get("username1", request);
		String password = Cookies.get("password1", request);
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		
		if(!username.equals("admin")) {
			request.setAttribute("message", "Username invalid!");
			// Gửi lại trang login nếu thất bại
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
		else if(!password.equals("admin123")){
			request.setAttribute("message", "Password invalid!");
			
			// Gửi lại trang login nếu thất bại
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			
		}
		else {
			// Xử lý logic Cookies
			int hours = (remember==null)?0:1;
			Cookies.add("username1", username, hours, response);
			Cookies.add("password1", password, hours, response);
			
			// CHUYỂN HƯỚNG ĐẾN TRANG INDEX KHI ĐĂNG NHẬP THÀNH CÔNG
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return; 
		}
		
	
	}

}