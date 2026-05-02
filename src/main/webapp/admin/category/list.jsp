<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>

<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-4">

    <h2>Quản lý danh mục</h2>

    <div class="mb-3">
        <a href="<%=request.getContextPath()%>/admin/products" class="btn btn-secondary">Quản lý sản phẩm</a>
        <a href="<%=request.getContextPath()%>/admin/categories?action=add" class="btn btn-success">Thêm danh mục</a>
    </div>

    <table class="table table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên danh mục</th>
            <th>Hành động</th>
        </tr>
        </thead>

        <tbody>
        <%
            if (categories != null && !categories.isEmpty()) {
                for (Category c : categories) {
        %>

        <tr>
            <td><%=c.getId()%></td>
            <td><%=c.getName()%></td>
            <td>
                <a href="<%=request.getContextPath()%>/admin/categories?action=delete&id=<%=c.getId()%>"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Bạn có chắc muốn xoá danh mục này không?')">
                    Xoá
                </a>
            </td>
        </tr>

        <%
            }
        } else {
        %>

        <tr>
            <td colspan="3" class="text-center">Chưa có danh mục.</td>
        </tr>

        <%
            }
        %>
        </tbody>
    </table>

</div>

</body>
</html>