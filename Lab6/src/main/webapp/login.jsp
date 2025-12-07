<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Hệ Thống</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        /* CSS Tinh Chỉnh: Chú trọng sự tối giản và sang trọng */
        :root {
            /* Bảng màu Tối giản (Monochromatic) */
            --primary-color: #007bff;   /* Màu xanh dương đậm (Azure/Business blue) */
            --text-color: #343a40;      /* Màu chữ xám đậm */
            --bg-light: #f8f9fa;        /* Nền trắng xám nhẹ */
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); /* Bóng đổ mỏng, dài */
            --border-radius: 12px;
        }

        body {
            margin: 0;
            height: 100vh;
            /* Nền trắng/xám nhẹ tạo cảm giác sạch sẽ */
            background: var(--bg-light);
            font-family: 'Poppins', sans-serif; /* Font Poppins hiện đại, chuyên nghiệp */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: white;
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            width: 360px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .login-card:hover {
            transform: translateY(-5px); /* Hiệu ứng nhấc nhẹ tinh tế */
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
        }

        h2 { 
            color: var(--primary-color); 
            margin-bottom: 30px; 
            font-weight: 700;
            font-size: 1.8rem;
            /* Đường kẻ phân cách tinh tế */
            border-bottom: 1px solid #e9ecef; 
            padding-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        h2 i {
            margin-right: 10px;
            color: var(--text-color);
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 18px; /* Tăng khoảng cách để thoáng hơn */
        }

        .input-group {
            position: relative;
        }

        input {
            width: 100%;
            padding: 14px 15px;
            border: 1px solid #ced4da; /* Viền xám trung tính */
            border-radius: 8px;
            font-size: 16px;
            color: var(--text-color);
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        
        input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.15); /* Hiệu ứng focus nhẹ và sắc nét */
            outline: none;
        }
        
        button {
            width: 100%;
            padding: 15px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
            text-transform: uppercase; /* Chữ hoa làm tăng tính chuyên nghiệp */
        }

        button:hover {
            background: #0056b3; 
            transform: translateY(-2px); 
            box-shadow: 0 6px 15px rgba(0, 123, 255, 0.3);
        }

        .error { 
            color: #dc3545; /* Màu đỏ tiêu chuẩn */ 
            margin-top: 20px; 
            font-weight: 500; 
            background: #f8d7da; /* Nền báo lỗi nhẹ */
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #f5c6cb;
            font-size: 14px;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="login-card">
    <h2><i class="fas fa-sign-in-alt"></i> ĐĂNG NHẬP HỆ THỐNG</h2>
    <form action="login" method="post">
        <div class="input-group">
            <input type="text" name="username" placeholder="Tên đăng nhập" value="${username}" required>
        </div>
        <div class="input-group">
            <input type="password" name="password" placeholder="Mật khẩu" required>
        </div>
        
        <label style="display: flex; align-items: center; justify-content: flex-start; font-size: 14px; color: var(--text-color);">
             <input type="checkbox" name="remember" style="width: auto; margin-right: 10px; transform: scale(1.1);"> Ghi nhớ đăng nhập
        </label>
        
        <button type="submit">Đăng Nhập</button>
    </form>
    
    <c:if test="${not empty message && message != 'Đăng Nhập Thành Công!'}">
        <p class="error">${message}</p>
    </c:if>
</div>
</body>
</html>