<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %> 
<html>
<head>
    <title>Bài 3: Định dạng Thời gian và Số</title>
    
    <style>
        /* CSS cho bố cục chung */
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
            color: #7b1fa2; /* Màu tím đậm */
            border-bottom: 2px solid #e0c0ff;
            padding-bottom: 8px;
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 1.8em;
        }

        /* Định dạng danh sách chi tiết */
        .item-details {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .item-details li {
            background-color: #f3e5f5; /* Nền tím nhạt */
            padding: 15px 20px;
            margin-bottom: 10px;
            border-radius: 5px;
            border-left: 5px solid #6a1b9a; /* Thanh màu tím nổi bật */
            font-size: 1.1em;
            color: #4a148c;
        }
        
        /* Highlight giá trị */
        .item-details li b {
            font-weight: 700;
            color: #388e3c; /* Màu xanh lá cho giá trị số/tiền */
        }
        
        /* Định dạng ngày tháng */
        .item-details li:last-child b {
            color: #d32f2f; /* Màu đỏ cho ngày tháng */
        }
    </style>
</head>
<body>
<jsp:include page="index.jsp" />
<div class="content-area">
    <h2>BÀI 3: ĐỊNH DẠNG THỜI GIAN VÀ SỐ</h2>
    
    <ul class="item-details">
        <li>Name: <b>${item.name}</b></li>
        <li>Price:
            <b><fmt:formatNumber value="${item.price}" pattern="#,###.00"/></b> </li>
        <li>Date:
            <b><fmt:formatDate value="${item.date}" pattern="dd MMM, yyyy"/></b> </li>
    </ul>

</div>

</body>
</html>