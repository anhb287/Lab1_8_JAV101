package poly.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import poly.dao.DepartmentDAO;
import poly.dao.DepartmentDAOImpl;
import poly.dao.EmployeeDAO;
import poly.dao.EmployeeDAOImpl;
import poly.entity.Department;
import poly.entity.Employee;

@WebServlet({
    "/employee",
    "/employee/edit/*",
    "/employee/create",
    "/employee/update",
    "/employee/delete",
    "/employee/reset",
    "/employee/search"
})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, 
    maxFileSize = 5 * 1024 * 1024,  
    maxRequestSize = 10 * 1024 * 1024 
)
public class EmployeeController extends HttpServlet {

    private final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeDAO dao = new EmployeeDAOImpl();
        DepartmentDAO deptDao = new DepartmentDAOImpl();
        
        Employee item = new Employee();
        String path = req.getServletPath();
        
        List<Employee> list = dao.findAll();
        
        if (path.contains("search")) {
            String searchId = req.getParameter("searchId");

            if (searchId != null && !searchId.isEmpty()) {
                try {
                    item = dao.findById(searchId);  
                } catch (Exception e) {
                    req.setAttribute("error", "Không tìm thấy nhân viên!");
                }
            }
            
            if (item != null && item.getPhoto() != null && !item.getPhoto().isEmpty()) {
                item.setPhoto(req.getContextPath() + "/uploads/" + item.getPhoto());
            }

        } 
        else if (path.contains("edit") && req.getPathInfo() != null && req.getPathInfo().length() > 1) {
            String id = req.getPathInfo().substring(1);
            item = dao.findById(id);

            if (item != null && item.getPhoto() != null && !item.getPhoto().isEmpty()) {
                item.setPhoto(req.getContextPath() + "/uploads/" + item.getPhoto());
            }

        }
        
        List<Department> departments = deptDao.findAll();
        for (Employee e : list) {
            for (Department d : departments) {
                if (d.getId().equals(e.getDepartmentId())) {
                    e.setDepartmentName(d.getName());
                    break;
                }
            }
        }

        req.setAttribute("item", item);
        req.setAttribute("list", list);
        req.setAttribute("departments", departments);

        req.getRequestDispatcher("/view/Employee.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeDAO dao = new EmployeeDAOImpl();
        DepartmentDAO deptDao = new DepartmentDAOImpl();

        Employee form = new Employee();
        try {
        	DateConverter dc = new DateConverter();
        	dc.setPattern("yyyy-MM-dd");
        	ConvertUtils.register(dc, java.util.Date.class);
            BeanUtils.populate(form, req.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        
        String path = req.getServletPath();
        String error = null;
        
        if (form.getId() == null || form.getId().isEmpty() ||
                form.getFullname() == null || form.getFullname().isEmpty() ||
                form.getPassword() == null || form.getPassword().isEmpty() ||
                form.getDepartmentId() == null || form.getDepartmentId().isEmpty()) {
        	
                error = "Vui lòng nhập đầy đủ thông tin!";
        }
        
        
        if (error == null && path.contains("create")) {
            try {
                Employee existing = dao.findById(form.getId());
                if (existing != null) {
                    error = "Mã nhân viên đã tồn tại!";
                }
            } catch (Exception e) {
                // Không có trong DB → OK
            }
        }
        
        if (error == null) {
            try {
                if (form.getSalary() < 0) {
                    error = "Lương phải là số dương!";
                }
            } catch (Exception e) {
                error = "Lương phải là số!";
            }
        }
        
        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("item", form);

            List<Employee> list = dao.findAll();
            List<Department> departments = deptDao.findAll();

            for (Employee e : list) {
                for (Department d : departments) {
                    if (d.getId().equals(e.getDepartmentId())) {
                        e.setDepartmentName(d.getName());
                        break;
                    }
                }
            }

            req.setAttribute("list", list);
            req.setAttribute("departments", departments);

            req.getRequestDispatcher("/view/Employee.jsp").forward(req, resp);
            return; 
        }
        
        Employee current = null;
        if (form.getId() != null && !form.getId().isEmpty()) {
            try {
                current = dao.findById(form.getId());
            } catch (Exception e) {
                // không tìm thấy → tạo mới
            }
        }

        Part part = req.getPart("photo");
        if (part != null && part.getSize() > 0) {
            String fileName = new File(part.getSubmittedFileName()).getName();
            String uploadPath = req.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            part.write(uploadPath + File.separator + fileName);
            form.setPhoto(fileName);
        } else {
            if (current != null) {
                form.setPhoto(current.getPhoto());
            }
        }

        if (path.contains("create")) {
            dao.create(form);
        } else if (path.contains("update")) {
            dao.update(form);
        } else if (path.contains("delete")) {
            dao.deleteById(form.getId());
        } else if (path.contains("reset")) {
            form = new Employee();
        }

        resp.sendRedirect(req.getContextPath() + "/employee");
    }
}
