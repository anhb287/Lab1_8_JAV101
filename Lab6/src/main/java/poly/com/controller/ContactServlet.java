package poly.com.controller;

import java.io.IOException;
import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Import model chứa thông tin đăng nhập SMTP (cần phải tự tạo)
import poly.com.model.SMTP_Password; 

/**
 * Servlet xử lý yêu cầu gửi mail từ trang Liên hệ (Contact Form)
 */
@WebServlet("/send_contact")
public class ContactServlet extends HttpServlet {

    // Địa chỉ email nhận tất cả các yêu cầu liên hệ từ người dùng
    private static final String RECEIVING_EMAIL = "quocanhbuinhat@gmail.com"; // THAY ĐỔI ĐỊA CHỈ NÀY

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy dữ liệu từ Contact Form (Các tên tham số khớp với form HTML)
        String senderName = request.getParameter("name");
        String senderEmail = request.getParameter("email");
        String subject = request.getParameter("subject");
        String messageBody = request.getParameter("message");
        
        // Tạo nội dung chi tiết cho email gửi đến quản trị viên
        String fullSubject = "[LIÊN HỆ MỚI] " + subject;
        String fullBody = "<html><body>"
                        + "<h3>Thông tin liên hệ từ trang web:</h3>"
                        + "<ul>"
                        + "<li><strong>Họ và Tên:</strong> " + senderName + "</li>"
                        + "<li><strong>Email Gửi:</strong> " + senderEmail + "</li>"
                        + "<li><strong>Chủ đề:</strong> " + subject + "</li>"
                        + "</ul>"
                        + "<h3>Nội dung:</h3>"
                        + "<p>" + messageBody.replace("\n", "<br>") + "</p>"
                        + "</body></html>";

        try {
            // 2. Cấu hình SMTP (Giữ nguyên cấu hình của bạn)
            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.ssl.protocols", "TLSv1.2");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", 587);

            // 3. Session mail
            Session s = Session.getInstance(p, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                        SMTP_Password.mail,  // Email dùng để gửi đi (Email của bạn)
                        SMTP_Password.password // Mật khẩu ứng dụng (App Password)
                    );
                }
            });

            // 4. Message
            Message msg = new MimeMessage(s);
            // Email gửi đi là email của bạn
            msg.setFrom(new InternetAddress(SMTP_Password.mail, senderName + " qua Contact Form")); 

            // Email nhận là địa chỉ email bạn muốn nhận yêu cầu liên hệ
            msg.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(RECEIVING_EMAIL)); 

            msg.setSubject(fullSubject);

            // Nội dung email
            MimeBodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(fullBody, "text/html; charset=utf-8");

            MimeMultipart multipart = new MimeMultipart();
            multipart.addBodyPart(contentPart);
            
            // Do đây là form liên hệ, ta bỏ qua phần xử lý file đính kèm

            msg.setContent(multipart);

            // 5. Gửi mail
            Transport.send(msg);

            // Gửi thành công
            request.setAttribute("contact_message", "Gửi yêu cầu liên hệ thành công! Chúng tôi sẽ phản hồi bạn sớm nhất.");

        } catch (Exception e) {
            e.printStackTrace();
            // Gửi thất bại
            request.setAttribute("contact_message", "Gửi yêu cầu liên hệ không thành công. Vui lòng thử lại sau.");
        }

        // Chuyển hướng lại về trang liên hệ với thông báo
        request.getRequestDispatcher("/lienhe.jsp").forward(request, response);
    }
}