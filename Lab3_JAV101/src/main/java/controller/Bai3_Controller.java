package controller; 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/bai3") 
public class Bai3_Controller extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Tạo Map<String, Object> theo yêu cầu
        Map<String, Object> map = new HashMap<>();
        map.put("name", "iPhone 2024");
        map.put("price", 12345.678); 
        map.put("date", new Date());
        
        req.setAttribute("item", map);

    	req.getRequestDispatcher("bai3.jsp").forward(req, resp);
    }
}