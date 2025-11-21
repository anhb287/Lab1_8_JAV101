package controller;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,     // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
@WebServlet({"/bai4", "/upload"})
public class Bai4 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Hướng dẫn 1: Khi bấm menu /bai4, set page và forward đến index.jsp
        req.setAttribute("page", "upload.jsp");
        req.getRequestDispatcher("/upload.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = "";
        String filename = null;
        
        try {
            Part photoPart = req.getPart("photo");
            filename = photoPart.getSubmittedFileName();
            
            if (photoPart.getSize() == 0 || filename == null || filename.isEmpty() || filename.isBlank()) {
                message = "Lỗi: Bạn chưa chọn ảnh hoặc file rỗng!";
            } else {
                String appPath = req.getServletContext().getRealPath("");
                // Thư mục lưu file phải là static/files để khớp với JSP
                String uploadDir = appPath + "static" + File.separator + "files";
                File dir = new File(uploadDir);

                // Tạo thư mục nếu chưa tồn tại
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Ghi file
                File file = new File(dir, filename);
                photoPart.write(file.getAbsolutePath());

                message = "Upload thành công!";
            }
            
        } catch (Exception e) {
            message = "Lỗi upload file: " + e.getMessage();
            e.printStackTrace();
        }
        
        // Hướng dẫn 2: Sau khi xử lý, set message, filename và forward đến index.jsp
        req.setAttribute("message", message);
        req.setAttribute("filename", filename); 
        req.setAttribute("page", "upload.jsp");
        req.getRequestDispatcher("/upload.jsp").forward(req, resp);
    }
}