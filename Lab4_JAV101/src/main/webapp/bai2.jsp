<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator Form</title>
<style>
    /* Reset và Cấu trúc cơ bản */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e9ecef;
        margin: 0;
        padding: 0;
        display: flex; /* Sử dụng flexbox cho toàn bộ body */
        flex-direction: column; /* Sắp xếp các phần tử theo chiều dọc */
        min-height: 100vh; /* Chiều cao tối thiểu của body là 100% viewport */
    }

    /* Đảm bảo jsp:include (menu) có style riêng, ví dụ: */
    /* Nếu menu của bạn có một thẻ bao ngoài như <nav> hoặc <header>, hãy dùng nó */
    /* Ví dụ: nếu index.jsp của bạn có <nav class="main-menu">, hãy thêm CSS cho nó */
    /* Dưới đây là ví dụ giả định cho menu của bạn */
    .menu-placeholder { /* Đây là ví dụ, bạn cần thay bằng selector thực tế của menu */
        background-color: #343a40; /* Màu nền cho menu */
        color: white;
        padding: 10px 20px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        box-sizing: border-box;
    }
    .menu-placeholder a {
        color: white;
        text-decoration: none;
        margin-left: 20px;
    }
    .menu-placeholder a:hover {
        text-decoration: underline;
    }
    /* Kết thúc ví dụ giả định cho menu */

    /* Phần nội dung chính (main) sẽ chiếm hết không gian còn lại */
    main {
        flex-grow: 1; /* Cho phép main chiếm toàn bộ không gian còn lại */
        display: flex; /* Bật Flexbox để căn giữa form bên trong */
        justify-content: center; /* Căn giữa theo chiều ngang */
        align-items: center; /* Căn giữa theo chiều dọc */
        padding: 20px; /* Khoảng đệm tổng thể */
        box-sizing: border-box;
    }

    /* Container cho form */
    .container {
        width: 380px;
        background: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        text-align: center;
    }

    /* Tiêu đề */
    h1 {
        font-size: 24px;
        color: #343a40;
        margin-bottom: 25px;
        font-weight: 600;
        border-bottom: 2px solid #007bff;
        padding-bottom: 10px;
    }

    /* Input Fields */
    input {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #ced4da;
        font-size: 16px;
        transition: border-color 0.3s, box-shadow 0.3s;
        box-sizing: border-box;
    }

    input:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25);
    }

    /* Button Group */
    .button-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-top: 20px;
        flex-wrap: wrap; /* Cho phép các nút xuống dòng nếu không đủ chỗ */
    }
    
    .button-group button {
        flex-grow: 1; 
        width: calc(50% - 5px); /* Đảm bảo 2 nút trên 1 hàng (trừ gap) */
        min-width: 150px; /* Chiều rộng tối thiểu cho nút */
        margin-bottom: 10px; /* Khoảng cách giữa các hàng nút */
    }

    button {
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.1s, box-shadow 0.3s;
        font-weight: 600;
        text-transform: uppercase;
    }

    /* Nút Cộng */
    .btn-add {
        background-color: #28a745;
        color: white;
        box-shadow: 0 4px 10px rgba(40, 167, 69, 0.3);
    }
    .btn-add:hover {
        background-color: #218838;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(40, 167, 69, 0.4);
    }

    /* Nút Trừ */
    .btn-sub {
        background-color: #dc3545;
        color: white;
        box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
    }
    .btn-sub:hover {
        background-color: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(220, 53, 69, 0.4);
    }
    
    /* Nút Nhân */
    .btn-mul {
        background-color: #ffc107;
        color: #333;
        box-shadow: 0 4px 10px rgba(255, 193, 7, 0.3);
    }
    .btn-mul:hover {
        background-color: #e0a800;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(255, 193, 7, 0.4);
    }

    /* Nút Chia */
    .btn-div {
        background-color: #17a2b8;
        color: white;
        box-shadow: 0 4px 10px rgba(23, 162, 184, 0.3);
    }
    .btn-div:hover {
        background-color: #138496;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(23, 162, 184, 0.4);
    }

</style>
</head>
<body>
    
    <%-- Bao gồm thanh menu --%>
    <jsp:include page="index.jsp"></jsp:include>
    
    <%-- Phần nội dung chính, chứa form tính toán và được căn giữa --%>
    <main>
        <div class="container">
            <c:if test="${not empty message}">
                <h1>${message}</h1>
            </c:if>
            <c:if test="${empty message}">
                <h1>Thực hiện phép tính</h1>
            </c:if>

            <c:url value="/calculate" var="cal" />

            <form method="post">
                <input name="a" placeholder="Nhập số thứ nhất (a)" required>
                <input name="b" placeholder="Nhập số thứ hai (b)" required>
                
                <div class="button-group">
                    <button class="btn-add" formaction="${cal}/add">
                        Cộng (+)
                    </button>
                    <button class="btn-sub" formaction="${cal}/sub">
                        Trừ (−)
                    </button>
                    <button class="btn-mul" formaction="${cal}/mul">
                        Nhân (×)
                    </button>
                    <button class="btn-div" formaction="${cal}/div">
                        Chia (÷)
                    </button>
                </div>
            </form>
        </div>
    </main>

</body>
</html>