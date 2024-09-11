<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart - Sporty Shoes</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <header>
        <div class="header-top">
            <span>Sale | 50% on selected items</span>
        </div>
        <div class="header-bottom">
            <div class="logo">SportyShoes</div>
            <nav>
                <a href="sale">SALE</a>
                <a href="women">WOMEN</a>
                <a href="kids">KIDS</a>
                <a href="search"><i class="fa fa-search"></i></a>
                <a href="account"><i class="fa fa-user"></i></a>
                <a href="cart"><i class="fa fa-shopping-cart"></i></a>
            </nav>
        </div>
    </header>
    <main>
        <h1>Your Cart</h1>
        <form action="updateCart" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${cart}">
                        <tr>
                            <td>${product.name}</td>
                            <td>$${product.price}</td>
                            <td>
                                <button type="submit" name="action" value="decrease" data-product-id="${product.id}">-</button>
                                <input type="text" name="quantity_${product.id}" value="${product.quantity}" readonly>
                                <button type="submit" name="action" value="increase" data-product-id="${product.id}">+</button>
                            </td>
                            <td>$${product.price * product.quantity}</td>
                            <td>
                                <button type="submit" name="action" value="remove" data-product-id="${product.id}">Remove</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit">Update Cart</button>
        </form>
        <h2>Total: $${total}</h2>
    </main>
</body>
</html>
