<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông Tin Nhân Viên - Kết Quả</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --light-bg: #e0e5ec; /* Nền Neumorphism */
            --card-color: #f0f2f5;
            --main-accent: #6c5ce7; /* Tím Pastel */
            --light-shadow: #ffffff;
            --dark-shadow: #a3b1c6;
            --text-dark: #333;
        }

        body {
            background-color: var(--light-bg);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            display: flex;
            align-items: center;
        }
        
        /* Hiệu ứng Neumorphism cho Card */
        .card {
            background: var(--light-bg);
            border: none;
            border-radius: 20px;
            overflow: hidden;
            padding: 40px;
            /* Neumorphism Shadow */
            box-shadow: 8px 8px 16px var(--dark-shadow), 
                        -8px -8px 16px var(--light-shadow);
        }

        /* Tiêu đề */
        h1 {
            /* Đổi gradient tiêu đề sang tông màu tím/xanh mềm mại */
            background: linear-gradient(45deg, var(--main-accent), #48dbfb);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 900;
            letter-spacing: 0.5px;
        }
        .text-muted {
            color: var(--main-accent) !important;
            font-weight: 500;
        }

        /* Ảnh Profile */
        .profile-img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 50%;
            /* Hiệu ứng chìm nhẹ Neumorphism */
            box-shadow: inset 5px 5px 10px var(--dark-shadow), 
                        inset -5px -5px 10px var(--light-shadow);
            border: 4px solid var(--light-bg);
        }

        /* Thông tin Chi tiết */
        .info-label {
            font-weight: 500;
            color: var(--text-dark);
            font-size: 0.95rem;
            text-transform: uppercase;
            opacity: 0.7;
        }

        .info-value {
            font-size: 1.25rem;
            color: var(--text-dark);
            font-weight: 700;
            margin-top: 5px;
        }

        /* Sở thích (Badges) */
        .badge-hobby {
            /* Hiệu ứng Neumorphism cho badge */
            background-color: var(--light-bg);
            color: var(--main-accent);
            font-weight: 600;
            padding: 0.7em 1.5em;
            border-radius: 10px;
            box-shadow: 3px 3px 6px var(--dark-shadow), 
                        -3px -3px 6px var(--light-shadow);
            transition: all 0.2s;
        }
        .badge-hobby:hover {
            /* Hiệu ứng nhấn vào */
            box-shadow: inset 2px 2px 4px var(--dark-shadow), 
                        inset -2px -2px 4px var(--light-shadow);
            color: #fff;
            background-color: var(--main-accent);
        }

        /* Nút Hành động */
        .btn-outline-primary {
            /* Hiệu ứng Neumorphism cho nút */
            color: var(--main-accent);
            border: none;
            padding: 15px 45px;
            border-radius: 50px;
            font-weight: 600;
            background: var(--light-bg);
            box-shadow: 6px 6px 12px var(--dark-shadow), 
                        -6px -6px 12px var(--light-shadow);
            transition: all 0.3s ease;
        }
        .btn-outline-primary:hover {
            /* Hiệu ứng nhấn vào */
            color: white;
            background-color: var(--main-accent);
            box-shadow: inset 4px 4px 8px var(--dark-shadow), 
                        inset -4px -4px 8px var(--light-shadow);
            transform: scale(0.98);
        }
        
        /* Căn chỉnh lại nút Back to Home */
        .card .text-center a:last-child {
            margin-left: 1.5rem;
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            opacity: 0.8;
            transition: color 0.2s;
        }
        .card .text-center a:last-child:hover {
            color: var(--main-accent);
            opacity: 1;
        }
    </style>
</head>
<body class="d-flex align-items-center py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-xl-8">
                <div class="card p-5">
                    <div class="text-center mb-5">
                        <h1 class="display-5">Thông Tin Nhân Viên</h1>
                        <p class="text-muted fs-5">Đã thêm thông tin thành công!</p>
                    </div>

                    <div class="row g-5">
                        <div class="col-md-4 text-center">
                            <img src="<%=request.getContextPath()%>/files/${bean.photo_file}" 
                                 class="rounded-circle profile-img" alt="Ảnh Nhân Viên">
                        </div>
                        <div class="col-md-8">
                            <div class="row g-4">
                                <div class="col-12">
                                    <span class="info-label"><i class="fas fa-user me-2"></i> Họ và Tên</span>
                                    <p class="info-value fs-4">${bean.fullname}</p>
                                </div>
                                <div class="col-sm-6">
                                    <span class="info-label"><i class="fas fa-calendar-alt me-2"></i> Ngày Sinh</span>
                                    <p class="info-value">${bean.birthday}</p>
                                </div>
                                <div class="col-sm-6">
                                    <span class="info-label"><i class="fas fa-venus-mars me-2"></i> Giới Tính</span>
                                    <p class="info-value">
                                        <c:choose>
                                            <c:when test="${bean.gender}">Nam</c:when>
                                            <c:otherwise>Nữ</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="col-sm-6">
                                    <span class="info-label"><i class="fas fa-ring me-2"></i> Tình Trạng Hôn Nhân</span>
                                    <p class="info-value">
                                        <c:choose>
                                            <c:when test="${bean.married}">Đã Kết Hôn</c:when>
                                            <c:otherwise>Độc Thân</c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                                <div class="col-sm-6">
                                    <span class="info-label"><i class="fas fa-flag me-2"></i> Quốc Gia</span>
                                    <p class="info-value">${bean.country}</p>
                                </div>
                                <div class="col-12">
                                    <span class="info-label"><i class="fas fa-gamepad me-2"></i> Sở Thích</span>
                                    <div class="mt-3">
                                        <c:forEach items="${bean.hobbies}" var="hobby">
                                            <span class="badge badge-hobby me-2 mb-2">${hobby}</span>
                                        </c:forEach>
                                        <c:if test="${empty bean.hobbies}">
                                            <span class="text-muted">Không có sở thích nào được chọn</span>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <span class="info-label"><i class="fas fa-sticky-note me-2"></i> Ghi Chú</span>
                                    <p class="info-value mt-2">${bean.note != null ? bean.note : '—'}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-5">
                        <a href="<%=request.getContextPath()%>/form.jsp" class="btn btn-outline-primary px-5 py-3 rounded-pill">
                            <i class="fas fa-plus me-2"></i> Thêm Nhân Viên Khác
                        </a>
                        <a href="<%=request.getContextPath()%>/">Quay lại Trang Chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>