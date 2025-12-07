<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ Quản Trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    
    <style>
        /* CSS TỔNG QUAN */
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f4f6f9; /* Nền trắng xám nhẹ */
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        
        /* WELCOME BANNER */
        .welcome-banner {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%); /* Gradient xanh dương */
            color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
            margin-bottom: 30px;
        }
        .welcome-banner h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        .welcome-banner p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        /* DASHBOARD CARDS */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); /* Responsive 3-4 cột */
            gap: 25px;
        }
        .card {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            border-left: 5px solid;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .card-header i {
            margin-right: 10px;
            font-size: 1.5rem;
        }
        .card-value {
            font-size: 2.5rem;
            font-weight: 700;
            margin-top: 5px;
        }

        /* Màu sắc cho từng loại Card */
        .card.users { border-left-color: #2ecc71; }
        .card.users .card-value { color: #2ecc71; }
        .card.departments { border-left-color: #e67e22; }
        .card.departments .card-value { color: #e67e22; }
        .card.tasks { border-left-color: #9b59b6; }
        .card.tasks .card-value { color: #9b59b6; }
        .card.visitors { border-left-color: #f1c40f; }
        .card.visitors .card-value { color: #f1c40f; }

    </style>
</head>
<body>

    <jsp:include page="menu.jsp"/>

    <div class="container">
        
        <div class="welcome-banner">
            <h1>Chào Mừng Trở Lại, ${sessionScope.user.fullname}</h1>
            <p>Đây là bảng điều khiển quản lý hệ thống tổng quan của bạn.</p>
        </div>

        <h2><i class="fas fa-chart-line"></i> Tổng Quan Hệ Thống</h2>
        
        <div class="dashboard-grid">
            
            <div class="card users">
                <div class="card-header"><i class="fas fa-users"></i> Tổng Người Dùng</div>
                <div class="card-value">124</div> 
            </div>

            <div class="card departments">
                <div class="card-header"><i class="fas fa-building"></i> Tổng Phòng Ban</div>
                <div class="card-value">12</div> 
            </div>
            
            <div class="card tasks">
                <div class="card-header"><i class="fas fa-tasks"></i> Công Việc Đang Chờ</div>
                <div class="card-value">5</div> 
            </div>
            
            <div class="card visitors">
                <div class="card-header"><i class="fas fa-eye"></i> Lượt Truy Cập Hôm Nay</div>
                <div class="card-value">560</div> 
            </div>
            
        </div>
        
    </div>

</body>
</html>