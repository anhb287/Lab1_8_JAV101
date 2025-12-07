package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import Model.CartItem;

@WebServlet("/cartController")
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin sản phẩm
        String id = request.getParameter("productId");
        String name = request.getParameter("productName");
        String priceStr = request.getParameter("productPrice");
        double price = 0;
        if(priceStr != null && !priceStr.isEmpty()){
            price = Double.parseDouble(priceStr);
        }

        String action = request.getParameter("action"); // Có thể là "delete" hoặc null

        HttpSession session = request.getSession();
        Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
        if(cart == null){
            cart = new HashMap<>();
        }

        if("delete".equals(action)){
            // Xóa sản phẩm khỏi giỏ hàng
            if(cart.containsKey(id)){
                cart.remove(id);
            }
            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp"); // về trang giỏ hàng
            return;
        }

        // Thêm vào giỏ hàng bình thường
        if(cart.containsKey(id)){
            CartItem item = cart.get(id);
            item.setQuantity(item.getQuantity() + 1);
        } else {
            cart.put(id, new CartItem(id, name, price, 1));
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("shop.jsp"); // về trang shop
    }
}
