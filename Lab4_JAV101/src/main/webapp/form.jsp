<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #90caf9, #e3f2fd);
        margin: 0;
        padding: 0;
    }

    .card {
        width: 480px;
        margin: 3em auto;
        background: white;
        padding: 35px;
        border-radius: 18px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        color: #1976d2;
        margin-bottom: 20px;
    }

    .group {
        margin-bottom: 18px;
    }

    label {
        display: block;
        margin-bottom: 6px;
        color: #444;
        font-weight: 600;
    }

    input[type="text"],
    input[type="password"],
    select {
        width: 100%;
        padding: 12px;
        border: 1px solid #bdbdbd;
        border-radius: 10px;
        font-size: 15px;
        box-sizing: border-box;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    input:focus, select:focus {
        border-color: #1976d2;
        box-shadow: 0 0 0 3px rgba(25,118,210,0.2);
        outline: none;
    }

    .option-group {
        padding-left: 10px;
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    button {
        width: 100%;
        padding: 14px;
        border: none;
        background: #1976d2;
        color: white;
        font-size: 17px;
        border-radius: 10px;
        cursor: pointer;
        margin-top: 10px;
        font-weight: bold;
        transition: 0.25s;
    }

    button:hover {
        background: #0d47a1;
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }

    /* Trang kết quả */
    .result p {
        font-size: 16px;
        margin: 8px 0;
    }

</style>

</head>
<body>

<jsp:include page="index.jsp"></jsp:include>

<!-- ================= FORM NHẬP ================= -->
<c:if test="${status == 'new'}">

<div class="card">
    <h2>Register Account</h2>

    <form action="user/reg" method="post">

        <div class="group">
            <label>Username</label>
            <input type="text" name="username">
        </div>

        <div class="group">
            <label>Password</label>
            <input type="password" name="password">
        </div>

        <div class="group">
            <label>Gender</label>
            <div class="option-group">
                <label><input type="radio" name="gender" value="male" checked> Male</label>
                <label><input type="radio" name="gender" value="female"> Female</label>
            </div>
        </div>

        <div class="group">
            <label><input type="checkbox" name="isHaveFamily"> Have a family?</label>
        </div>

        <div class="group">
            <label>Country</label>
            <select name="country">
                <option value="VN">Vietnam</option>
                <option value="US">United States</option>
                <option value="CN">China</option>
            </select>
        </div>

        <div class="group">
            <label>Hobbies</label>
            <div class="option-group">
                <label><input type="checkbox" name="hobby" value="read"> Reading Books</label>
                <label><input type="checkbox" name="hobby" value="travel"> World Traveling</label>
                <label><input type="checkbox" name="hobby" value="music"> Music</label>
                <label><input type="checkbox" name="hobby" value="code"> Coding</label>
                <label><input type="checkbox" name="hobby" value="other"> Other...</label>
            </div>
        </div>

        <div class="group">
            <label>Note</label>
            <input type="text" name="note">
        </div>

        <button type="submit">Register</button>

    </form>
</div>

</c:if>

<!-- ================= HIỂN THỊ KẾT QUẢ ================= -->
<c:if test="${status == 'user'}">

<div class="card result">
    <h2>Registration Success 🎉</h2>

    <p><strong>Username:</strong> ${user.username}</p>
    <p><strong>Password:</strong> ${user.password}</p>
    <p><strong>Gender:</strong> ${user.gender}</p>
    <p><strong>Have Family:</strong> ${user.haveFamily ? "Yes" : "No"}</p>
    <p><strong>Country:</strong> ${user.country}</p>

    <p><strong>Hobbies:</strong>
        <c:forEach items="${user.hobby}" var="h" varStatus="i">
            ${h}${!i.last ? ", " : ""}
        </c:forEach>
    </p>

    <p><strong>Note:</strong> ${user.note}</p>

</div>

</c:if>

</body>
</html>
