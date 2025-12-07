<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Vibrant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --light-background: #f0f4f8; /* Nền trắng xám nhạt */
            --card-color: #ffffff; /* Nền card trắng */
            --text-dark: #333d47; /* Màu chữ đen xám */
            --primary-accent: #00897b; /* Màu xanh Teal (Teal Mát) */
            --primary-light: #4db6ac;
            --shadow-color: rgba(0, 0, 0, 0.1);
        }
        body {
            background-color: var(--light-background);
            min-height: 100vh;
            font-family: 'Roboto', sans-serif;
            color: var(--text-dark);
        }
        .login-card {
            background-color: var(--card-color);
            border: none;
            border-radius: 25px; /* Bo góc mềm mại hơn */
            box-shadow: 0 15px 40px var(--shadow-color);
            transition: all 0.3s ease;
        }
        .login-card:hover {
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }
        .btn-login {
            background: linear-gradient(45deg, var(--primary-accent), #00acc1); /* Gradient nhẹ từ Teal sang Cyan */
            border: none;
            border-radius: 15px; /* Bo góc vừa phải */
            padding: 15px 40px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 5px 15px rgba(0, 137, 123, 0.4);
            transition: transform 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 137, 123, 0.6);
        }
        .form-control {
            border: 2px solid #e0e0e0;
            color: var(--text-dark);
            border-radius: 12px;
            padding: 12px 15px;
            transition: border-color 0.2s;
        }
        .form-control:focus {
            border-color: var(--primary-accent);
            box-shadow: 0 0 0 0.25rem rgba(0, 137, 123, 0.15);
        }
        .form-label {
            color: var(--text-dark);
            font-weight: 600;
        }
        .text-accent {
            color: var(--primary-accent) !important;
            font-weight: 600;
        }
        h1 {
            color: var(--primary-accent);
            font-weight: 800;
            letter-spacing: 0.5px;
        }
        .fa-lock {
            color: var(--primary-accent);
            opacity: 0.9;
        }
        a {
            color: var(--primary-light);
            transition: color 0.2s;
        }
        a:hover {
            color: var(--primary-accent);
        }
        /* Custom Checkbox Style */
        .form-check-input:checked {
            background-color: var(--primary-accent);
            border-color: var(--primary-accent);
        }
        .alert-danger {
            background-color: #ffe5e5;
            color: #d32f2f;
            border: 1px solid #d32f2f;
            border-radius: 10px;
            font-weight: 500;
        }
    </style>
</head>
<body class="d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5 col-xl-4">
                <div class="login-card p-5">
                    <div class="text-center mb-5">
                        <i class="fas fa-fingerprint fa-4x mb-3 text-accent"></i>
                        <h1 class="h3 mb-1">Secure Login</h1>
                        <p class="text-muted">Đăng nhập để truy cập hệ thống</p>
                    </div>

                    <%-- Hiển thị thông báo lỗi --%>
                    <c:if test="${not empty message}">
                        <div class="alert alert-danger text-center">${message}</div>
                    </c:if>

                    <form action="<%=request.getContextPath()%>/login" method="post">
                        
                        <div class="mb-4">
                            <label class="form-label"><i class="fas fa-user me-2"></i> Tên Đăng Nhập</label>
                            <input name="username" value="${username}" type="text" class="form-control form-control-lg" required placeholder="Tên đăng nhập hoặc Email">
                        </div>
                        
                        <div class="mb-4">
                            <label class="form-label"><i class="fas fa-key me-2"></i> Mật Khẩu</label>
                            <input name="password" type="password" class="form-control form-control-lg" required placeholder="Mật khẩu">
                        </div>
                        
                        <div class="d-flex justify-content-between align-items-center mb-5">
                            <div class="form-check">
                                <input name="remember" class="form-check-input" type="checkbox" id="remember">
                                <label class="form-check-label" for="remember">Ghi nhớ tôi</label>
                            </div>
                            <a href="#" class="text-accent text-decoration-none">Quên mật khẩu?</a>
                        </div>
                        
                        <div class="d-grid">
                            <button type="submit" class="btn btn-login text-white">
                                <i class="fas fa-arrow-right-to-bracket me-2"></i> Đăng Nhập
                            </button>
                        </div>
                    </form>

                    <div class="text-center mt-4 pt-3 border-top border-light-subtle">
                        <a href="<%=request.getContextPath()%>/"><i class="fas fa-home me-1"></i> Quay lại Trang Chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>