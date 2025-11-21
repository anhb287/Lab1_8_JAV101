package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/calculate", "/calculate/add", "/calculate/sub", "/calculate/mul", "/calculate/div", "/bai2"})
public class bai2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Thiết lập thông báo mặc định cho trang JSP
		req.setAttribute("message", "Nhập vào 2 số và bấm phép tính");
		// Chuyển hướng đến trang JSP để hiển thị form
		req.getRequestDispatcher("/bai2.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy giá trị từ form
		String aInput = req.getParameter("a");
		String bInput = req.getParameter("b");
		
		// 1. Xử lý lỗi: Kiểm tra đầu vào rỗng
		if (aInput == null || aInput.isBlank() || bInput == null || bInput.isBlank()) {
			req.setAttribute("message", "Bạn phải nhập đủ 2 số");
			req.getRequestDispatcher("/bai2.jsp").forward(req, resp);
			return;
		}
		
		String uri = req.getRequestURI();
		int a = 0;
		int b = 0;
		double result = 0; // Dùng double cho phép chia để có thể xử lý số thập phân
		String operator = "";
		
		try {
			// 2. Xử lý lỗi: Chuyển đổi chuỗi thành số
			a = Integer.parseInt(aInput);
			b = Integer.parseInt(bInput);
			
			// 3. Thực hiện phép tính dựa trên URI
			if (uri.contains("add")) {
				result = a + b;
				operator = "+";
			} else if (uri.contains("sub")) {
				result = a - b;
				operator = "−"; // Ký tự trừ đẹp hơn
			} else if (uri.contains("mul")) {
				result = a * b;
				operator = "×"; // Ký tự nhân đẹp hơn
			} else if (uri.contains("div")) {
				// 4. Xử lý lỗi: Chia cho 0
				if (b == 0) {
					req.setAttribute("message", "Không thể chia cho số 0");
					req.getRequestDispatcher("/bai2.jsp").forward(req, resp);
					return;
				}
				result = (double) a / b; // Ép kiểu để kết quả là số thập phân
				operator = "÷"; // Ký tự chia đẹp hơn
			}
			
			// 5. Thiết lập thông báo kết quả
			// Sử dụng String.format để hiển thị kết quả chính xác cho phép chia và số nguyên cho các phép tính khác
			String resultString;
			if (operator.equals("÷")) {
				resultString = String.format("%.2f", result); // Làm tròn 2 chữ số thập phân cho phép chia
			} else {
				resultString = String.valueOf((int)result);
			}
			
			req.setAttribute("message", "Kết quả của phép tính " + a + " " + operator + " " + b + " là: " + resultString);
			
			// Chuyển hướng trở lại trang JSP
			req.getRequestDispatcher("/bai2.jsp").forward(req, resp);
			return;
			
		} catch (NumberFormatException ex) {
			// 6. Xử lý lỗi: Không phải là số
			req.setAttribute("message", "Bạn phải nhập định dạng số hợp lệ");
			req.getRequestDispatcher("/bai2.jsp").forward(req, resp);
			return;
		}
	}	
}