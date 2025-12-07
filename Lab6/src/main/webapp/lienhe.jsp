<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ Với Chúng Tôi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        /* (Giữ nguyên phần CSS Clean Dark Mode) */
        :root {
            --bg-dark: #1e1e2d;
            --card-dark: #27293d;
            --text-light: #f0f0f0;
            --accent-color: #5d53f8;
            --input-bg: #323548;
            --shadow-dark: 0 10px 20px rgba(0, 0, 0, 0.4);
        }
        body {
            background-color: var(--bg-dark);
            color: var(--text-light);
            font-family: 'Roboto', sans-serif;
            min-height: 100vh;
        }
        .container {
            padding-top: 50px;
            padding-bottom: 50px;
        }
        .contact-card {
            background: var(--card-dark);
            border-radius: 15px;
            box-shadow: var(--shadow-dark);
            padding: 40px;
        }
        h2 {
            color: var(--accent-color);
            font-weight: 700;
            margin-bottom: 30px;
            border-left: 5px solid var(--accent-color);
            padding-left: 15px;
        }
        .form-control {
            background-color: var(--input-bg);
            border: 1px solid var(--input-bg);
            color: var(--text-light);
            padding: 12px 15px;
            border-radius: 8px;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            background-color: var(--input-bg);
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(93, 83, 248, 0.25);
            color: var(--text-light);
        }
        .btn-submit {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-submit:hover {
            background-color: #4b44c2;
            transform: translateY(-2px);
        }
        .info-box {
            background-color: var(--input-bg);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }
        .info-box i {
            color: var(--accent-color);
            margin-right: 15px;
            font-size: 1.4rem;
        }
        .alert {
            /* Style cho thông báo */
            margin-bottom: 30px;
            border-radius: 8px;
            font-weight: 500;
        }
        footer {
            margin-top: 40px;
            text-align: center;
            opacity: 0.7;
            padding-top: 20px;
            border-top: 1px solid var(--input-bg);
        }
    </style>
</head>
<body>

<jsp:include page="menu.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="contact-card">
                <h2 class="mb-4">Gửi Yêu Cầu Liên Hệ</h2>
                
                <%-- Hiển thị thông báo từ Servlet --%>
                <c:if test="${not empty contact_message}">
                    <div class="alert 
                        <c:choose>
                            <c:when test="${fn:contains(contact_message, 'thành công')}">
                                alert-success
                            </c:when>
                            <c:otherwise>
                                alert-danger
                            </c:otherwise>
                        </c:choose>
                    " role="alert">
                        ${contact_message}
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-md-5 mb-4 mb-md-0">
                        <p class="lead mb-4">Chúng tôi luôn sẵn sàng hỗ trợ và giải đáp mọi thắc mắc của bạn. Hãy gửi tin nhắn cho chúng tôi.</p>
                        
                        <div class="info-box">
                            <p><i class="fas fa-map-marker-alt"></i> Địa chỉ: 123 Đinh Tiên Hoàng, Hà Nội</p>
                        </div>
                        <div class="info-box">
                            <p><i class="fas fa-phone-alt"></i> Điện thoại: (024) 1234 5678</p>
                        </div>
                        <div class="info-box">
                            <p><i class="fas fa-envelope"></i> Email: support@demo.com</p>
                        </div>
                    </div>

                    <div class="col-md-7">
                        <%-- ACTION phải trỏ đến ContactServlet mới --%>
                        <form action="send_contact" method="post"> 
                            <div class="mb-3">
                                <label for="name" class="form-label">Họ và Tên</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email của bạn</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="subject" class="form-label">Chủ đề</label>
                                <input type="text" class="form-control" id="subject" name="subject">
                            </div>
                            <div class="mb-4">
                                <label for="message" class="form-label">Nội dung Tin nhắn</label>
                                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-submit w-100">Gửi Tin Nhắn</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>Demo Lab 6-7 - JAV101</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>