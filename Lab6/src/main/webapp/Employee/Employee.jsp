<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<fmt:setLocale value="${sessionScope.Lang}" />
<fmt:setBundle basename="i18n/global" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Nhân Viên - CRUD</title>
    <jsp:include page="../menu.jsp"/> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

    <style>
        /* CSS Styling */
        :root { 
            --primary: #3498db; 
            --secondary: #2c3e50;
            --success: #2ecc71;
            --warning: #f1c40f;
            --danger: #e74c3c; /* Thêm màu đỏ cho nút xóa */
            --clear: #95a5a6;
        }
        body { font-family: 'Roboto', sans-serif; background: #f4f7f6; margin:0; padding:30px; }
        .container { max-width: 1400px; margin: 0 auto; }
        h1 { text-align:center; color:var(--secondary); font-size:2.8rem; margin:30px 0; border-bottom: 4px solid var(--primary); padding-bottom: 15px; font-weight: 700;}
        .card { background:white; border-radius:15px; box-shadow:0 10px 25px rgba(0,0,0,0.1); padding:30px; margin-bottom:30px; }
        h2 { color: var(--primary); margin-top: 0; font-size: 2rem; padding-bottom: 10px; border-bottom: 1px dashed #eee; margin-bottom: 20px;}

        label { display: block; font-weight: 500; margin-top: 15px; color: var(--secondary); }
        input[type="text"], input[type="email"], select, input[type="date"] { 
            width: calc(100% - 24px); 
            padding:12px; 
            margin:8px 0 15px 0; 
            border:1px solid #ccc; 
            border-radius:8px; 
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input:focus, select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
            outline: none;
        }
        
        .form-row { display: flex; gap: 30px; }
        .form-group { flex: 1; }
        
        .btn { 
            padding:12px 25px; 
            border:none; 
            border-radius:8px; 
            color:white; 
            cursor:pointer; 
            margin-top: 25px; 
            font-weight: 600; 
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.1s;
        }
        .btn:hover { transform: translateY(-1px); }
        .btn-add { background:var(--success); }
        .btn-add:hover { background: #27ae60; }
        .btn-update { background:var(--warning); color: var(--secondary); }
        .btn-update:hover { background: #f39c12; }
        .btn-clear { background:var(--clear); } 
        .btn-clear:hover { background: #7f8c8d; }
        
        .table-card { padding: 0; }
        table { width:100%; border-collapse:collapse; background: white; border-radius: 15px; overflow: hidden; }
        th, td { padding:18px; text-align:left; border-bottom:1px solid #e0e0e0; }
        th { background:var(--secondary); color:white; font-weight: 500; text-transform: uppercase; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        tr:hover { background-color: #f0f8ff; }
        .action-links a { color: var(--primary); text-decoration: none; margin: 0 8px; transition: color 0.2s;}
        .action-links a:hover { color: var(--secondary); }

        /* Thông báo */
        .alert-success {
            padding: 15px;
            background: #e6ffee;
            color: #1a7e44;
            border: 1px solid #b3e0c7;
            border-radius: 8px;
            margin-bottom: 25px;
            font-weight: 500;
        }
        .alert-error {
            padding: 15px;
            background: #ffeeee;
            color: #cc0000;
            border: 1px solid #ffcccc;
            border-radius: 8px;
            margin-bottom: 25px;
            font-weight: 500;
        }
        .alert-success i, .alert-error i {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<div class="container">

    <h1><i class="fas fa-users"></i> QUẢN LÝ NHÂN VIÊN</h1>

    <c:if test="${not empty successMessage}">
        <div class="alert-success">
            <i class="fas fa-check-circle"></i> ${successMessage}
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert-error">
            <i class="fas fa-exclamation-triangle"></i> Lỗi: ${errorMessage}
        </div>
    </c:if>

    <div class="card">
        <h2>
            <i class="fas ${employee == null ? 'fa-user-plus' : 'fa-user-edit'}"></i> 
            ${employee == null ? 'Thêm Nhân Viên Mới (CREATE)' : 'Chỉnh Sửa Nhân Viên (UPDATE)'}

          <%--   <c:if test="${employee != null}">
                <a href="${pageContext.request.contextPath}/employee/add" class="btn btn-clear" style="float: right; margin-top: -10px;">
                    <i class="fas fa-plus"></i> Thêm Mới
                </a>
            </c:if> --%>
        </h2>

        <form method="post" action="${pageContext.request.contextPath}/employee/${employee == null ? 'add' : 'edit'}">

            <c:if test="${employee != null}">
                <input type="hidden" name="maNhanVien" value="${employee.maNhanVien}">
            </c:if>

            <%-- Định dạng ngày vào làm để input type="date" hiển thị đúng --%>
            <fmt:formatDate value="${employee.ngayVaoLam}" pattern="yyyy-MM-dd" var="ngayVaoLamFormatted"/>

            <div class="form-row">
                <div class="form-group">
                    <label for="ho">Họ <span style="color:red;">*</span></label>
                    <input type="text" id="ho" name="ho" value="${employee.ho}" required>
                </div>
                <div class="form-group">
                    <label for="ten">Tên <span style="color:red;">*</span></label>
                    <input type="text" id="ten" name="ten" value="${employee.ten}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group"><label for="chucDanh">Chức danh <span style="color:red;">*</span></label><input type="text" id="chucDanh" name="chucDanh" value="${employee.chucDanh}" required></div>
                <div class="form-group"><label for="ngayVaoLam">Ngày vào làm <span style="color:red;">*</span></label><input type="date" id="ngayVaoLam" name="ngayVaoLam" value="${ngayVaoLamFormatted}" required></div>
            </div>

            <div class="form-row">
                <div class="form-group"><label for="email">Email <span style="color:red;">*</span></label><input type="email" id="email" name="email" value="${employee.email}" required></div>
                <div class="form-group"><label for="sdt">Số điện thoại</label><input type="text" id="sdt" name="sdt" value="${employee.soDienThoai}"></div>
            </div>

            <div class="form-row">
                <div class="form-group"><label for="luong">Lương (DECIMAL)</label><input type="text" id="luong" name="luong" value="${employee.luong}"></div>
                <div class="form-group"><label for="idPhongBan">ID Phòng ban</label><input type="text" id="idPhongBan" name="idPhongBan" value="${employee.idPhongBan}"></div>
            </div>

            <%-- ĐÃ XÓA trường Mã Quản lý (maQuanLy) để đồng bộ với logic Controller/DAO --%>

            <button type="submit" class="btn btn-${employee == null ? 'add' : 'update'}">
                <i class="fas ${employee == null ? 'fa-save' : 'fa-sync-alt'}"></i>
                ${employee == null ? ' Thêm Nhân Viên' : ' Cập Nhật'}
            </button>

        </form>
    </div>

    <hr>

    <div class="card table-card">
        <h2><i class="fas fa-table"></i> Danh Sách Nhân Viên</h2>

        <a href="${pageContext.request.contextPath}/employee/add" class="btn btn-add" style="float: right; margin-top: -55px; margin-right: 30px;">
            <i class="fas fa-plus"></i> Làm Mới
        </a>

        <table>
            <thead>
                <tr>
                    <th>Mã NV</th>
                    <th>Họ Tên</th>
                    <th>Chức danh</th>
                    <th>Email</th>
                    <th>Phòng ban</th>
                    <th><i class="fas fa-cogs"></i> Hành động</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="emp" items="${listEmployee}">
                    <tr>
                        <td>${emp.maNhanVien}</td>
                        <td>${emp.ho} ${emp.ten}</td>
                        <td>${emp.chucDanh}</td>
                        <td>${emp.email}</td>
                        <td>${emp.idPhongBan}</td>
                        <td class="action-links">
                            <a href="${pageContext.request.contextPath}/employee/edit?id=${emp.maNhanVien}" title="Chỉnh sửa">
                                <i class="fas fa-edit"></i> Sửa
                            </a> |
                            <a href="${pageContext.request.contextPath}/employee/delete?id=${emp.maNhanVien}"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên ${emp.ho} ${emp.ten} không?')" 
                               title="Xóa nhân viên">
                                <i class="fas fa-trash-alt"></i> Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>

</div>
</body>
</html>