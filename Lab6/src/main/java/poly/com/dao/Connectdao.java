package poly.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connectdao {
	
    // Khai báo hằng số cho cấu hình kết nối
	private static final String URL = "jdbc:mysql://localhost:3306/lab6?serverTimezone=UTC"; // Thêm Timezone cho MySQL 8+
    private static final String USER = "root";       
    private static final String PASSWORD = "buianh287"; 
    
    // Khai báo tên Driver (cần thiết cho các phiên bản cũ hơn, nhưng vẫn là Best Practice)
    private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver"; 

    public static Connection getConnection() throws Exception {
        
        // 1. Kiểm tra và tải Driver (nếu cần)
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            System.err.println("Lỗi: Không tìm thấy JDBC Driver.");
            throw new Exception("JDBC Driver not found.", e);
        }

        // 2. Thiết lập kết nối
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.err.println("Lỗi: Kết nối CSDL thất bại.");
            System.err.println("URL: " + URL);
            System.err.println("User: " + USER);
            throw new Exception("Database connection failed.", e);
        }
    }
}