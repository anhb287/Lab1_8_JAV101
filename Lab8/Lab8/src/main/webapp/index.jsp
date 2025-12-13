<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<title><f:message key="index.title" bundle="${bundle}" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">  
</head>
<body>

<header class="page-header"> 
    <img alt="Logo" src="${pageContext.request.contextPath}/img/logofpt.png" class="header-logo">
</header>

<jsp:include page="/menu.jsp"></jsp:include>

<div class="main-content">
    <h1><f:message key="index.welcome" bundle="${bundle}" /></h1>
</div>

<div class="footer">
    <f:message key="index.footer" bundle="${bundle}" />
</div>

</body>
</html>
