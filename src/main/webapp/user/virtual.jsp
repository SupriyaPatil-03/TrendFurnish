<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Virtual Tour - TrendFurnish</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            line-height: 1.6;
            color: #333;
            overflow-x: hidden;
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            z-index: 1000;
            padding: 1rem 0;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 800;
            color: #667eea;
            text-decoration: none;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
            align-items: center;
        }

        .nav-link {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #667eea;
        }

        .cta-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.7rem 1.5rem;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .cta-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000"><polygon fill="rgba(255,255,255,0.05)" points="0,0 1000,300 1000,1000 0,700"/></svg>');
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateX(-50%) translateY(-50%) rotate(0deg); }
            50% { transform: translateX(-50%) translateY(-50%) rotate(180deg); }
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1rem;
            animation: slideUp 1s ease-out;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            animation: slideUp 1s ease-out 0.3s backwards;
        }

        .tour-button {
            background: white;
            color: #667eea;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 8px 30px rgba(255,255,255,0.3);
            animation: slideUp 1s ease-out 0.6s backwards;
        }

        .tour-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(255,255,255,0.4);
            color: #5a6fd8;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Tour Controls */
        .tour-controls {
            position: fixed;
            bottom: 2rem;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            padding: 1rem 2rem;
            display: flex;
            gap: 1rem;
            align-items: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .control-button {
            background: #667eea;
            color: white;
            border: none;
            padding: 0.7rem 1.2rem;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .control-button:hover {
            background: #5a6fd8;
            transform: translateY(-2px);
        }

        .control-button.active {
            background: #764ba2;
            box-shadow: 0 4px 15px rgba(118, 75, 162, 0.3);
        }

        /* Room Selector */
        .room-selector {
            position: fixed;
            top: 50%;
            left: 2rem;
            transform: translateY(-50%);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 1.5rem 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            z-index: 999;
            transition: all 0.3s ease;
        }

        .room-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 0.5rem;
            color: #333;
            text-decoration: none;
        }

        .room-item:hover {
            background: rgba(102, 126, 234, 0.1);
            transform: translateX(5px);
        }

        .room-item.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .room-icon {
            font-size: 1.5rem;
            width: 40px;
            text-align: center;
        }

        .room-name {
            font-weight: 600;
            font-size: 0.9rem;
        }

        /* Tour Content */
        .tour-content {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            transition: all 0.8s ease;
            z-index: 1;
        }

        /* 360 Viewer */
        .viewer-360 {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #1e3c72, #2a5298);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        .viewer-360.active {
            opacity: 1;
        }

        .viewer-placeholder {
            text-align: center;
            color: white;
            padding: 2rem;
            background: rgba(0,0,0,0.3);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }

        .viewer-placeholder h3 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .viewer-placeholder p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        /* Product Hotspots */
        .hotspot {
            position: absolute;
            width: 40px;
            height: 40px;
            background: rgba(102, 126, 234, 0.9);
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(102, 126, 234, 0.3);
            animation: pulse 2s infinite;
        }

        .hotspot:hover {
            transform: scale(1.2);
            background: #764ba2;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0.7);
            }
            70% {
                box-shadow: 0 0 0 20px rgba(102, 126, 234, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0);
            }
        }

        /* Product Info Modal */
        .product-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0.8);
            background: white;
            border-radius: 20px;
            padding: 2rem;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            z-index: 2000;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .product-modal.active {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 1999;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 15px;
            margin-bottom: 1rem;
        }

        .product-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .product-price {
            font-size: 1.3rem;
            font-weight: 600;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .product-description {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .modal-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn-view, .btn-buy {
            flex: 1;
            padding: 0.8rem;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-view {
            background: #f8f9fa;
            color: #333;
        }

        .btn-view:hover {
            background: #e9ecef;
        }

        .btn-buy {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-buy:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .close-modal {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #666;
            transition: color 0.3s ease;
        }

        .close-modal:hover {
            color: #333;
        }

        /* Room Backgrounds */
        .room-living { background-image: url('/api/placeholder/1920/1080?text=Living+Room'); }
        .room-bedroom { background-image: url('/api/placeholder/1920/1080?text=Bedroom'); }
        .room-kitchen { background-image: url('/api/placeholder/1920/1080?text=Kitchen'); }
        .room-office { background-image: url('/api/placeholder/1920/1080?text=Office'); }
        .room-dining { background-image: url('/api/placeholder/1920/1080?text=Dining+Room'); }

        /* Loading Screen */
        .loading-screen {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            z-index: 3000;
            transition: opacity 0.5s ease;
        }

        .loading-spinner {
            width: 60px;
            height: 60px;
            border: 4px solid rgba(255,255,255,0.3);
            border-top: 4px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-bottom: 1rem;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading-text {
            font-size: 1.2rem;
            font-weight: 600;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }

            .room-selector {
                left: 1rem;
                transform: translateY(-50%) scale(0.9);
            }

            .tour-controls {
                bottom: 1rem;
                padding: 0.8rem 1.5rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav-menu {
                display: none;
            }

            .mobile-menu-toggle {
                display: block;
                background: none;
                border: none;
                font-size: 1.5rem;
                color: #333;
                cursor: pointer;
            }
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .slide-in-left {
            animation: slideInLeft 0.5s ease-out;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <!-- Loading Screen -->
    <div class="loading-screen" id="loadingScreen">
        <div class="loading-spinner"></div>
        <div class="loading-text">Loading Virtual Tour...</div>
    </div>

    <!-- Header -->
    <header class="header">
        <div class="nav-container">
            <a href="#" class="logo">TrendFurnish</a>
            <nav>
                <ul class="nav-menu">
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                    <li><a href="gal.jsp" class="nav-link">Products</a></li>
                    <li><a href="about.jsp" class="nav-link">About</a></li>
                    <li><a href="contact.jsp" class="nav-link">Contact</a></li>
                    <li><a href="login.jsp" class="cta-button">Shop Now</a></li>
                </ul>
            </nav>
            <button class="mobile-menu-toggle" style="display: none;">
                <i class="fas fa-bars"></i>
            </button>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="heroSection">
        <div class="hero-content">
            <h1>Experience Furniture Like Never Before</h1>
            <p>Take a 360° virtual tour of our stunning furniture collections and see how they transform spaces</p>
            <a href="#" class="tour-button" onclick="startTour()">
                <i class="fas fa-play"></i>
                Start Virtual Tour
            </a>
        </div>
    </section>

    <!-- Tour Content -->
    <div class="tour-content room-living" id="tourContent" style="display: none;">
        <!-- Hotspots will be dynamically added -->
    </div>

    <!-- 360 Viewer -->
    <div class="viewer-360" id="viewer360">
        <div class="viewer-placeholder">
            <h3>360° Room View</h3>
            <p>Drag to look around the room and discover our furniture</p>
        </div>
    </div>

    <!-- Room Selector -->
    <div class="room-selector slide-in-left" id="roomSelector" style="display: none;">
        <a href="#" class="room-item active" data-room="living">
            <div class="room-icon">
                <i class="fas fa-couch"></i>
            </div>
            <div class="room-name">Living Room</div>
        </a>
        <a href="#" class="room-item" data-room="bedroom">
            <div class="room-icon">
                <i class="fas fa-bed"></i>
            </div>
            <div class="room-name">Bedroom</div>
        </a>
        <a href="#" class="room-item" data-room="kitchen">
            <div class="room-icon">
                <i class="fas fa-utensils"></i>
            </div>
            <div class="room-name">Kitchen</div>
        </a>
        <a href="#" class="room-item" data-room="office">
            <div class="room-icon">
                <i class="fas fa-desktop"></i>
            </div>
            <div class="room-name">Office</div>
        </a>
        <a href="#" class="room-item" data-room="dining">
            <div class="room-icon">
                <i class="fas fa-table"></i>
            </div>
            <div class="room-name">Dining Room</div>
        </a>
    </div>

    <!-- Tour Controls -->
    <div class="tour-controls" id="tourControls" style="display: none;">
        <button class="control-button active" id="btn2D">
            <i class="fas fa-image"></i>
            2D View
        </button>
        <button class="control-button" id="btn360">
            <i class="fas fa-globe"></i>
            360° View
        </button>
        <button class="control-button" id="btnInfo">
            <i class="fas fa-info-circle"></i>
            Room Info
        </button>
        <button class="control-button" id="btnExit">
            <i class="fas fa-times"></i>
            Exit Tour
        </button>
    </div>

    <!-- Product Modal -->
    <div class="modal-overlay" id="modalOverlay"></div>
    <div class="product-modal" id="productModal">
        <button class="close-modal" onclick="closeProductModal()">
            <i class="fas fa-times"></i>
        </button>
        <img src="/api/placeholder/400/200" alt="Product" class="product-image" id="modalProductImage">
        <h3 class="product-title" id="modalProductTitle">Product Name</h3>
        <div class="product-price" id="modalProductPrice">12,999</div>
        <p class="product-description" id="modalProductDescription">
            This is a premium quality furniture piece crafted with attention to detail and comfort.
        </p>
        <div class="modal-buttons">
            <button class="btn-view">View Details</button>
            <button class="btn-buy">Add to Cart</button>
        </div>
    </div>

    <script>
        // Sample product data
        const roomData = {
            living: {
                name: "Modern Living Room",
                description: "A contemporary living space with comfort and style",
                products: [
                    { id: 1, name: "Modern Sofa Set", price: "Rs45,999", x: "25%", y: "60%", image: "/api/placeholder/400/300?text=Modern+Sofa" },
                    { id: 2, name: "Coffee Table", price: "Rs12,999", x: "45%", y: "70%", image: "/api/placeholder/400/300?text=Coffee+Table" },
                    { id: 3, name: "Floor Lamp", price: "Rs8,999", x: "75%", y: "45%", image: "/api/placeholder/400/300?text=Floor+Lamp" }
                ]
            },
            bedroom: {
                name: "Elegant Bedroom",
                description: "A peaceful retreat with luxurious furniture",
                products: [
                    { id: 4, name: "King Size Bed", price: "Rs65,999", x: "50%", y: "55%", image: "/api/placeholder/400/300?text=King+Bed" },
                    { id: 5, name: "Wardrobe", price: "Rs55,999", x: "20%", y: "40%", image: "/api/placeholder/400/300?text=Wardrobe" },
                    { id: 6, name: "Bedside Table", price: "Rs15,999", x: "75%", y: "65%", image: "/api/placeholder/400/300?text=Bedside+Table" }
                ]
            },
            kitchen: {
                name: "Modern Kitchen",
                description: "Functional and stylish kitchen furniture",
                products: [
                    { id: 7, name: "Kitchen Island", price: "Rs75,999", x: "50%", y: "60%", image: "/api/placeholder/400/300?text=Kitchen+Island" },
                    { id: 8, name: "Bar Stools", price: "Rs25,999", x: "35%", y: "55%", image: "/api/placeholder/400/300?text=Bar+Stools" },
                    { id: 9, name: "Cabinet Set", price: "Rs95,999", x: "75%", y: "45%", image: "/api/placeholder/400/300?text=Kitchen+Cabinet" }
                ]
            },
            office: {
                name: "Professional Office",
                description: "Boost productivity with ergonomic furniture",
                products: [
                    { id: 10, name: "Executive Desk", price: "Rs45,999", x: "40%", y: "65%", image: "/api/placeholder/400/300?text=Executive+Desk" },
                    { id: 11, name: "Office Chair", price: "Rs25,999", x: "35%", y: "50%", image: "/api/placeholder/400/300?text=Office+Chair" },
                    { id: 12, name: "Bookshelf", price: "Rs35,999", x: "80%", y: "40%", image: "/api/placeholder/400/300?text=Bookshelf" }
                ]
            },
            dining: {
                name: "Elegant Dining Room",
                description: "Perfect space for family gatherings",
                products: [
                    { id: 13, name: "Dining Table", price: "Rs55,999", x: "50%", y: "60%", image: "/api/placeholder/400/300?text=Dining+Table" },
                    { id: 14, name: "Dining Chairs", price: "Rs35,999", x: "40%", y: "70%", image: "/api/placeholder/400/300?text=Dining+Chairs" },
                    { id: 15, name: "Buffet Cabinet", price: "Rs45,999", x: "25%", y: "45%", image: "/api/placeholder/400/300?text=Buffet+Cabinet" }
                ]
            }
        };

        let currentRoom = 'living';
        let tourMode = '2d';

        // Initialize the tour
        function initializeTour() {
            // Hide loading screen after 2 seconds
            setTimeout(() => {
                document.getElementById('loadingScreen').style.opacity = '0';
                setTimeout(() => {
                    document.getElementById('loadingScreen').style.display = 'none';
                }, 500);
            }, 2000);

            // Setup event listeners
            setupEventListeners();
        }

        function setupEventListeners() {
            // Room selector
            document.querySelectorAll('.room-item').forEach(item => {
                item.addEventListener('click', (e) => {
                    e.preventDefault();
                    const room = e.currentTarget.dataset.room;
                    switchRoom(room);
                });
            });

            // Tour controls
            document.getElementById('btn2D').addEventListener('click', () => setTourMode('2d'));
            document.getElementById('btn360').addEventListener('click', () => setTourMode('360'));
            document.getElementById('btnInfo').addEventListener('click', showRoomInfo);
            document.getElementById('btnExit').addEventListener('click', exitTour);

            // Modal overlay
            document.getElementById('modalOverlay').addEventListener('click', closeProductModal);
        }

        function startTour() {
            document.getElementById('heroSection').style.display = 'none';
            document.getElementById('tourContent').style.display = 'block';
            document.getElementById('roomSelector').style.display = 'block';
            document.getElementById('tourControls').style.display = 'flex';
            
            switchRoom('living');
        }

        function switchRoom(room) {
            currentRoom = room;
            
            // Update active room indicator
            document.querySelectorAll('.room-item').forEach(item => {
                item.classList.remove('active');
            });
            document.querySelector(`[data-room="${room}"]`).classList.add('active');
            
            // Update background
            const tourContent = document.getElementById('tourContent');
            tourContent.className = `tour-content room-${room} fade-in`;
            
            // Clear existing hotspots
            const hotspots = document.querySelectorAll('.hotspot');
            hotspots.forEach(hotspot => hotspot.remove());
            
            // Add new hotspots
            const products = roomData[room].products;
            products.forEach(product => {
                createHotspot(product);
            });
        }

        function createHotspot(product) {
            const hotspot = document.createElement('div');
            hotspot.className = 'hotspot';
            hotspot.style.left = product.x;
            hotspot.style.top = product.y;
            hotspot.innerHTML = '<i class="fas fa-info"></i>';
            
            hotspot.addEventListener('click', () => {
                showProductModal(product);
            });
            
            document.getElementById('tourContent').appendChild(hotspot);
        }

        function showProductModal(product) {
            document.getElementById('modalProductImage').src = product.image;
            document.getElementById('modalProductTitle').textContent = product.name;
            document.getElementById('modalProductPrice').textContent = product.price;
            document.getElementById('modalProductDescription').textContent = 
                `Experience the perfect blend of style and functionality with this premium ${product.name.toLowerCase()}. Crafted with high-quality materials for lasting durability.`;
            
            document.getElementById('modalOverlay').classList.add('active');
            document.getElementById('productModal').classList.add('active');
        }

        function closeProductModal() {
            document.getElementById('modalOverlay').classList.remove('active');
            document.getElementById('productModal').classList.remove('active');
        }

        function setTourMode(mode) {
            tourMode = mode;
            
            // Update active control button
            document.querySelectorAll('.control-button').forEach(btn => {
                btn.classList.remove('active');
            });
            
            if (mode === '2d') {
                document.getElementById('btn2D').classList.add('active');
                document.getElementById('tourContent').style.display = 'block';
                document.getElementById('viewer360').classList.remove('active');
            } else if (mode === '360') {
                document.getElementById('btn360').classList.add('active');
                document.getElementById('tourContent').style.display = 'block';
                document.getElementById('viewer360').classList.add('active');
            }
        }

        function showRoomInfo() {
            const room = roomData[currentRoom];
            alert(`${room.name}\n\n${room.description}\n\nProducts available: ${room.products.length}`);
        }

        function exitTour() {
            document.getElementById('heroSection').style.display = 'flex';
            document.getElementById('tourContent').style.display = 'none';
            document.getElementById('roomSelector').style.display = 'none';
            document.getElementById('tourControls').style.display = 'none';
            document.getElementById('viewer360').classList.remove('active');
            closeProductModal();
        }

        // Enhanced interactivity
        function addInteractiveFeatures() {
            // Add smooth scrolling
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        target.scrollIntoView({
                            behavior: 'smooth'
                        });
                    }
                });
            });

            // Add keyboard navigation
            document.addEventListener('keydown', function(e) {
                if (document.getElementById('tourContent').style.display === 'block') {
                    switch(e.key) {
                        case 'Escape':
                            exitTour();
                            break;
                        case '1':
                            switchRoom('living');
                            break;
                        case '2':
                            switchRoom('bedroom');
                            break;
                        case '3':
                            switchRoom('kitchen');
                            break;
                        case '4':
                            switchRoom('office');
                            break;
                        case '5':
                            switchRoom('dining');
                            break;
                        case ' ':
                            e.preventDefault();
                            setTourMode(tourMode === '2d' ? '360' : '2d');
                            break;
                    }
                }
            });

            // Add mouse drag for 360 view simulation
            let isDragging = false;
            let startX = 0;
            const viewer360 = document.getElementById('viewer360');

            viewer360.addEventListener('mousedown', (e) => {
                isDragging = true;
                startX = e.clientX;
                viewer360.style.cursor = 'grabbing';
            });

            document.addEventListener('mousemove', (e) => {
                if (isDragging) {
                    const deltaX = e.clientX - startX;
                    const rotation = deltaX * 0.5;
                    viewer360.style.transform = `rotateY(${rotation}deg)`;
                }
            });

            document.addEventListener('mouseup', () => {
                isDragging = false;
                viewer360.style.cursor = 'grab';
                viewer360.style.transform = 'rotateY(0deg)';
            });

            // Add touch support for mobile
            let touchStartX = 0;
            
            viewer360.addEventListener('touchstart', (e) => {
                touchStartX = e.touches[0].clientX;
            });

            viewer360.addEventListener('touchmove', (e) => {
                e.preventDefault();
                const touchX = e.touches[0].clientX;
                const deltaX = touchX - touchStartX;
                const rotation = deltaX * 0.3;
                viewer360.style.transform = `rotateY(${rotation}deg)`;
            });

            viewer360.addEventListener('touchend', () => {
                viewer360.style.transform = 'rotateY(0deg)';
            });

            // Auto-rotate in 360 view when idle
            let autoRotateInterval;
            
            function startAutoRotate() {
                clearInterval(autoRotateInterval);
                autoRotateInterval = setInterval(() => {
                    if (tourMode === '360' && document.getElementById('viewer360').classList.contains('active')) {
                        const currentRotation = parseFloat(viewer360.style.transform.replace(/[^\d.-]/g, '')) || 0;
                        viewer360.style.transform = `rotateY(${currentRotation + 1}deg)`;
                    }
                }, 50);
            }

            function stopAutoRotate() {
                clearInterval(autoRotateInterval);
            }

            viewer360.addEventListener('mouseenter', stopAutoRotate);
            viewer360.addEventListener('mouseleave', startAutoRotate);
        }

        // Preload images for better performance
        function preloadImages() {
            const imageUrls = [];
            Object.values(roomData).forEach(room => {
                room.products.forEach(product => {
                    imageUrls.push(product.image);
                });
            });

            imageUrls.forEach(url => {
                const img = new Image();
                img.src = url;
            });
        }

        // Add tour statistics tracking
        let tourStats = {
            startTime: null,
            roomVisits: {},
            productViews: {}
        };

        function trackTourStart() {
            tourStats.startTime = new Date();
        }

        function trackRoomVisit(room) {
            tourStats.roomVisits[room] = (tourStats.roomVisits[room] || 0) + 1;
        }

        function trackProductView(productId) {
            tourStats.productViews[productId] = (tourStats.productViews[productId] || 0) + 1;
        }

        // Add tour completion modal
        function showTourCompletionModal() {
            const totalTime = Math.round((new Date() - tourStats.startTime) / 1000);
            const roomsVisited = Object.keys(tourStats.roomVisits).length;
            const productsViewed = Object.keys(tourStats.productViews).length;

            const completionHTML = `
                <div style="text-align: center; padding: 2rem;">
                    <i class="fas fa-trophy" style="font-size: 3rem; color: #667eea; margin-bottom: 1rem;"></i>
                    <h2>Tour Complete!</h2>
                    <p>Thank you for exploring TrendFurnish</p>
                    <div style="margin: 1.5rem 0; padding: 1rem; background: #f8f9fa; border-radius: 10px;">
                        <div><strong>Time spent:</strong> ${totalTime} seconds</div>
                        <div><strong>Rooms visited:</strong> ${roomsVisited}/5</div>
                        <div><strong>Products viewed:</strong> ${productsViewed}</div>
                    </div>
                    <div style="display: flex; gap: 1rem; justify-content: center;">
                        <button onclick="restartTour()" class="btn-view">Take Tour Again</button>
                        <button onclick="window.location.href='products.jsp'" class="btn-buy">Shop Now</button>
                    </div>
                </div>
            `;

            document.getElementById('modalProductTitle').innerHTML = completionHTML;
            document.getElementById('modalOverlay').classList.add('active');
            document.getElementById('productModal').classList.add('active');
        }

        function restartTour() {
            closeProductModal();
            tourStats = { startTime: null, roomVisits: {}, productViews: {} };
            switchRoom('living');
            trackTourStart();
        }

        // Enhanced room switching with transition effects
        function enhancedSwitchRoom(room) {
            // Add transition overlay
            const overlay = document.createElement('div');
            overlay.style.cssText = `
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                z-index: 2000;
                opacity: 0;
                transition: opacity 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.5rem;
                font-weight: 600;
            `;
            overlay.textContent = `Entering ${roomData[room].name}...`;
            document.body.appendChild(overlay);

            // Show overlay
            requestAnimationFrame(() => {
                overlay.style.opacity = '1';
            });

            // Switch room after transition
            setTimeout(() => {
                switchRoom(room);
                trackRoomVisit(room);
                
                // Hide overlay
                overlay.style.opacity = '0';
                setTimeout(() => {
                    document.body.removeChild(overlay);
                }, 300);
            }, 500);
        }

        // Replace original switchRoom calls with enhanced version
        function setupEnhancedEventListeners() {
            document.querySelectorAll('.room-item').forEach(item => {
                item.addEventListener('click', (e) => {
                    e.preventDefault();
                    const room = e.currentTarget.dataset.room;
                    enhancedSwitchRoom(room);
                });
            });
        }

        // Add background music toggle
        function addBackgroundMusic() {
            const musicToggle = document.createElement('button');
            musicToggle.className = 'control-button';
            musicToggle.innerHTML = '<i class="fas fa-music"></i> Music';
            musicToggle.style.position = 'fixed';
            musicToggle.style.top = '50%';
            musicToggle.style.right = '2rem';
            musicToggle.style.transform = 'translateY(-50%)';
            musicToggle.style.zIndex = '999';

            let musicPlaying = false;
            musicToggle.addEventListener('click', () => {
                musicPlaying = !musicPlaying;
                musicToggle.innerHTML = musicPlaying ? 
                    '<i class="fas fa-pause"></i> Pause' : 
                    '<i class="fas fa-music"></i> Music';
                
                // In a real implementation, you would start/stop background music here
                console.log(musicPlaying ? 'Music started' : 'Music paused');
            });

            document.body.appendChild(musicToggle);
        }

        // Initialize everything when page loads
        document.addEventListener('DOMContentLoaded', function() {
            initializeTour();
            addInteractiveFeatures();
            preloadImages();
            setupEnhancedEventListeners();
            addBackgroundMusic();
        });

        // Override the original showProductModal to include tracking
        const originalShowProductModal = showProductModal;
        showProductModal = function(product) {
            trackProductView(product.id);
            originalShowProductModal(product);
        };

        // Override the original startTour to include tracking
        const originalStartTour = startTour;
        startTour = function() {
            trackTourStart();
            originalStartTour();
        };

        // Progress indicator
        function createProgressIndicator() {
            const progressContainer = document.createElement('div');
            progressContainer.style.cssText = `
                position: fixed;
                top: 2rem;
                right: 2rem;
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 15px;
                padding: 1rem;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                z-index: 999;
                display: none;
            `;

            progressContainer.innerHTML = `
                <div style="text-align: center; margin-bottom: 0.5rem;">
                    <small style="font-weight: 600; color: #667eea;">Tour Progress</small>
                </div>
                <div id="progressRooms" style="margin-bottom: 0.5rem;">
                    <small>Rooms: <span id="roomsVisited">0</span>/5</small>
                </div>
                <div id="progressProducts">
                    <small>Products: <span id="productsViewed">0</span></small>
                </div>
                <div style="width: 100px; height: 5px; background: #eee; border-radius: 3px; margin-top: 0.5rem;">
                    <div id="progressBar" style="width: 0%; height: 100%; background: linear-gradient(90deg, #667eea, #764ba2); border-radius: 3px; transition: width 0.3s ease;"></div>
                </div>
            `;

            document.body.appendChild(progressContainer);

            // Show progress when tour starts
            const originalStartTourWithProgress = startTour;
            startTour = function() {
                progressContainer.style.display = 'block';
                originalStartTourWithProgress();
            };

            // Update progress
            function updateProgress() {
                const roomsVisited = Object.keys(tourStats.roomVisits).length;
                const productsViewed = Object.keys(tourStats.productViews).length;
                const progress = ((roomsVisited / 5) * 60) + ((productsViewed / 15) * 40);

                document.getElementById('roomsVisited').textContent = roomsVisited;
                document.getElementById('productsViewed').textContent = productsViewed;
                document.getElementById('progressBar').style.width = `${Math.min(progress, 100)}%`;

                // Show completion modal when all rooms visited
                if (roomsVisited >= 5 && progress >= 80) {
                    setTimeout(showTourCompletionModal, 1000);
                }
            }

            // Override tracking functions to update progress
            const originalTrackRoomVisit = trackRoomVisit;
            trackRoomVisit = function(room) {
                originalTrackRoomVisit(room);
                updateProgress();
            };

            const originalTrackProductView = trackProductView;
            trackProductView = function(productId) {
                originalTrackProductView(productId);
                updateProgress();
            };
        }

        // Initialize progress indicator
        document.addEventListener('DOMContentLoaded', function() {
            createProgressIndicator();
        });
    </script>
</body>
</html>