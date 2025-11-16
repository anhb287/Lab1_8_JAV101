<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Lab 3: Thư viện Core</title>
    <link rel="stylesheet" href="style.css">

    <style>
        .cart-icon {
            position: fixed;
            top: 10px;
            right: 20px;
            background: #fff;
            padding: 10px 15px;
            border-radius: 8px;
            box-shadow: 0 0 5px #aaa;
            font-size: 18px;
            z-index: 999;
        }

        .cart-icon a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }

        .cart-count {
            color: red;
            font-weight: bold;
        }
        
        /* Bổ sung CSS cho Menu chính */
        .exercises-menu {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .exercise-card {
            border: 1px solid #007bff;
            padding: 20px;
            margin: 10px;
            text-align: center;
            width: 250px;
            box-shadow: 2px 2px 5px #ccc;
            text-decoration: none;
            color: #007bff;
        }
        .exercise-card h3 {
            margin-top: 0;
            color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <header class="page-header">
        <h1>LAB 3: MENU CÁC BÀI TẬP JSTL</h1>
        <p class="subtitle">Chọn bài tập bạn muốn kiểm tra:</p>
    </header>
    
    <main>
        <div class="exercises-menu">
            
            <%-- SỬA LỖI: Link trực tiếp đến shop.jsp (đã được sửa lỗi 500) --%>
            <a href="shop.jsp" class="exercise-card"> 
                <h3>Mua hàng (Rolex)</h3>
                <p>Danh sách sản phẩm và Giỏ hàng</p>
            </a>
            
            <a href="bai1_2" class="exercise-card">
                <h3>Bài 1 & 2</h3>
                <p>JSTL Core: Vòng lặp & Thuộc tính</p>
            </a>
            <a href="bai3" class="exercise-card">
                <h3>Bài 3</h3>
                <p>JSTL Core: Điều kiện & Các thẻ khác</p>
            </a>
            <a href="bai4" class="exercise-card">
                <h3>Bài 4</h3>
                <p>JSTL Functions: Xử lý chuỗi</p>
            </a>
        </div>
    </main>
</div>
</body>
</html>