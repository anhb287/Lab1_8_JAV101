<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload File</title>
</head>

<style>
    .upload-container {
        max-width: 500px;
        margin: 4em auto;
        padding: 30px;
        background-color: #f8f9fa; 
        border-radius: 12px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    
    .upload-container h3 {
        color: #1976d2;
        border-bottom: 2px solid #ced4da;
        padding-bottom: 15px;
        margin-bottom: 25px;
    }

    .input-file-group input[type="file"] {
        width: 0.1px;
        height: 0.1px;
        opacity: 0;
        overflow: hidden;
        position: absolute;
        z-index: -1;
    }

    .input-file-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        border: 1px solid #ced4da;
        border-radius: 8px;
        padding: 8px;
        background-color: white;
    }
    
    .custom-file-upload {
        background-color: #1976d2;
        color: white;
        padding: 10px 15px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.2s;
        white-space: nowrap;
    }

    .custom-file-upload:hover {
        background-color: #0d47a1;
    }

    .file-name-display {
        margin-left: 15px;
        color: #6c757d;
        font-style: italic;
        font-size: 14px;
        flex-grow: 1;
        text-align: left;
    }

    .upload-button {
        width: 100%;
        background-color: #28a745;
        color: white;
        border: none;
        padding: 12px 0;
        margin-top: 20px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 18px;
        font-weight: bold;
        transition: background-color 0.2s;
    }

    .upload-button:hover {
        background-color: #1e7e34;
    }
</style>

<body>
<jsp:include page="index.jsp" />

<div class="upload-container">
    
    <h3>Upload file ảnh</h3>

    <c:url value="upload" var="url" />

    <form action="${url}" method="post" enctype="multipart/form-data">
        
        <div class="input-file-group">
            <input name="photo" type="file" id="photo-upload">
            <label for="photo-upload" class="custom-file-upload">Chọn File</label>
            <span class="file-name-display" id="file-name-display">Chưa có file nào được chọn</span>
        </div>
        
        <button type="submit" class="upload-button">Upload</button>
    </form>

    <hr style="border: 0; border-top: 1px solid #e0e0e0; margin: 20px 0;">

    <!-- Chỉ hiển thị message khi có -->
    <c:if test="${not empty message}">
        <div style="color: green; font-size: 1em; padding: 10px; 
                    border: 1px solid #c3e6cb; background-color: #d4edda; 
                    border-radius: 6px; margin-top: 20px;">
            ${message}
        </div>
    </c:if>

    <!-- ❌ XÓA HOÀN TOÀN PHẦN HIỂN THỊ ẢNH -->
</div>

<script>
    document.getElementById('photo-upload').onchange = function () {
        const fileName = this.files.length > 0 ? this.files[0].name : 'Chưa có file nào được chọn';
        document.getElementById('file-name-display').textContent = fileName;
    };
</script>

</body>
</html>
