<%@include file="header.jsp"%>
<%@include file="connection.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - TrendFurnish</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        header {
            background-color: #4e54c8;
            padding: 20px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
        }
        
        .logo span {
            color: #e67e22;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 30px;
        }
        
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        nav ul li a:hover {
            color: #e67e22;
        }
        
        .hero {
            background-color: #4e54c8;
            color: #fff;
            padding: 80px 0;
            text-align: center;
        }
        
        .hero h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        
        .hero p {
            font-size: 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .about-section {
            padding: 80px 0;
        }
        
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
        }
        
        .about-content h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        
        .about-content p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        
        .about-image {
            text-align: center;
        }
        
        .about-image img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .mission-section {
            background-color: #f5f5f5;
            padding: 80px 0;
            text-align: center;
        }
        
        .mission-section h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        
        .mission-section p {
            font-size: 18px;
            max-width: 800px;
            margin: 0 auto 40px;
        }
        
        .values-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            max-width: 1000px;
            margin: 0 auto;
        }
        
        .value-card {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s;
        }
        
        .value-card:hover {
            transform: translateY(-10px);
        }
        
        .value-card h3 {
            font-size: 24px;
            margin-bottom: 15px;
            color: #4e54c8;
        }
        
        .value-card p {
            font-size: 16px;
        }
        
        .products-section {
            padding: 80px 0;
            text-align: center;
        }
        
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        
        .product-category {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 10px;
            transition: background-color 0.3s;
        }
        
        .product-category:hover {
            background-color: #e67e22;
            color: #fff;
        }
        
        
        .team-section {
            background-color: #f5f5f5;
            padding: 80px 0;
            text-align: center;
        }
        
        .team-section h2 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        
        .team-section p {
            font-size: 18px;
            max-width: 800px;
            margin: 0 auto 40px;
        }
    
        .social-links a {
            margin-right: 15px;
            font-size: 18px;
        }
        
        .copyright {
            margin-top: 40px;
            border-top: 1px solid #3a506b;
            padding-top: 20px;
            color: #bbb;
        }
        
        @media (max-width: 992px) {
            .about-grid, .values-grid, .products-grid {
                grid-template-columns: 1fr 1fr;
            }
            
            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .about-grid {
                grid-template-columns: 1fr;
            }
            
            .about-image {
                order: -1;
            }
            
            nav ul {
                display: none;
            }
        }
    </style>
</head>
<body>
    <section class="hero">
        <div class="container">
            <h1>About TrendFurnish</h1>
            <p>Your one-stop destination for all your furniture needs</p>
        </div>
    </section>

    <section class="about-section">
        <div class="container">
            <div class="about-grid">
                <div class="about-content">
                    <h2>Who We Are</h2>
                    <p>Welcome to TrendFurnish, your premier online furniture destination. We are dedicated to providing a seamless shopping experience for all your home and office furniture needs.</p>
                    <p>Founded with a vision to simplify furniture shopping, TrendFurnish brings together a wide selection of high-quality, stylish products all in one convenient place. Our team is passionate about helping you create spaces that reflect your personal style and meet your functional requirements.</p>
                    <p>At TrendFurnish, we understand that furniture is more than just functional - it's an expression of your personality and a crucial element in creating comfortable, beautiful spaces where you live and work.</p>
                </div>
                <div class="about-image">
                     <img src="images/48.jpg" alt="TrendFurnish Showroom">
                </div>
            </div>
        </div>
    </section>

    <section class="mission-section">
        <div class="container">
            <h2>Our Mission</h2>
            <p>Our mission at TrendFurnish is to make furniture shopping simple, fast, and comfortable for everyone. We strive to provide an intuitive online experience that helps our customers find exactly what they need with ease.</p>
            
            <div class="values-grid">
                <div class="value-card">
                    <h3>Simplicity</h3>
                    <p>We believe furniture shopping shouldn't be complicated. Our easy-to-navigate website is designed to help you find what you need quickly and effortlessly.</p>
                </div>
                <div class="value-card">
                    <h3>Quality</h3>
                    <p>We curate our collection carefully, ensuring that every piece of furniture meets our high standards for durability, functionality, and style.</p>
                </div>
                <div class="value-card">
                    <h3>Customer Satisfaction</h3>
                    <p>Your satisfaction is our priority. We're committed to providing excellent service from browsing to delivery and beyond.</p>
                </div>
            </div>
        </div>
    </section>
    
</body>
</html>