<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
    List<Category> categories = (List<Category>) request.getAttribute("categories");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-4">

    <h2>Sửa sản phẩm</h2>

    <% if (product != null) { %>

    <form action="<%=request.getContextPath()%>/admin/products" method="post">

        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%=product.getId()%>">

        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" class="form-control" value="<%=product.getName()%>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" name="price" class="form-control" value="<%=product.getPrice()%>" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số lượng</label>
            <input type="number" name="quantity" class="form-control" value="<%=product.getQuantity()%>" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Tên ảnh</label>
            <input type="text" name="image" class="form-control" value="<%=product.getImage()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Danh mục</label>

            <select name="categoryId" class="form-select" required>
                <%
                    if (categories != null) {
                        for (Category c : categories) {
                %>

                <option value="<%=c.getId()%>"
                        <%= c.getId() == product.getCategoryId() ? "selected" : "" %>>
                    <%=c.getName()%>
                </option>

                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="4"><%=product.getDescription()%></textarea>
        </div>

        <button type="submit" class="btn btn-warning">Cập nhật</button>
        <a href="<%=request.getContextPath()%>/admin/products" class="btn btn-secondary">Quay lại</a>

    </form>

    <% } else { %>

    <p>Không tìm thấy sản phẩm.</p>

    <% } %>

</div>

</body>
</html>
