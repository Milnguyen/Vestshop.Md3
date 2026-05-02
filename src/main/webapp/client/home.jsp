<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30/04/2026
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vest Shop</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* HEADER */
        .header {
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            border-bottom: 1px solid #eee;
        }

        .header nav {
            display: flex;
            gap: 20px;
            font-weight: bold;
        }

        .header nav a {
            text-decoration: none;
            color: #111;
        }

        .sale {
            color: red;
        }

        .logo {
            font-size: 28px;
            font-weight: bold;
        }

        .search input {
            padding: 10px;
            width: 250px;
            border: 1px solid #ddd;
        }

        /* GRID */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 40px;
            padding: 40px;
        }

        .product-card {
            position: relative;
        }

        .product-image-wrap {
            position: relative;
            height: 400px;
            background: #f5f5f5;
            overflow: hidden;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .discount {
            position: absolute;
            top: 10px;
            right: 10px;
            background: orange;
            color: white;
            padding: 10px;
            border-radius: 50%;
            font-size: 12px;
        }

        .colors {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .colors span {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: gray;
        }

        .product-name {
            margin-top: 10px;
        }

        .price {
            font-weight: bold;
            font-size: 18px;
        }

        .old-price {
            text-decoration: line-through;
            color: gray;
            margin-left: 5px;
        }

        .cart-btn {
            position: absolute;
            right: 0;
            bottom: 0;
            background: black;
            color: white;
            border: none;
            padding: 8px;
        }
    </style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <nav>
        <a>NỮ</a>
        <a>NAM</a>
        <a class="sale">SUMMER SALE</a>
        <a>BỘ SƯU TẬP</a>
    </nav>

    <div class="logo">Vest Shop</div>

    <div class="search">
        <input type="text" placeholder="Tìm kiếm...">
    </div>
</div>

<!-- PRODUCT GRID -->
<div class="product-grid">

    <c:forEach var="p" items="${products}">
        <div class="product-card">

            <div class="product-image-wrap">
                <img class="product-image"
                     src="${pageContext.request.contextPath}/assets/images/${p.image}"
                     alt="${p.name}">

                <span class="discount">-20%</span>
            </div>

            <div class="colors">
                <span></span>
                <span></span>
                <span></span>
            </div>

            <div class="product-name">${p.name}</div>

            <div>
                <span class="price">${p.price}đ</span>
                <span class="old-price">1.200.000đ</span>
            </div>

            <button class="cart-btn">🛍</button>

        </div>
    </c:forEach>

</div>

</body>
</html>