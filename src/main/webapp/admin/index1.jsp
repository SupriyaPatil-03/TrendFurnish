<%@include file="header.jsp" %>

<!-- Hero Carousel with Modern Furniture Showcase -->
<div class="hero-section position-relative">
    <div id="furnitureCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
        <!-- Indicators/dots -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#furnitureCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#furnitureCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#furnitureCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>

        <!-- The slideshow/carousel -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/45.webp" class="d-block w-100 img-fluid" alt="Modern Living Room" style="height: 700px; object-fit: cover;">
                <div class="carousel-caption text-start slide-in-left">
                    <h1 class="display-3 fw-bold text-white text-shadow">Redefine Your <span class="highlight-text">Living Space</span></h1>
                    <p class="lead mb-4 d-none d-md-block">Discover our collection of designer furniture that transforms houses into homes</p>
                    <div class="d-flex gap-2 flex-wrap">
                        <a href="productliving.jsp" class="btn btn-primary btn-lg rounded-0 px-4 animate-pulse">Shop Now</a>
                        <a href="#virtual-tour" class="btn btn-outline-light btn-lg rounded-0 px-4">Virtual Tour</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/44.webp" class="d-block w-100 img-fluid" alt="Elegant Bedroom" style="height: 700px; object-fit: cover;">
                <div class="carousel-caption text-center slide-in-bottom">
                    <h1 class="display-3 fw-bold text-white text-shadow">Sleep in <span class="highlight-text">Luxury</span></h1>
                    <p class="lead mb-4 d-none d-md-block">Crafted bedroom collections for your perfect sanctuary</p>
                    <div class="d-flex gap-2 justify-content-center flex-wrap">
                        <a href="productbedroom.jsp" class="btn btn-primary btn-lg rounded-0 px-4 animate-pulse">Bedroom Sets</a>
                         </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/46.jpg" class="d-block w-100 img-fluid" alt="Elegant Dining Room" style="height: 700px; object-fit: cover;">
                <div class="carousel-caption text-end slide-in-right">
                    <h1 class="display-3 fw-bold text-white text-shadow">Gather in <span class="highlight-text">Style</span></h1>
                    <p class="lead mb-4 d-none d-md-block">Dining furniture that makes every meal a special occasion</p>
                    <div class="d-flex gap-2 justify-content-end flex-wrap">
                        <a href="productdiningroom.jsp" class="btn btn-primary btn-lg rounded-0 px-4 animate-pulse">Dining Collections</a>
                        <a href="#custom" class="btn btn-outline-light btn-lg rounded-0 px-4">Custom Orders</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hero Carousel Controls with elegant styling -->
        <button class="carousel-control-prev" type="button" data-bs-target="#furnitureCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon custom-control-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#furnitureCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon custom-control-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    
    <!-- Elegant divider -->
    <div class="custom-shape-divider-bottom">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M1200 120L0 16.48 0 0 1200 0 1200 120z" class="shape-fill"></path>
        </svg>
    </div>
</div>

<!-- Collection Categories Section -->
<section id="categories" class="py-5 bg-light">
    <div class="container">
        <div class="text-center mb-5">
            <h6 class="text-primary fw-bold text-uppercase tracking-wider">Explore Our Collections</h6>
            <h2 class="display-5 fw-bold">Curated For Your Lifestyle</h2>
            <div class="divider-line mx-auto"></div>
        </div>
        
        <div class="row g-4">
            <!-- Category 1 -->
            <div class="col-md-4">
                <div class="category-card position-relative overflow-hidden hover-scale">
                    <img src="images/45.webp" alt="Living Room" class="img-fluid w-100">
                    <div class="category-overlay d-flex align-items-center justify-content-center">
                        <div class="text-center">
                            <h3 class="text-white mb-0">Living Room</h3>
                            <a href="productliving.jsp" class="btn btn-outline-light btn-sm mt-3 rounded-0">EXPLORE</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Category 2 -->
            <div class="col-md-4">
                <div class="category-card position-relative overflow-hidden hover-scale">
                    <img src="images/44.webp" alt="Bedroom" class="img-fluid w-100">
                    <div class="category-overlay d-flex align-items-center justify-content-center">
                        <div class="text-center">
                            <h3 class="text-white mb-0">Bedroom</h3>
                            <a href="productbedroom.jsp" class="btn btn-outline-light btn-sm mt-3 rounded-0">EXPLORE</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Category 3 -->
            <div class="col-md-4">
                <div class="category-card position-relative overflow-hidden hover-scale">
                    <img src="images/46.jpg" alt="Dining" class="img-fluid w-100">
                    <div class="category-overlay d-flex align-items-center justify-content-center">
                        <div class="text-center">
                            <h3 class="text-white mb-0">Dining</h3>
                            <a href="productdiningroom.jsp" class="btn btn-outline-light btn-sm mt-3 rounded-0">EXPLORE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- Brand Promise Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row g-4">
            <!-- Promise 1 -->
            <div class="col-md-3">
                <div class="promise-box text-center p-4 h-100">
                    <div class="promise-icon text-primary mb-3">
                        <i class="fas fa-truck fa-2x"></i>
                    </div>
                    <h4 class="h5 mb-2">Free Delivery</h4>
                    <p class="small text-muted mb-0">On all orders</p>
                </div>
            </div>
            
            <!-- Promise 2 -->
            <div class="col-md-3">
                <div class="promise-box text-center p-4 h-100">
                    <div class="promise-icon text-primary mb-3">
                        <i class="fas fa-medal fa-2x"></i>
                    </div>
                    <h4 class="h5 mb-2">10-Year Warranty</h4>
                    <p class="small text-muted mb-0">Quality guaranteed</p>
                </div>
            </div>
            
            <!-- Promise 3 -->
            <div class="col-md-3">
                <div class="promise-box text-center p-4 h-100">
                    <div class="promise-icon text-primary mb-3">
                        <i class="fas fa-exchange-alt fa-2x"></i>
                    </div>
                    <h4 class="h5 mb-2">30-Day Returns</h4>
                    <p class="small text-muted mb-0">Hassle-free return policy</p>
                </div>
            </div>
            
            <!-- Promise 4 -->
            <div class="col-md-3">
                <div class="promise-box text-center p-4 h-100">
                    <div class="promise-icon text-primary mb-3">
                        <i class="fas fa-headset fa-2x"></i>
                    </div>
                    <h4 class="h5 mb-2">24/7 Support</h4>
                    <p class="small text-muted mb-0">Expert assistance anytime</p>
                </div>
            </div>
        </div>
    </div>
