<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu Bài Tập Lập Trình Web</title>
<style>
    /* * CSS Bắt Đầu 
     * Thiết kế hiện đại, dễ đọc
     */

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6; /* Màu nền nhẹ nhàng */
        color: #333;
        margin: 0;
        padding: 20px;
    }

    .menu-container {
        max-width: 800px;
        margin: 40px auto; /* Canh giữa và tạo khoảng cách trên dưới */
        padding: 30px;
        background-color: #ffffff; /* Nền trắng cho nội dung */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Tạo bóng đổ nhẹ */
        border-radius: 10px; /* Bo góc */
    }

    .menu-header {
        text-align: center;
        color: #1a73e8; /* Màu xanh nổi bật */
        border-bottom: 2px solid #e0e0e0;
        padding-bottom: 15px;
        margin-bottom: 25px;
    }

    .menu-list {
        list-style: none; /* Bỏ dấu chấm mặc định của list */
        padding: 0;
        display: flex; /* Dùng Flexbox để sắp xếp các mục */
        flex-wrap: wrap; /* Cho phép xuống dòng nếu màn hình nhỏ */
        gap: 20px; /* Khoảng cách giữa các mục */
        justify-content: center; /* Canh giữa các mục */
    }

    .menu-item {
        margin: 10px 0;
        flex-basis: calc(50% - 20px); /* Mỗi mục chiếm gần 50% chiều rộng */
        min-width: 250px;
    }

    .menu-item a {
        display: block;
        padding: 15px 20px;
        text-decoration: none; /* Bỏ gạch chân */
        color: #333;
        background-color: #e8f0fe; /* Màu nền nhẹ cho nút */
        border: 1px solid #c8dafa;
        border-radius: 8px;
        transition: background-color 0.3s, transform 0.2s, box-shadow 0.3s;
        font-weight: 600;
        font-size: 16px;
    }

    .menu-item a:hover {
        background-color: #d2e3fc; /* Đổi màu khi di chuột */
        color: #1a73e8;
        transform: translateY(-2px); /* Hiệu ứng nhấc lên */
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* Bóng đổ mạnh hơn */
    }

    /* Phong cách riêng cho nút "Trang Chủ" */
    .home-item {
        flex-basis: 100%; /* Cho nút trang chủ chiếm toàn bộ chiều rộng */
        text-align: center;
        margin-top: 30px;
    }

    .home-item a {
        background-color: #1a73e8;
        color: #ffffff;
        border: 1px solid #1a73e8;
    }

    .home-item a:hover {
        background-color: #155bb2;
        color: #ffffff;
        transform: translateY(-2px);
    }
</style>
</head>
<body>

<div class="menu-container">
    <h2 class="menu-header">📚 Danh Mục Bài Tập Lab</h2>

    <ul class="menu-list">
        <li class="menu-item">
            <a href="add">
                🔗 BÀI 1: Đọc Form với BeanUtils
            </a>
        </li>
        <li class="menu-item">
            <a href="mail">
                🔗 BÀI 2: Gửi Mail (Email Service)
            </a>
        </li>
        <li class="menu-item">
            <a href="login">
                🔗 BÀI 3: Xử Lý Cookies
            </a>
        </li>
       
        <li class="menu-item home-item">
            <a href="">
                🏠 TRỞ VỀ TRANG CHỦ DỰ ÁN
            </a>
        </li>
    </ul>
</div>

</body>
</html>