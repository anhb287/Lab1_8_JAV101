<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:choose>
    <c:when test="${empty sessionScope.lang}">
        <f:setLocale value="en_US" scope="session" />
    </c:when>
    <c:otherwise>
        <f:setLocale value="${sessionScope.lang}" scope="session" />
    </c:otherwise>
</c:choose>

<f:setBundle basename="messages" var="bundle" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><f:message key="login.title" bundle="${bundle}" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body class="login-page">

<div class="login-box">

    <h2><f:message key="login.title" bundle="${bundle}" /></h2>

    <c:if test="${not empty error}">
        <div id="alertError" class="alert-error">${error}</div>
        <script>
            setTimeout(() => {
                const a = document.getElementById("alertError");
                if(a){ a.style.opacity = 0; setTimeout(()=>a.remove(), 500); }
            }, 3000);
        </script>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <label for="id"><f:message key="login.username" bundle="${bundle}" /></label>
        <input type="text" id="id" name="id" value="${id}" required>

        <label for="password"><f:message key="login.password" bundle="${bundle}" /></label>
        <input type="password" id="password" name="password" required>

        <button class="btn" type="submit">
            <f:message key="login.button" bundle="${bundle}" />
        </button>
    </form>
</div>

</body>
</html>