</section>



<!-- Testimonials Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="display-5 fw-bold">What Our Customers Say</h2>
            <div class="divider-line mx-auto"></div>
        </div>
        
        <div class="row g-4">
            <!-- Testimonial 1 -->
            <div class="col-md-4">
                <div class="testimonial-card p-4 bg-white shadow-sm h-100">
                    <div class="testimonial-stars mb-3">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                    </div>
                    <p class="testimonial-text mb-4">"The quality of the furniture exceeded my expectations. Each piece is beautifully crafted and the attention to detail is remarkable. My living room has never looked better!"</p>
                    <div class="d-flex align-items-center">
                        <div class="ms-3">
                            <h5 class="mb-0">Sanjay Patil</h5>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Testimonial 2 -->
            <div class="col-md-4">
                <div class="testimonial-card p-4 bg-white shadow-sm h-100">
                    <div class="testimonial-stars mb-3">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                    </div>
                    <p class="testimonial-text mb-4">"I have ordered Back Leatherette Wooden Base Handle Office Chair which is very comfortable and very useful also its quality is really good."</p>
                    <div class="d-flex align-items-center">
                        <div class="ms-3">
                            <h5 class="mb-0">Bhavana Chavan</h5>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Testimonial 3 -->
            <div class="col-md-4">
                <div class="testimonial-card p-4 bg-white shadow-sm h-100">
                    <div class="testimonial-stars mb-3">
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star-half-alt text-warning"></i>
                    </div>
                    <p class="testimonial-text mb-4">"Delivery was prompt, and the assembly service was excellent. The dining table and chairs look even better in person than they did on the website. TrendFurnish has earned a loyal customer!"</p>
                    <div class="d-flex align-items-center">
                        <div class="ms-3">
                            <h5 class="mb-0">Amey Ghadge</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Custom styles for TrendFurnish -->
<style>
    :root {
        --primary: #a67c52;
        --primary-dark: #8c6544;
        --dark: #2c2c2c;
        --light: #f8f9fa;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        color: var(--dark);
    }
    
    .btn-primary {
        background-color: var(--primary);
        border-color: var(--primary);
    }
    
    .btn-primary:hover, .btn-primary:focus {
        background-color: var(--primary-dark);
        border-color: var(--primary-dark);
    }
    
    .text-primary {
        color: var(--primary) !important;
    }
    
    /* Logo styling */
    .navbar-brand {
        font-weight: 700;
        font-size: 1.8rem;
    }
    
    /* Enhanced carousel caption styling */
    .carousel-caption {
        max-width: 600px;
        padding: 2rem;
        background: rgba(0, 0, 0, 0.6);
        border-radius: 0;
        bottom: 20%;
    }
    
    /* Text highlight effect */
    .highlight-text {
        color: var(--primary);
        position: relative;
        z-index: 1;
    }
    
    /* Text shadow for better readability on image backgrounds */
    .text-shadow {
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
    }
    
    /* Custom control icons */
    .custom-control-icon {
        background-color: rgba(0, 0, 0, 0.7);
        width: 50px;
        height: 50px;
        border-radius: 0;
        background-size: 40%;
        transition: all 0.3s ease;
    }
    
    .custom-control-icon:hover {
        background-color: var(--primary);
    }
    
    /* Wave divider at bottom of hero */
    .custom-shape-divider-bottom {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        overflow: hidden;
        line-height: 0;
    }
    
    .custom-shape-divider-bottom svg {
        position: relative;
        display: block;
        width: calc(100% + 1.3px);
        height: 50px;
    }
    
    .custom-shape-divider-bottom .shape-fill {
        fill: var(--light);
    }
    
    /* Category cards styling */
    .category-card {
        height: 350px;
        cursor: pointer;
    }
    
    .category-card img {
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .category-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        opacity: 0;
        transition: opacity 0.3s ease;
    }
    
    .category-card:hover .category-overlay {
        opacity: 1;
    }
    
    .hover-scale:hover img {
        transform: scale(1.05);
    }
    
    /* Product card styling */
    .product-card {
        transition: all 0.3s ease;
        border: 1px solid rgba(0,0,0,0.05);
    }
    
    .product-image {
        height: 250px;
        overflow: hidden;
    }
    
    .product-image img {
        height: 100%;
        width: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .product-card:hover .product-image img {
        transform: scale(1.05);
    }
    
    .product-tag {
        position: absolute;
        top: 10px;
        left: 10px;
        padding: 5px 10px;
        font-size: 12px;
        font-weight: bold;
        text-transform: uppercase;
    }
    
    .product-actions {
        position: absolute