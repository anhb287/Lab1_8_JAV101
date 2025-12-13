package poly.dao;

import java.util.List;

import poly.entity.Department;
import poly.entity.Employee;

public interface EmployeeDAO {
	
	List<Employee> findAll();
		
	Employee findById(String id);
	
	void create(Employee item);
	void update(Employee item);
	void deleteById(String id);
	
	Employee login(String id, String password);

	

}
