<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gửi Thư Điện Tử</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-blue: #0056b3; /* Xanh đậm chuyên nghiệp */
            --light-blue: #007bff; /* Xanh lam sáng */
            --background-color: #f8f9fa; /* Nền trắng xám nhẹ */
            --card-color: #ffffff;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }
        body {
            background-color: var(--background-color);
            min-height: 100vh;
            font-family: 'Open Sans', sans-serif;
        }
        .mail-card {
            background-color: var(--card-color);
            border: none;
            border-radius: 16px;
            box-shadow: 0 12px 30px var(--shadow-color);
            border-top: 5px solid var(--primary-blue); /* Điểm nhấn ở trên */
        }
        .header-title {
            color: var(--primary-blue);
            font-weight: 800;
            padding-bottom: 5px;
            margin-bottom: 0;
        }
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ced4da;
            transition: border-color 0.2s;
        }
        .form-control:focus {
            border-color: var(--light-blue);
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.15);
        }
        .form-label {
            font-weight: 600;
            color: #495057;
        }
        .btn-send {
            background-color: var(--primary-blue);
            border: none;
            border-radius: 12px;
            padding: 14px 50px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-send:hover {
            background-color: #004085; /* Màu đậm hơn khi hover */
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 86, 179, 0.3);
        }
        .alert-success {
            border-radius: 10px;
        }
        .fa-paper-plane {
            color: var(--light-blue);
        }
    </style>
</head>
<body class="d-flex align-items-center py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-xl-7">
                <div class="mail-card p-5">
                    <div class="text-center mb-5">
                        <i class="fas fa-envelope fa-4x mb-3 text-primary-blue"></i>
                        <h1 class="header-title display-5">Soạn Thư Mới</h1>
                        <p class="text-muted">Gửi email nhanh chóng và chuyên nghiệp</p>
                    </div>

                    <%-- Hiển thị thông báo thành công --%>
                    <c:if test="${not empty message}">
                        <div class="alert alert-success text-center">${message}</div>
                    </c:if>

                    <form action="<%=request.getContextPath()%>/mail" method="post" enctype="multipart/form-data">
                        <div class="row g-4">
                            
                            <div class="col-md-6">
                                <label class="form-label">Từ (From)</label>
                                <input name="from" type="email" class="form-control form-control-lg" required placeholder="nguoi-gui@example.com">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Đến (To)</label>
                                <input name="to" type="email" class="form-control form-control-lg" required placeholder="nguoi-nhan@example.com">
                            </div>
                            
                            <div class="col-12">
                                <label class="form-label">Chủ đề (Subject)</label>
                                <input name="subject" type="text" class="form-control form-control-lg" required placeholder="Tiêu đề thư">
                            </div>
                            
                            <div class="col-12">
                                <label class="form-label">Nội dung (Message)</label>
                                <textarea name="body" class="form-control" rows="6" required placeholder="Soạn thảo nội dung thư tại đây..."></textarea>
                            </div>
                            
                            <div class="col-12">
                                <label class="form-label"><i class="fas fa-paperclip me-2"></i> Đính kèm (Attachment)</label>
                                <input type="file" name="photo_file" class="form-control form-control-lg">
                            </div>
                            
                            <div class="col-12 text-center mt-5">
                                <button type="submit" class="btn btn-primary btn-send text-white">
                                    <i class="fas fa-check me-2"></i> Gửi Thư
                                </button>
                            </div>
                        </div>
                    </form>

                    <div class="text-center mt-4">
                        <a href="<%=request.getContextPath()%>/"><i class="fas fa-arrow-left me-1"></i> Quay lại Trang Chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>