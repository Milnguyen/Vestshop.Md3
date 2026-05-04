<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <a href="${pageContext.request.contextPath}/" class="btn btn-secondary">
            Trang chủ
        </a>
        <a href="${pageContext.request.contextPath}/admin/products?action=add" class="btn btn-success">Thêm sản phẩm</a>
        <a href="${pageContext.request.contextPath}/admin/categories" class="btn btn-info">Quản lý danh mục</a>
    </div>

    <!-- SEARCH -->
    <form action="${pageContext.request.contextPath}/admin/products" method="get" class="d-flex mb-3">
        <input type="hidden" name="action" value="search">

        <input type="text"
               name="keyword"
               class="form-control me-2"
               placeholder="Tìm kiếm sản phẩm..."
               value="${keyword}">

        <button class="btn btn-primary" type="submit">Tìm</button>
    </form>

    <!-- TABLE -->
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

        <c:choose>
            <c:when test="${not empty products}">
                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.id}</td>

                        <td>
                            <img src="${pageContext.request.contextPath}/images/${p.image}"
                                 width="80"
                                 height="100"
                                 style="object-fit: cover;"
                                 alt="${p.name}">
                        </td>

                        <td>${p.name}</td>

                        <td>
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/> VND
                        </td>

                        <td>${p.quantity}</td>
                        <td>${p.categoryName}</td>

                        <td>
                            <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.id}"
                               class="btn btn-warning btn-sm">
                                Sửa
                            </a>

                            <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.id}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Bạn có chắc muốn xoá sản phẩm này không?')">
                                Xoá
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <tr>
                    <td colspan="7" class="text-center">Không có sản phẩm nào.</td>
                </tr>
            </c:otherwise>

        </c:choose>

        </tbody>
    </table>

</div>

</body>
</html>