package controller; 

import Model.Country;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList; // Cần thiết

// Mapping chung để truy cập trang JSP chứa cả hai bài
@WebServlet("/bai1_2") 
public class Bai1_2_Controller extends HttpServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Tạo List<Country> theo yêu cầu đề bài 
        List<Country> list = new ArrayList<>();
        list.add(new Country("VN", "Việt Nam"));
        list.add(new Country("US", "United States"));
        list.add(new Country("CN", "China"));
        
        req.setAttribute("countries", list); 

    	req.getRequestDispatcher("bai1_2.jsp").forward(req, resp);
    }
}