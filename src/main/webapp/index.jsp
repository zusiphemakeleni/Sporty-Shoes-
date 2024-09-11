<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sporty Shoes</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .header-top {
            background-color: white;
            color: black;
            text-align: center;
            padding: 5px 0;
        }
        .header-bottom {
            background-color: black;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }
        .header-bottom .logo {
            font-size: 1.5em;
        }
        .header-bottom nav a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
        }
        .hero-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }
        .hero-section img {
            max-width: 50%;
            height: auto;
        }
        .hero-text {
            max-width: 40%;
        }
        .hero-text h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }
        .hero-text button {
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }
        .slideshow-container {
            max-width: 40%;
            position: relative;
            margin-left: 20px;
        }
        .slide {
            display: none;
        }
        .slide img {
            width: 100%;
        }
        .active {
            display: block;
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="header.jsp" />
    </header>
    <main>
        <div class="hero-section">
            <img src="images/background.jpg" alt="Hero Image">
            <div class="hero-text">
                <h1>Discover the New Collection</h1>
                <button onclick="window.location.href='women'">Shop Now</button>
            </div>
            <div class="slideshow-container">
                <c:forEach var="product" items="${saleProducts}">
                    <div class="slide">
                        <img src="${product.image}" alt="${product.name}">
                        <div class="slide-text">
                            <h3>${product.name}</h3>
                            <p>${product.description}</p>
                            <p class="price">$${product.price}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.querySelectorAll(".slide");
            for (let i = 0; i < slides.length; i++) {
                slides[i].classList.remove("active");
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            slides[slideIndex-1].classList.add("active");
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
    </script>
</body>
</html>
