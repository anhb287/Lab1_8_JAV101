<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %> 
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<html>
<head>
    <title>Bài 4: Xử Lý Chuỗi</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
            color: #333;
        }
        
        /* Container chính cho nội dung bài tập */
        .content-area {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        /* Tiêu đề bài tập */
        .content-area h2 {
            color: #7b1fa2; 
            border-bottom: 2px solid #e0c0ff;
            padding-bottom: 8px;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 1.8em;
        }

        /* Định dạng các mục chi tiết (ul) */
        .detail-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .detail-list li {
            background-color: #f3e5f5; 
            padding: 15px 20px;
            margin-bottom: 15px;
            border-radius: 5px;
            border-left: 5px solid #6a1b9a; 
            font-size: 1.1em;
        }

        /* Style cho Title (fn:toUpperCase) */
        .detail-list li strong {
            color: #d84315; 
            display: block;
            margin-top: 5px;
        }

        /* Style cho Content */
        .detail-list li:last-child {
            background-color: #fff8e1;
            border-left: 5px solid #ffc107; 
            white-space: pre-wrap; 
            font-size: 1em;
            color: #333;
        }
        
        /* Style cho chú thích đã cắt chuỗi */
        .detail-list li p {
            font-size: 0.9em;
            color: #00796b; 
            margin-top: 10px;
            font-style: italic;
        }
    </style>
</head>
<body>
<jsp:include page="index.jsp" />
<div class="content-area">
    <h2>BÀI 4: XỬ LÝ CHUỖI</h2>
    
    <p>Thông tin bản tin đã được xử lý:</p>
    <ul class="detail-list">
        <li>Title: 
            <strong>${fn:toUpperCase(item.title)}</strong>
        </li>
        <li>Content:
            <c:choose>
                <c:when test="${fn:length(item.content) > 250}">
                    ${fn:substring(item.content, 0, 250)}... 
                    <p>Đã cắt chỉ còn 250 ký tự đầu</p>
                </c:when>
                <c:otherwise>
                    ${item.content}
                    <p>Hiển thị toàn bộ</p>
                </c:otherwise>
            </c:choose>
        </li>
    </ul> 
</div>

</body>