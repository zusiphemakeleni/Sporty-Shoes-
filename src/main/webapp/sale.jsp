<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sale Products</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .product {
            flex: 0 0 45%; /* Adjust this value as needed */
            margin: 1%;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-align: center;
        }
        .product img {
            width: 50%; /* Resize images to be half the size */
            height: auto; /* Maintain aspect ratio */
        }
        .product h3 {
            margin-top: 10px;
            font-size: 1.2em;
        }
        .product p {
            margin: 5px 0;
        }
        .product .price {
            color: red;
            font-weight: bold;
        }
        .product .add-to-cart {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <main>
        <div class="product-list">
            <c:forEach var="product" items="${saleProducts}">
                <div class="product">
                    <img src="${product.image}" alt="${product.name}">
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <p class="price">$${product.price}</p>
                    <form action="addToCart" method="post">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="add-to-cart">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </main>
</body>
</html>
