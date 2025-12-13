<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<nav class="main-nav">
    <ul>
        <li>
            <a href="${pageContext.request.contextPath}">
                <f:message key="menu.home" bundle="${bundle}" />
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/department">
                <f:message key="menu.department" bundle="${bundle}" />
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/employee">
                <f:message key="menu.employee" bundle="${bundle}" />
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/logout">
                <f:message key="menu.logout" bundle="${bundle}" />
            </a>
        </li>

        <!-- Chuyển ngôn ngữ -->
        <li>
            <a href="${pageContext.request.contextPath}/change-language?lang=vi">Việt Nam</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/change-language?lang=en">English</a>
        </li>
    </ul>
</nav>
