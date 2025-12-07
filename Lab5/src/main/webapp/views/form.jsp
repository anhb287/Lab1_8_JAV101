<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng Ký Nhân Viên Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #007bff; /* Blue */
            --secondary-color: #6c757d; /* Gray */
            --success-color: #28a745;
            --danger-color: #dc3545;
            --background-light: #f4f7fa;
            --card-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        body {
            background-color: var(--background-light);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }
        .form-container {
            max-width: 700px;
            margin: 50px auto;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 2.5rem;
        }
        .header-title {
            color: var(--primary-color);
            font-weight: 700;
            border-bottom: 3px solid var(--primary-color);
            padding-bottom: 10px;
            margin-bottom: 25px;
            display: inline-block;
        }
        .form-label {
            font-weight: 600;
            color: #343a40;
            margin-bottom: 0.5rem;
        }
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1px solid #ced4da;
            transition: border-color 0.2s;
        }
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn-submit {
            background-color: var(--primary-color);
            border: none;
            border-radius: 10px;
            padding: 12px 30px;
            font-weight: 600;
            transition: background-color 0.2s, transform 0.2s;
        }
        .btn-submit:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .form-check-label {
            font-weight: 400;
        }
        .divider {
            height: 1px;
            background-color: #e9ecef;
            margin: 2rem 0;
        }
        .required-indicator {
            color: var(--danger-color);
            font-size: 1.1em;
            margin-left: 2px;
        }
    </style>
</head>
<body class="d-flex align-items-center">
    <div class="container form-container">
        <div class="card">
            <div class="text-center">
                <h2 class="header-title">Đăng Ký Nhân Viên Mới</h2>
                <p class="text-muted mb-4">Vui lòng điền thông tin cá nhân và chi tiết công việc.</p>
            </div>

            <form action="<%=request.getContextPath()%>/add" method="post" enctype="multipart/form-data" class="row g-4">

                <div class="col-12">
                    <h5 class="text-secondary mb-3"><i class="fas fa-user me-2"></i> Thông Tin Cơ Bản</h5>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Họ và Tên<span class="required-indicator">*</span></label>
                    <input name="fullname" type="text" class="form-control" required placeholder="Ví dụ: Nguyễn Văn A">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Ngày Sinh<span class="required-indicator">*</span></label>
                    <input name="birthday" type="date" class="form-control" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Giới Tính<span class="required-indicator">*</span></label>
                    <div class="d-flex gap-4 mt-2">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="true" checked>
                            <label class="form-check-label" for="male">Nam</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="false">
                            <label class="form-check-label" for="female">Nữ</label>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Tình Trạng Hôn Nhân</label>
                    <div class="mt-2">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" name="married" id="married">
                            <label class="form-check-label" for="married">Đã Kết Hôn</label>
                        </div>
                    </div>
                </div>
                
                <div class="divider"></div>

                <div class="col-12">
                    <h5 class="text-secondary mb-3"><i class="fas fa-map-marker-alt me-2"></i> Chi Tiết Khác</h5>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Quốc Gia<span class="required-indicator">*</span></label>
                    <select name="country" class="form-select" required>
                        <option value="" disabled selected>Chọn Quốc Gia Của Bạn</option>
                        <option value="Vietnamese">Việt Nam</option>
                        <option value="United States">Hoa Kỳ</option>
                        <option value="United Kingdom">Vương Quốc Anh</option>
                        <option value="Other">Khác...</option>
                    </select>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Ảnh Đại Diện</label>
                    <input type="file" name="photo_file" class="form-control" accept="image/*">
                </div>
                
                <div class="col-12">
                    <label class="form-label mb-2">Sở Thích</label>
                    <div class="row g-2">
                        <div class="col-sm-6 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="hobbies" value="Coding" id="h1">
                                <label class="form-check-label" for="h1">Lập trình</label>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="hobbies" value="Travel" id="h2">
                                <label class="form-check-label" for="h2">Du lịch</label>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="hobbies" value="Music" id="h3">
                                <label class="form-check-label" for="h3">Âm nhạc</label>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="hobbies" value="Other" id="h4">
                                <label class="form-check-label" for="h4">Khác</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <label class="form-label">Ghi Chú</label>
                    <textarea name="note" class="form-control" rows="3" placeholder="Ghi chú thêm về nhân viên..."></textarea>
                </div>

                <div class="col-12 text-center mt-5">
                    <button type="submit" class="btn btn-primary btn-submit text-white">
                        <i class="fas fa-plus-circle me-2"></i> Thêm Nhân Viên
                    </button>
                </div>
            </form>
            <div class="text-center mt-4">
                <a href="<%=request.getContextPath()%>/"><i class="fas fa-arrow-left me-1"></i> Quay lại Trang Chủ</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>