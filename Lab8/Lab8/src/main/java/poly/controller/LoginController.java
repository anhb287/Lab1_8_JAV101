package poly.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.dao.EmployeeDAO;
import poly.dao.EmployeeDAOImpl;
import poly.entity.Employee;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/view/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String password = req.getParameter("password");

        EmployeeDAO dao = new EmployeeDAOImpl();

        String error = null;

        if(id == null || id.isEmpty() || password.isEmpty()) {
            error = "Vui lòng nhập đầy đủ thông tin!";
        }

        Employee emp = null;
        if(error == null) {
            emp = dao.login(id, password);
            if(emp == null) {
                error = "Sai mã nhân viên hoặc mật khẩu!";
            }
        }

        if(error != null) {
            req.setAttribute("error", error);
            req.setAttribute("id", id); 
            req.getRequestDispatcher("/view/Login.jsp").forward(req, resp);
            return;
        }

        req.getSession().setAttribute("user", emp);

        resp.sendRedirect(req.getContextPath());
    }
}
