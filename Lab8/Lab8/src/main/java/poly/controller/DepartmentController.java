package poly.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.dao.DepartmentDAO;
import poly.dao.DepartmentDAOImpl;
import poly.entity.Department;

@WebServlet({
	"/department",
	"/department/edit/*",
	"/department/create",
	"/department/update",
	"/department/delete",
	"/department/reset",
	"/department/search"
})
public class DepartmentController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		DepartmentDAO dao = new DepartmentDAOImpl();
        Department item = new Department();

        String path = req.getServletPath();
        
        List<Department> list = dao.findAll();
        
        if(path.contains("search")) {
        	String searchId = req.getParameter("searchId");
        	
        	if(searchId != null && !searchId.isEmpty()) {
        		try {
					item = dao.findById(searchId);
				} catch (Exception e) {
					req.setAttribute("error", "Không tìm thấy phòng ban!");
				}
        	}
        	
        }
        else if (path.contains("edit")) {
            if (req.getPathInfo() != null && req.getPathInfo().length() > 1) {
                String id = req.getPathInfo().substring(1);
                item = dao.findById(id);
            }
        }
				
		req.setAttribute("list", list);	
		req.setAttribute("item", item);
		req.getRequestDispatcher("/view/Department.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Department form = new Department();
		
		 try {
	            BeanUtils.populate(form, req.getParameterMap());
	     } catch (Exception e) {
	            e.printStackTrace();
	     }
		 
		 DepartmentDAO dao = new DepartmentDAOImpl();
		 String path = req.getServletPath();
		 
		 String error = null;
		 if (form.getId() == null || form.getId().isEmpty()
			        || form.getName() == null || form.getName().isEmpty()
			        || form.getDescription() == null || form.getDescription().isEmpty()) {

			        error = "Vui lòng nhập đầy đủ thông tin!";
			    }
		 
		 
		 if (error == null && path.contains("create")) {
		        try {
		            Department exist = dao.findById(form.getId());
		            if (exist != null) {
		                error = "Mã phòng ban đã tồn tại!";
		            }
		        } catch (Exception e) {}
		    }
		 
		 if (error != null) {
		        req.setAttribute("error", error);
		        req.setAttribute("item", form);        
		        req.setAttribute("list", dao.findAll());
		        req.getRequestDispatcher("/view/Department.jsp").forward(req, resp);
		        return; 
		    }
		 
		 if (path.contains("create")) {
		        dao.create(form);
		 } 
		 else if (path.contains("update")) {
		        dao.update(form);
		 } 
		 else if (path.contains("delete")) {
		        dao.deleteById(form.getId());
		 }
		 
		 resp.sendRedirect(req.getContextPath() + "/department");
		
	}


}
