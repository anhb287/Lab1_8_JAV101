<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Model.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ Hàng</title>
<style>
    table { width: 60%; border-collapse: collapse; margin: 20px auto; }
    th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
    th { background-color: #f2f2f2; }
    .delete-btn {
        padding: 5px 10px;
        background-color: #dc3545;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .delete-btn:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
<jsp:include page="index.jsp" />

<h2 style="text-align:center;">Giỏ Hàng Của Bạn</h2>

<%
    Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
    if(cart == null || cart.isEmpty()){
%>
    <p style="text-align:center;">Giỏ hàng đang trống!</p>
<%
    } else {
%>
<table>
    <tr>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Tổng tiền</th>
        <th>Hành động</th>
    </tr>
    <%
        double grandTotal = 0;
        for(CartItem item : cart.values()){
            double total = item.getPrice() * item.getQuantity();
            grandTotal += total;
    %>
    <tr>
        <td><%= item.getName() %></td>
        <td>$<%= item.getPrice() %></td>
        <td><%= item.getQuantity() %></td>
        <td>$<%= total %></td>
        <td>
            <form action="cartController" method="post" style="margin:0;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="productId" value="<%= item.getId() %>">
                <input type="submit" class="delete-btn" value="Xóa">
            </form>
        </td>
    </tr>
    <% } %>
    <tr>
        <td colspan="4" style="text-align:right;"><strong>Tổng cộng:</strong></td>
        <td><strong>$<%= grandTotal %></strong></td>
    </tr>
</table>
<% } %>

</body>
</html>
