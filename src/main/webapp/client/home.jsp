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
    <title>Vest Shop</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fff;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 70px;
            border-bottom: 1px solid #eee;
        }

        .nav a {
            margin-right: 25px;
            text-decoration: none;
            font-weight: bold;
            color: black;
            font-size: 18px;
        }

        .logo {
            font-size: 32px;
            font-weight: bold;
        }

        .container {
            padding: 50px 70px;
            display: flex;
            gap: 50px;
            flex-wrap: wrap;
        }

        .product-card {
            width: 420px;
            position: relative;
        }

        .product-image-wrap {
            width: 420px;
            height: 500px;
            background: #f5f5f5;
            position: relative;
            overflow: hidden;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .sale-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: orange;
            color: white;
            border-radius: 50%;
            padding: 15px 12px;
            font-size: 14px;
        }

        .dots {
            margin-top: 12px;
        }

        .dot {
            display: inline-block;
            width: 18px;
            height: 18px;
            background: gray;
            border-radius: 50%;
            margin-right: 12px;
        }

        .product-name {
            margin-top: 12px;
            font-size: 20px;
            font-weight: bold;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
        }

        .old-price {
            color: gray;
            text-decoration: line-through;
            margin-left: 10px;
            font-size: 20px;
        }

        .cart-btn {
            float: right;
            width: 40px;
            height: 40px;
            background: black;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="header">
    <div class="nav">
        <a href="#">NỮ</a>
        <a href="#">NAM</a>
        <a href="#">SUMMER SALE</a>
        <a href="#">BỘ SƯU TẬP</a>
    </div>

    <div class="logo">Vest Shop</div>
</div>

<div class="container">

    <c:forEach var="p" items="${products}">
        <div class="product-card">

            <div class="product-image-wrap">
                <a href="${pageContext.request.contextPath}/admin/products?action=detail&id=${p.id}">
                    <img class="product-image"
                         src="${pageContext.request.contextPath}/images/${p.image}"
                         alt="${p.name}">
                </a>

                <div class="sale-badge">-20%</div>
            </div>

            <div class="dots">
                <span class="dot"></span>
                <span class="dot"></span>
                <span class="dot"></span>
            </div>

            <div class="product-name">${p.name}</div>

            <div>
                <span class="price">${p.price} VND</span>
                <span class="old-price">${p.price} VND</span>

                <button class="cart-btn">🛒</button>
            </div>

        </div>
    </c:forEach>

</div>

</body>
</html>