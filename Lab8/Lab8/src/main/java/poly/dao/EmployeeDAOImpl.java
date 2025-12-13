package poly.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import poly.entity.Employee;
import poly.utils.Jdbc;

public class EmployeeDAOImpl implements EmployeeDAO {

	@Override
	public List<Employee> findAll() {
	    String sql = "SELECT e.*, d.Name AS DeptName " +
	                 "FROM Employees e " +
	                 "JOIN Departments d ON e.DepartmentId = d.Id";
	    try {
	        List<Employee> list = new ArrayList<>();
	        ResultSet rs = Jdbc.executeQuery(sql);
	        while (rs.next()) {
	            Employee e = new Employee(
	                rs.getString("Id"),
	                rs.getString("Password"),
	                rs.getString("Fullname"),
	                rs.getString("Photo"),
	                rs.getBoolean("Gender"),
	                rs.getDate("Birthday"),
	                rs.getDouble("Salary"),
	                rs.getString("DepartmentId")
	            );
	            // Lưu thêm tên phòng vào trường tạm
	            e.setDepartmentName(rs.getString("DeptName"));
	            list.add(e);
	        }
	        return list;
	    } catch (Exception ex) {
	        throw new RuntimeException(ex);
	    }
	}


    @Override
    public Employee findById(String id) {
        String sql = "SELECT * FROM Employees WHERE Id=?";
        try {
            Object[] values = { id };
            ResultSet rs = Jdbc.executeQuery(sql, values);
            if (rs.next()) {
                return new Employee(
                    rs.getString("Id"),
                    rs.getString("Password"),
                    rs.getString("Fullname"),
                    rs.getString("Photo"),
                    rs.getBoolean("Gender"),
                    rs.getDate("Birthday"),
                    rs.getDouble("Salary"),
                    rs.getString("DepartmentId")
                );
            }
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
        throw new RuntimeException("Employee not found: " + id);
    }

    @Override
    public void create(Employee entity) {
        String sql = "INSERT INTO Employees(Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentId) "
                   + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Object[] values = {
                entity.getId(),
                entity.getPassword(),
                entity.getFullname(),
                entity.getPhoto(),
                entity.isGender(),
                new java.sql.Date(entity.getBirthday().getTime()),
                entity.getSalary(),
                entity.getDepartmentId()
            };
            Jdbc.executeUpdate(sql, values);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void update(Employee entity) {
        String sql = "UPDATE Employees SET Password=?, Fullname=?, Photo=?, Gender=?, Birthday=?, Salary=?, DepartmentId=? "
                   + "WHERE Id=?";
        try {
            Object[] values = {
                entity.getPassword(),
                entity.getFullname(),
                entity.getPhoto(),
                entity.isGender(),
                new java.sql.Date(entity.getBirthday().getTime()),
                entity.getSalary(),
                entity.getDepartmentId(),
                entity.getId()
            };
            Jdbc.executeUpdate(sql, values);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public void deleteById(String id) {
        String sql = "DELETE FROM Employees WHERE Id=?";
        try {
            Object[] values = { id };
            Jdbc.executeUpdate(sql, values);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
    
    @Override
    public Employee login(String id, String password) {
        String sql = "SELECT * FROM Employees WHERE Id = ? AND Password = ?";
        try {
            ResultSet rs = Jdbc.executeQuery(sql, id, password);

            if (rs.next()) {
                return new Employee(
                    rs.getString("Id"),
                    rs.getString("Password"),
                    rs.getString("Fullname"),
                    rs.getString("Photo"),
                    rs.getBoolean("Gender"),
                    rs.getDate("Birthday"),
                    rs.getDouble("Salary"),
                    rs.getString("DepartmentId")
                );
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;  
    }

    

}
