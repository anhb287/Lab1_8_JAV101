package poly.com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import poly.com.dao.EmployeeDAO;
import poly.com.model.EmployeeModel;

import java.io.IOException;
import java.util.List;
import java.sql.Date;
import java.math.BigDecimal;

@WebServlet({
        "/employee",
        "/employee/list",
        "/employee/add",
        "/employee/edit",
        "/employee/delete"
})
public class EmployeeController extends HttpServlet {

    private EmployeeDAO employeeDAO;
    private final String JSP_PAGE = "/Employee/Employee.jsp";

    @Override
    public void init() throws ServletException {
        this.employeeDAO = new EmployeeDAO();
    }

    private String getAction(HttpServletRequest request) {
        String servletPath = request.getServletPath();
        return servletPath.substring(servletPath.lastIndexOf("/") + 1);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = getAction(request);

        // Lấy thông báo từ session nếu có
        HttpSession session = request.getSession();
        Object message = session.getAttribute("message");
        Object error = session.getAttribute("error");

        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message");
        }

        if (error != null) {
            request.setAttribute("error", error);
            session.removeAttribute("error");
        }

        try {
            switch (action) {
                case "add":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                case "list":
                case "employee":
                default:
                    listEmployee(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Lỗi doGet: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = getAction(request);

        try {
            switch (action) {
                case "add":
                    insertEmployee(request, response);
                    break;
                case "edit":
                    updateEmployee(request, response);
                    break;
                default:
                    listEmployee(request, response);
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("employee", buildEmployeeFromRequest(request));
            request.getRequestDispatcher(JSP_PAGE).forward(request, response);
        }
    }

    private EmployeeModel buildEmployeeFromRequest(HttpServletRequest request) {
        EmployeeModel emp = new EmployeeModel();

        try {
            String ma = request.getParameter("maNhanVien");
            if (ma != null && !ma.isEmpty()) emp.setMaNhanVien(Integer.parseInt(ma));
        } catch (Exception ignored) {}

        emp.setHo(request.getParameter("ho"));
        emp.setTen(request.getParameter("ten"));
        emp.setEmail(request.getParameter("email"));
        emp.setSoDienThoai(request.getParameter("sdt"));
        emp.setChucDanh(request.getParameter("chucDanh"));
        emp.setIdPhongBan(request.getParameter("idPhongBan"));

        String ngay = request.getParameter("ngayVaoLam");
        if (ngay != null && !ngay.isEmpty()) {
            emp.setNgayVaoLam(Date.valueOf(ngay));
        }

        String luong = request.getParameter("luong");
        if (luong != null && !luong.isEmpty()) {
            emp.setLuong(new BigDecimal(luong));
        }

        return emp;
    }

    // LIST
    private void listEmployee(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        List<EmployeeModel> list = employeeDAO.getAllEmployees();
        request.setAttribute("listEmployee", list);

        request.getRequestDispatcher(JSP_PAGE).forward(request, response);
    }

    // SHOW NEW FORM
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setAttribute("employee", null);
        listEmployee(request, response);
    }

    // SHOW EDIT FORM
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String id = request.getParameter("id");
        if (id == null) throw new ServletException("Thiếu ID khi chỉnh sửa.");

        EmployeeModel emp = employeeDAO.getEmployeeById(Integer.parseInt(id));

        if (emp == null)
            throw new ServletException("Không tìm thấy nhân viên ID: " + id);

        request.setAttribute("employee", emp);
        listEmployee(request, response);
    }

    // INSERT
    private void insertEmployee(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        EmployeeModel emp = buildEmployeeFromRequest(request);

        if (emp.getNgayVaoLam() == null)
            throw new IllegalArgumentException("Ngày vào làm không được để trống.");

        employeeDAO.addEmployee(emp);

        request.getSession().setAttribute("message", "Thêm nhân viên thành công!");

        response.sendRedirect(request.getContextPath() + "/employee/list");
    }

    // UPDATE
    private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        EmployeeModel emp = buildEmployeeFromRequest(request);

        if (emp.getMaNhanVien() == 0)
            throw new IllegalArgumentException("Thiếu mã nhân viên.");

        employeeDAO.updateEmployee(emp);

        request.getSession().setAttribute("message", "Cập nhật nhân viên thành công!");

        response.sendRedirect(request.getContextPath() + "/employee/list");
    }

    // DELETE
    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String id = request.getParameter("id");
        if (id == null)
            throw new ServletException("Thiếu ID để xóa.");

        int maNV = Integer.parseInt(id);

        employeeDAO.deleteEmployee(maNV);

        request.getSession().setAttribute("message", "Xóa nhân viên thành công!");

        response.sendRedirect(request.getContextPath() + "/employee/list");
    }
}
