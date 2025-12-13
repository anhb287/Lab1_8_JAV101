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
<title><f:message key="emp.title" bundle="${bundle}" /></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<header class="page-header">
    <img src="${pageContext.request.contextPath}/img/logofpt.png" alt="Logo" class="header-logo">
</header>

<jsp:include page="/menu.jsp"></jsp:include>

<c:url var="path" value="/employee" />

<div class="content-department">
    <h2 class="title"><f:message key="emp.title" bundle="${bundle}" /></h2>

    <c:if test="${not empty error}">
        <div id="alertError" class="alert-error">${error}</div>
        <script>
            setTimeout(function () {
                const alert = document.getElementById("alertError");
                if (alert) { alert.style.opacity = 0; setTimeout(() => alert.remove(), 500); }
            }, 3000);
        </script>
    </c:if>

    <form method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label><f:message key="emp.id" bundle="${bundle}" /></label>
            <input name="id" value="${item.id}">
        </div>

        <div class="form-group">
            <label><f:message key="emp.fullname" bundle="${bundle}" /></label>
            <input name="fullname" value="${item.fullname}">
        </div>

        <div class="form-group">
            <label><f:message key="emp.password" bundle="${bundle}" /></label>
            <input type="password" name="password" value="${item.password}">
        </div>

        <div class="form-group">
            <label><f:message key="emp.photo" bundle="${bundle}" /></label>
            <input type="file" name="photo">
            <c:if test="${not empty item.photo}">
                <img src="${pageContext.request.contextPath}/uploads/${item.photo}" width="100">
            </c:if>
        </div>

        <div class="form-group-inline">
            <label><f:message key="emp.gender" bundle="${bundle}" /></label>
            <input type="radio" name="gender" value="true" ${item.gender ? 'checked' : ''}>
            <f:message key="emp.male" bundle="${bundle}" />
            <input type="radio" name="gender" value="false" ${!item.gender ? 'checked' : ''}>
            <f:message key="emp.female" bundle="${bundle}" />
        </div>

        <div class="form-group">
            <label><f:message key="emp.birthday" bundle="${bundle}" /></label>
            <input type="date" name="birthday" value="${item.birthday}">
        </div>

        <div class="form-group">
            <label><f:message key="emp.salary" bundle="${bundle}" /></label>
            <input type="number" name="salary" value="${item.salary}">
        </div>

        <div class="form-group">
            <label><f:message key="emp.department" bundle="${bundle}" /></label>
            <select name="departmentId">
                <c:forEach var="d" items="${departments}">
                    <option value="${d.id}" ${d.id == item.departmentId ? 'selected' : ''}>${d.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-actions">
            <button class="btn" formaction="${path}/create"><f:message key="emp.add" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/update"><f:message key="emp.update" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/delete"><f:message key="emp.delete" bundle="${bundle}" /></button>
            <button class="btn" formaction="${path}/reset"><f:message key="emp.reset" bundle="${bundle}" /></button>
        </div>
    </form>

    <br>

    <form method="get" action="${pageContext.request.contextPath}/employee/search">
        <div class="form-group-inline">
            <label><f:message key="emp.search" bundle="${bundle}" /></label>
            <input type="text" name="searchId"
                   placeholder="<f:message key='emp.search.placeholder' bundle='${bundle}'/>">
            <button class="btn" type="submit"><f:message key="emp.search.button" bundle="${bundle}" /></button>
        </div>
    </form>

    <table class="table-department">
        <thead>
            <tr>
                <th>No.</th>
                <th><f:message key="emp.id" bundle="${bundle}" /></th>
                <th><f:message key="emp.fullname" bundle="${bundle}" /></th>
                <th><f:message key="emp.gender" bundle="${bundle}" /></th>
                <th><f:message key="emp.birthday" bundle="${bundle}" /></th>
                <th><f:message key="emp.salary" bundle="${bundle}" /></th>
                <th><f:message key="emp.department" bundle="${bundle}" /></th>
                <th><f:message key="emp.photo" bundle="${bundle}" /></th>
                <th><f:message key="dept.table.action" bundle="${bundle}" /></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="e" items="${list}" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${e.id}</td>
                    <td>${e.fullname}</td>
                    <td>${e.gender ? 'Male' : 'Female'}</td>
                    <td>${e.birthday}</td>
                    <td>${e.salary}</td>
                    <td>${e.departmentName}</td>
                    <td>
                        <c:if test="${not empty e.photo}">
                            <img src="${pageContext.request.contextPath}/uploads/${e.photo}" width="70">
                        </c:if>
                    </td>
                    <td>
                        <a href="${path}/edit/${e.id}" class="edit-link"><f:message key="emp.update" bundle="${bundle}" /></a>
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
