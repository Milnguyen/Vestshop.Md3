<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    String keyword = (String) request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-4">

    <h2>Quản lý sản phẩm - Vest Shop</h2>

    <div class="mb-3">
        <a href="<%=request.getContextPath()%>/" class="btn btn-secondary">Trang chủ</a>
        <a href="<%=request.getContextPath()%>/admin/products?action=add" class="btn btn-success">Thêm sản phẩm</a>
        <a href="<%=request.getContextPath()%>/admin/categories" class="btn btn-info">Quản lý danh mục</a>
    </div>

    <form action="<%=request.getContextPath()%>/admin/products" method="get" class="d-flex mb-3">
        <input type="hidden" name="action" value="search">

        <input type="text"
               name="keyword"
               class="form-control me-2"
               placeholder="Tìm kiếm sản phẩm..."
               value="<%= keyword != null ? keyword : "" %>">

        <button class="btn btn-primary" type="submit">Tìm</button>
    </form>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Ảnh</th>
            <th>Tên</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Danh mục</th>
            <th>Hành động</th>
        </tr>
        </thead>

        <tbody>
        <%
            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>

        <tr>
            <td><%=p.getId()%></td>

            <td>
                <img src="<%=request.getContextPath()%>/assets/images/<%=p.getImage()%>"
                     width="80"
                     height="100"
                     style="object-fit: cover;">
            </td>

            <td><%=p.getName()%></td>
            <td><%=String.format("%,.0f", p.getPrice())%> VNĐ</td>
            <td><%=p.getQuantity()%></td>
            <td><%=p.getCategoryName()%></td>

            <td>
                <a href="<%=request.getContextPath()%>/admin/products?action=edit&id=<%=p.getId()%>"
                   class="btn btn-warning btn-sm">
                    Sửa
                </a>

                <a href="<%=request.getContextPath()%>/admin/products?action=delete&id=<%=p.getId()%>"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này không?')">
                    Xoá
                </a>
            </td>
        </tr>

        <%
            }
        } else {
        %>

        <tr>
            <td colspan="7" class="text-center">Không có sản phẩm nào.</td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>

</div>

</body>
</html>