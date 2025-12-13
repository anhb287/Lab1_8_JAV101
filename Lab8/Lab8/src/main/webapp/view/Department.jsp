<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title><f:message key="dept.title" bundle="${bundle}" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header class="page-header">
    <img src="${pageContext.request.contextPath}/img/logofpt.png" alt="Logo" class="header-logo">
</header>

<jsp:include page="/menu.jsp"></jsp:include>

<c:url var="path" value="/department" />

<div class="content-department">
    <h2 class="title"><f:message key="dept.title" bundle="${bundle}" /></h2>

    <c:if test="${not empty error}">
        <div id="alertError" class="alert-error">${error}</div>
        <script>
            setTimeout(function () {
                const alert = document.getElementById("alertError");
                if (alert) { alert.style.opacity = 0; setTimeout(() => alert.remove(), 500); }
            }, 3000);
        </script>
    </c:if>

    <form method="post">
        <div class="form-group">
            <label><f:message key="dept.id" bundle="${bundle}" /></label>
            <input name="id" value="${item.id}">
        </div>

        <div class="form-group">
            <label><f:message key="dept.name" bundle="${bundle}" /></label>
            <input name="name" value="${item.name}">
        </div>

        <div class="form-group">
            <label><f:message key="dept.desc" bundle="${bundle}" /></label>
            <textarea name="description" rows="3">${item.description}</textarea>
        </div>

        <div class="form-actions">
            <button class="btn" formaction="${path}/create"><f:message key="dept.add" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/update"><f:message key="dept.update" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/delete"><f:message key="dept.delete" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/reset"><f:message key="dept.reset" bundle="${bundle}" /></button>
        </div>
    </form>

    <br>

    <form method="get" action="${pageContext.request.contextPath}/department/search">
        <div class="form-group-inline">
            <label><f:message key="dept.search" bundle="${bundle}" /></label>
            <input type="text" name="searchId"
                   placeholder="<f:message key='dept.search.placeholder' bundle='${bundle}'/>">
            <button class="btn" type="submit"><f:message key="dept.search" bundle="${bundle}" /></button>
        </div>
    </form>

    <table class="table-department">
        <thead>
            <tr>
                <th><f:message key="dept.table.no" bundle="${bundle}" /></th>
                <th><f:message key="dept.id" bundle="${bundle}" /></th>
                <th><f:message key="dept.name" bundle="${bundle}" /></th>
                <th><f:message key="dept.desc" bundle="${bundle}" /></th>
                <th><f:message key="dept.table.action" bundle="${bundle}" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="d" items="${list}" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${d.id}</td>
                    <td>${d.name}</td>
                    <td>${d.description}</td>
                    <td>
                        <a href="${path}/edit/${d.id}" class="edit-link"><f:message key="dept.update" bundle="${bundle}" /></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div class="footer">
    <f:message key="index.footer" bundle="${bundle}" />
</div>

</body>
</html>
