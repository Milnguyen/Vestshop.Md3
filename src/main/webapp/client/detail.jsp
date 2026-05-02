<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-5">

    <a href="<%=request.getContextPath()%>/" class="btn btn-secondary mb-3">Quay lại</a>

    <% if (product != null) { %>

    <div class="row">
        <div class="col-md-5">
            <img src="<%=request.getContextPath()%>/assets/images/<%=product.getImage()%>"
                 class="img-fluid"
                 alt="<%=product.getName()%>">
        </div>

        <div class="col-md-7">
            <h2><%=product.getName()%></h2>
            <p><strong>Giá:</strong> <%=String.format("%,.0f", product.getPrice())%> VNĐ</p>
            <p><strong>Số lượng:</strong> <%=product.getQuantity()%></p>
            <p><strong>Danh mục:</strong> <%=product.getCategoryName()%></p>
            <p><strong>Mô tả:</strong></p>
            <p><%=product.getDescription()%></p>
        </div>
    </div>

    <% } else { %>

    <h3>Không tìm thấy sản phẩm.</h3>

    <% } %>

</div>

</body>
</html>
