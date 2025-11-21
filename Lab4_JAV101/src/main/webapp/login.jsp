<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập tài khoản</title>

<style>
    :root {
        --primary-color: #1f5791;
        --background-color: #f5f7fa;
        --text-color-dark: #333;
        --border-color-light: #e0e0e0;
        --shadow-elevation: 0 8px 30px rgba(0,0,0,0.08);
    }

    body {
        font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        background-color: var(--background-color);
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        color: var(--text-color-dark);
    }

    main {
        flex-grow: 1; 
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .login-container {
        width: 380px;
        background: #ffffff; 
        padding: 45px 35px;
        border-radius: 18px;
        box-shadow: var(--shadow-elevation); 
        text-align: center;
        border: 1px solid #f0f0f0;
    }
    
    h1 {
        font-size: 28px;
        color: var(--primary-color); 
        margin-bottom: 30px;
        font-weight: 700;
        border-bottom: 2px solid var(--border-color-light);
        padding-bottom: 15px;
        letter-spacing: 0.8px;
        text-transform: uppercase;
    }

    .login-form {
        display: flex;
        flex-direction: column;
        gap: 25px; 
    }

    .form-group {
        text-align: left;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-weight: 600;
        color: #555;
        font-size: 15px;
        text-transform: uppercase; 
    }

    input {
        width: 100%;
        padding: 15px 12px;
        border-radius: 10px;
        border: 1px solid var(--border-color-light);
        font-size: 16px;
        background-color: #fcfcfc;
        transition: all 0.2s ease-in-out;
        box-sizing: border-box;
    }

    input:focus {
        border-color: var(--primary-color);
        outline: none;
        background-color: #ffffff;
        box-shadow: 0 0 0 4px rgba(31, 87, 145, 0.1);
    }
    
    .btn-login {
        width: 100%;
        padding: 16px;
        margin-top: 20px;
        font-size: 18px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.1s, box-shadow 0.3s;
        background-color: var(--primary-color);
        color: white;
        font-weight: 700;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        box-shadow: 0 4px 15px rgba(31, 87, 145, 0.4);
    }

    .btn-login:hover {
        background-color: #16406e;
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(31, 87, 145, 0.6);
    }

    .message-box {
        padding: 12px;
        margin-bottom: 25px;
        border-radius: 8px;
        font-weight: 500;
        font-size: 15px;
        text-align: center;
        background-color: #fff0f0;
        color: #cc0000;
        border: 1px solid #f0d0d0;
    }

</style>
</head>
<body>

    <jsp:include page="index.jsp"></jsp:include>

    <main>
        <div class="login-container">
            <h1>Đăng Nhập Hệ Thống</h1>

            <%-- <c:if test="${not empty message}">
                <div class="message-box">
                    <c:choose>
                        <c:when test="${message == 'Enter username and password'}">
                        </c:when>
                        <c:otherwise>
                            ${message}
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if> --%>
            <c:url value="/account/login" var="url" />
            <form action="${url}" method="post" class="login-form">
                
                <div class="form-group">
                    <label for="username">TÊN ĐĂNG NHẬP</label>
                    <input name="username" id="username" placeholder="Nhập tên đăng nhập">
                </div> 

                <div class="form-group">
                    <label for="password">MẬT KHẨU</label>
                    <input name="password" id="password" type="password" placeholder="Nhập mật khẩu">
                </div>
                
                <button type="submit" class="btn-login">ĐĂNG NHẬP</button>
            </form>
        </div>
    </main>

</body>
</html>