<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %> 

<fmt:setLocale value="${sessionScope.Lang}" />
<fmt:setBundle basename="i18n/global" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

<style>
    /* ... (CSS Của bạn không thay đổi) ... */
    :root {
        --nav-bg: #2c3e50; /* Darker Navy/Charcoal - Màu cơ bản chuyên nghiệp */
        --accent-color: #3498db; /* Màu xanh dương (Primary Blue) - Màu nổi bật mới */
        --text-light: #ecf0f1;
        --shadow-subtle: 0 2px 10px rgba(0,0,0,0.1);
        --font-family-primary: 'Montserrat', sans-serif;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: var(--nav-bg);
        padding: 10px 40px; 
        box-shadow: var(--shadow-subtle);
        position: sticky;
        top: 0;
        z-index: 1000;
        min-height: 55px; 
        font-size: 1.0rem; 
        font-family: var(--font-family-primary);
    }

    .brand {
        color: var(--accent-color);
        font-weight: 700;
        font-size: 1.5rem;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    
    .nav-links {
        display: flex;
        align-items: center;
        gap: 25px; 
    }

    nav a {
        color: var(--text-light);
        text-decoration: none;
        font-weight: 600; 
        padding: 8px 12px;
        border-radius: 6px;
        transition: all 0.3s ease-out; 
        position: relative;
        display: flex; 
        align-items: center;
    }
    
    nav a i {
        margin-right: 8px;
        font-size: 1.1em;
        transition: color 0.3s;
    }

    .nav-links a:hover {
        color: var(--accent-color); 
        background-color: rgba(52, 152, 219, 0.1); 
    }
    
    .nav-links a::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        width: 0;
        height: 3px;
        background-color: var(--accent-color);
        transition: width 0.3s ease-out, left 0.3s ease-out;
        border-radius: 2px 2px 0 0;
    }

    .nav-links a:hover::after {
        width: 100%;
        left: 0;
    }
    
    .logout-btn {
        background-color: var(--accent-color);
        color: white !important;
        border: 2px solid var(--accent-color);
        box-shadow: 0 4px 10px rgba(52, 152, 219, 0.4);
    }

    .logout-btn:hover {
        background-color: #2980b9; 
        border-color: #2980b9;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(52, 152, 219, 0.6);
        color: white !important;
    }

</style>

<nav>
    <div class="brand">
        <a href="${pageContext.request.contextPath}/admin.jsp" class="brand" style="padding: 0; color: var(--accent-color);">
            <i class="fas fa-cubes"></i> APP NAME
        </a>
    </div>

    <div class="nav-links">
        
        <%-- Trang Quản trị (Admin Home) --%>
        <a href="${pageContext.request.contextPath}/admin.jsp">
            <i class="fas fa-home"></i> <fmt:message key="menu.home" />
        </a> 
        
        <%-- SỬA: Quản lý Người Dùng/Nhân Viên (Gọi qua Servlet Controller) --%>
        <a href="${pageContext.request.contextPath}/employee/list">
            <i class="fas fa-users"></i> Nhân Viên
        </a> 
        
        <%-- Quản lý Phòng Ban (Giả định URL /departments) --%>
        <a href="${pageContext.request.contextPath}/Departments/list">
            <i class="fas fa-building"></i> Phòng Ban
        </a> 
        
        <%-- Liên Hệ --%>
        <a href="${pageContext.request.contextPath}/lienhe.jsp">
            <i class="fas fa-headset"></i> Liên Hệ
        </a> 
        
        <%-- Đăng Xuất --%>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i> Đăng Xuất
        </a>
    </div>

</nav>