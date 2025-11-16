<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %> 
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<html>
<head>
    <title>Lab 3: Thư viện Core</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="container">
        <header class="page-header">
            <h1>LAB 3: MENU CÁC BÀI TẬP JSTL</h1>
            <p class="subtitle">Chọn bài tập bạn muốn kiểm tra:</p>
        </header>
        
        <main class="exercises-menu">
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
        </main>
    </div>
	
</body>
</html>