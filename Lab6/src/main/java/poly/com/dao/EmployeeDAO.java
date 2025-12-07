package poly.com.dao; 

import poly.com.model.EmployeeModel; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;
// Giả định Connectdao là lớp chứa getConnection()
public class EmployeeDAO extends Connectdao {
    
    // Phương thức ánh xạ ResultSet sang EmployeeModel
    private EmployeeModel mapResultSetToEmployee(ResultSet rs) throws SQLException {
        EmployeeModel emp = new EmployeeModel();
        
        emp.setMaNhanVien(rs.getInt("Ma_Nhan_Vien"));
        emp.setTen(rs.getString("Ten"));
        emp.setHo(rs.getString("Ho"));
        emp.setEmail(rs.getString("Email"));
        emp.setSoDienThoai(rs.getString("So_Dien_Thoai"));
        emp.setNgayVaoLam(rs.getDate("Ngay_Vao_Lam"));
        emp.setChucDanh(rs.getString("Chuc_Danh"));
        emp.setLuong(rs.getBigDecimal("Luong"));
        
        // --- ĐÃ XÓA Ma_Quan_Ly khỏi ánh xạ ---
        // emp.setMaQuanLy(null);
        
        emp.setIdPhongBan(rs.getString("id")); // Giả định idPhongBan tương ứng với cột 'id'
        return emp;
    }
    
    // 1. CREATE: Thêm nhân viên mới
    // BỎ Ma_Nhan_Vien và Ma_Quan_Ly khỏi SQL
    public void addEmployee(EmployeeModel emp) throws Exception {
        String SQL = "INSERT INTO employee (Ten, Ho, Email, So_Dien_Thoai, Ngay_Vao_Lam, Chuc_Danh, Luong, id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
        
        try (Connection conn = Connectdao.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setString(1, emp.getTen());
            pstmt.setString(2, emp.getHo());
            pstmt.setString(3, emp.getEmail());
            pstmt.setString(4, emp.getSoDienThoai());
            pstmt.setDate(5, emp.getNgayVaoLam());
            pstmt.setString(6, emp.getChucDanh());
            
            // Xử lý Lương (Có thể NULL)
            if (emp.getLuong() != null) {
                pstmt.setBigDecimal(7, emp.getLuong());
            } else {
                pstmt.setNull(7, Types.DECIMAL);
            }
            
            // Đã xóa Ma_Quan_Ly. id là tham số thứ 8
            pstmt.setString(8, emp.getIdPhongBan());

            pstmt.executeUpdate();
        }
    }

    // 2. READ ALL: Lấy tất cả nhân viên
    public List<EmployeeModel> getAllEmployees() throws Exception {
        List<EmployeeModel> employeeList = new ArrayList<>();
        String SQL = "SELECT * FROM employee";
        
        try (Connection conn = Connectdao.getConnection(); 
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SQL)) {

            while (rs.next()) {
                employeeList.add(mapResultSetToEmployee(rs));
            }
        }
        return employeeList;
    }
    
    // 3. READ ONE: Lấy nhân viên theo ID
    public EmployeeModel getEmployeeById(int maNhanVien) throws Exception {
        String SQL = "SELECT * FROM employee WHERE Ma_Nhan_Vien = ?";
        
        try (Connection conn = Connectdao.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setInt(1, maNhanVien);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToEmployee(rs);
                }
            }
        }
        return null;
    }

    // 4. UPDATE: Cập nhật nhân viên
    // BỎ Ma_Quan_Ly khỏi SQL
    public void updateEmployee(EmployeeModel emp) throws Exception {
        String SQL = "UPDATE employee SET Ten=?, Ho=?, Email=?, So_Dien_Thoai=?, Ngay_Vao_Lam=?, Chuc_Danh=?, Luong=?, id=? WHERE Ma_Nhan_Vien=?";
        
        try (Connection conn = Connectdao.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, emp.getTen());
            pstmt.setString(2, emp.getHo());
            pstmt.setString(3, emp.getEmail());
            pstmt.setString(4, emp.getSoDienThoai());
            pstmt.setDate(5, emp.getNgayVaoLam());
            pstmt.setString(6, emp.getChucDanh());
            
            // Xử lý Lương (Có thể NULL)
            if (emp.getLuong() != null) {
                pstmt.setBigDecimal(7, emp.getLuong());
            } else {
                pstmt.setNull(7, Types.DECIMAL);
            }
            
            // Đã xóa Ma_Quan_Ly. id là tham số thứ 8
            pstmt.setString(8, emp.getIdPhongBan());
            pstmt.setInt(9, emp.getMaNhanVien()); // Ma_Nhan_Vien ở mệnh đề WHERE

            pstmt.executeUpdate();
        }
    }
    
    // 5. DELETE: Xử lý xóa nhân viên
    public void deleteEmployee(int maNhanVien) throws Exception {
        String SQL = "DELETE FROM employee WHERE Ma_Nhan_Vien = ?";
        
        try (Connection conn = Connectdao.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            
            pstmt.setInt(1, maNhanVien);
            pstmt.executeUpdate();
        }
    }
}