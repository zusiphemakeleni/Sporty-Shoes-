<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.sportyshoes.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sporty Shoes - Products</title>
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
                <a href="home">Home</a>
                <a href="products">Products</a>
                <a href="cart">Cart</a>
                <a href="checkout">Checkout</a>
            </nav>
            <div class="header-icons">
                <a href="#"><i class="fas fa-search"></i></a>
                <a href="#"><i class="fas fa-user"></i></a>
                <a href="#"><i class="fas fa-shopping-cart"></i></a>
            </div>
        </div>
    </header>
    <main>
        <h1>Our Products</h1>
        <div class="product-list">
            <% 
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
            <div class="product-item">
                <img src="images/<%= product.getImage() %>" alt="<%= product.getName() %>">
                <h2><%= product.getName() %></h2>
                <p><%= product.getDescription() %></p>
                <p>$<%= product.getPrice() %></p>
                <button>Add to Cart</button>
            </div>
            <% 
                    }
                } else {
            %>
            <p>No products available.</p>
            <% 
                }
            %>
        </div>
    </main>
</body>
</html>
