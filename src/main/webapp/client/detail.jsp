<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px 100px;
            background: white;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 30px;
            padding: 10px 18px;
            background: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .detail-box {
            display: flex;
            gap: 80px;
            align-items: flex-start;
        }

        .product-img {
            width: 450px;
            height: 550px;
            object-fit: cover;
            background: #f5f5f5;
        }

        .info h1 {
            font-size: 36px;
            margin-top: 0;
        }

        .info p {
            font-size: 20px;
            line-height: 1.8;
        }

        .label {
            font-weight: bold;
        }

        .not-found {
            font-size: 22px;
            color: red;
        }
    </style>
</head>

<body>

<a href="${pageContext.request.contextPath}/" class="back-btn">Quay lại</a>

<c:choose>
    <c:when test="${not empty product}">
        <div class="detail-box">

            <div>
                <img class="product-img"
                     src="${pageContext.request.contextPath}/images/${product.image}"
                     alt="${product.name}">
            </div>

            <div class="info">
                <h1>${product.name}</h1>

                <p>
                    <span class="label">Giá:</span>
                        ${product.price} VNĐ
                </p>

                <p>
                    <span class="label">Số lượng:</span>
                        ${product.quantity}
                </p>

                <p>
                    <span class="label">Danh mục:</span>
                        ${product.categoryName}
                </p>

                <p>
                    <span class="label">Mô tả:</span>
                </p>

                <p>${product.description}</p>
            </div>

        </div>
    </c:when>

    <c:otherwise>
        <p class="not-found">Không tìm thấy sản phẩm.</p>
    </c:otherwise>
</c:choose>

</body>
</html>