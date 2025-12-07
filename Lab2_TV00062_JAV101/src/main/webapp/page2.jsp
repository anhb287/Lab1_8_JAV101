<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LAB 2 - Bài 2</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #eef2f7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: white;
        width: 420px;
        text-align: center;
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        animation: fadeIn 0.4s ease;
    }

    h2 {
        margin-top: 10px;
        margin-bottom: 15px;
        font-weight: 600;
        color: #333;
    }

    .message {
        font-size: 20px;
        font-weight: bold;
        color: #2b5db6;
        margin-bottom: 20px;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .userinfo-box {
        margin-top: 20px;
        background: #f1f5fb;
        padding: 15px 20px;
        border-radius: 10px;
        border-left: 5px solid #4a90e2;
        text-align: left;
        font-size: 16px;
        color: #444;
        line-height: 1.5;
    }
</style>

</head>
<body>

    <div class="container">
        <h2>-- BÀI 2 --</h2>
        <div class="message">${message}</div>

        <jsp:include page="/user-info.jsp"/>
    </div>

</body>
</html>
