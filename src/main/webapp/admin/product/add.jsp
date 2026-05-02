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
    <title>Thêm sản phẩm</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container mt-4">

    <h2>Thêm sản phẩm</h2>

    <form action="<%=request.getContextPath()%>/admin/products" method="post">

        <input type="hidden" name="action" value="insert">

        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Giá</label>
            <input type="number" name="price" class="form-control" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số lượng</label>
            <input type="number" name="quantity" class="form-control" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Tên ảnh</label>
            <input type="text" name="image" class="form-control" placeholder="vest1.jpg">
            <small class="text-muted">Ảnh đặt trong thư mục assets/images</small>
        </div>

        <div class="mb-3">
            <label class="form-label">Danh mục</label>

            <select name="categoryId" class="form-select" required>
                <option value="">-- Chọn danh mục --</option>

                <%
                    if (categories != null && !categories.isEmpty()) {
                        for (Category c : categories) {
                %>
                <option value="<%= c.getId() %>"><%= c.getName() %></option>
                <%
                        }
                    }
                %>
            </select>

            <%
                if (categories == null || categories.isEmpty()) {
            %>
            <small class="text-danger">
                Chưa có danh mục. Kiểm tra ProductServlet đã truyền categories chưa.
            </small>
            <%
                }
            %>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="4"></textarea>
        </div>

        <button type="submit" class="btn btn-success">Lưu</button>
        <a href="<%=request.getContextPath()%>/admin/products" class="btn btn-secondary">Quay lại</a>

    </form>

</div>

</body>
</html>