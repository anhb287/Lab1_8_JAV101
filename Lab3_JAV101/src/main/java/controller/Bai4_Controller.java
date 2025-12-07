package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/bai4")
public class Bai4_Controller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. Khởi tạo và điền dữ liệu vào Map
        Map<String, Object> map = new HashMap<>();
        map.put("title", "Sử Dụng Hàm Để Cắt Chuỗi");
        
        String Content = 
        "Nội dung bản tin thường rất dài! "
        + "Đây là một chuỗi được tạo ra để đảm bảo rằng nó có độ "
        + "dài vượt quá một trăm (100) ký tự. "
        + "Khi chúng ta thực hiện việc xử lý chuỗi, chúng ta sẽ thấy rằng hàm"
        + " fn:substring sẽ chỉ hiển thị chính xác một trăm ký tự đầu tiên mà thôi. "
        + "Phần còn lại của nội dung sẽ được ẩn đi theo yêu cầu của bài tập này.";
        
        map.put("content", Content);
        req.setAttribute("item", map);
        
        req.getRequestDispatcher("bai4.jsp").forward(req, resp);
    }
	
}
